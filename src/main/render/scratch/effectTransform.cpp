//
// Created by Khyber on 5/2/2019.
//

#include "effectTransform.h"
#include "shaderEffects.h"
#include "Drawable.h"

namespace {
    
    using render::scratch::Vec2;
    
    using Color3 = math::Vec<3, f32>;
    
    constexpr f32 rgbToHue(const Color3& rgb, f32 max, f32 d) noexcept {
        const auto[r, g, b] = rgb;
        if (max == r) {
            return ((g - b) / d) + (g < b ? 6 : 0);
        } else if (max == g) {
            return ((b - r) / d) + 2;
        } else if (max == b) {
            return ((r - g) / d) + 4;
        } else {
            return 0; // TODO is this the right default value?
        }
    }
    
    constexpr Color3 rgbToHsl(const Color3& rgb) noexcept {
        const auto rgb2 = rgb / 255.0f;
        const auto min = rgb2.fold(math::min<f32>);
        const auto max = rgb2.fold(math::max<f32>);
        const auto l = (min + max) * 0.5f;
        if (min == max) {
            return Color3({0, 0, l});
        }
        const auto d = max - min;
        const auto s = l > 0.5 ? d / (2 - max - min) : d / (max + min);
        const auto h = rgbToHue(rgb2, max, d) / 6.0f;
        return Color3({h, s, l});
    }
    
    constexpr f32 hue2rgb(f32 p, f32 q, f32 t) noexcept {
        if (t < 0) {
            t++;
        }
        if (t > 1) {
            t--;
        }
        if (t < 1. / 6) {
            return p + ((q - p) * 6 * t);
        }
        if (t < 1. / 2) {
            return q;
        }
        if (t < 2. / 3) {
            return p + ((q - p) * ((2. / 3) - t) * 6);
        }
        return p;
    }
    
    constexpr Color3 hslToRgb01(const Color3& hsl) noexcept {
        const auto[h, s, l] = hsl;
        if (s == 0) {
            return Color3::same(l);
        }
        const auto q = l < 0.5 ? l * (1 + s) : l + s - (l * s);
        const auto p = (2 * l) - q;
        const auto r = hue2rgb(p, q, h + (1. / 3));
        const auto g = hue2rgb(p, q, h);
        const auto b = hue2rgb(p, q, h - (1. / 3));
        return Color3({r, g, b});
    }
    
    constexpr Color3 hslToRgb(const Color3& hsl) noexcept {
        return hslToRgb01(hsl) * 255.0f;
    }
    
    constexpr Vec2 CENTER = Vec2::same(0.5);
    
}

namespace render::scratch::effectTransform {
    
    Silhouette::Color color(const Drawable& drawable, Silhouette::Color color, u32 effectMask) noexcept {
        if (color[3] == 0) {
            return color;
        }
        
        const auto& effects = drawable.uniforms().effects;
        const auto hasEffect = drawable.getEnabledEffects() & effectMask;
        
        if (hasEffect & shader::effects::ghost) {
            color[3] *= effects.ghost;
        }
        
        const bool enableColor = hasEffect & shader::effects::color;
        const bool enableBrightness = hasEffect & shader::effects::brightness;
        
        if (!enableColor && !enableBrightness) {
            return color;
        }
        
        auto[h, s, l] = rgbToHsl(color.truncate<3>().cast<f32>());
        
        if (enableColor) {
            // this code forces grayscale values to be slightly saturated
            // so that some slight change of hue will be visible
            // const float minLightness = 0.11 / 2.0;
            const auto minL = 0.11 / 2.0;
            // const float minSaturation = 0.09;
            const auto minS = 0.09;
            // if (hsl.z < minLightness) hsl = vec3(0.0, 1.0, minLightness);
            if (l < minL) {
                h = 0;
                s = 1;
                l = minL;
                // else if (hsl.y < minSaturation) hsl = vec3(0.0, minSaturation, hsl.z);
            } else if (s < minS) {
                h = 0;
                s = minS;
            }
            
            // hsl.x = mod(hsl.x + u_color, 1.0);
            // if (hsl.x < 0.0) hsl.x += 1.0;
            h = math::modulus(effects.color + h + 1, 1.f);
        }
        
        if (enableBrightness) {
            // hsl.z = clamp(hsl.z + u_brightness, 0.0, 1.0);
            l = math::min(1.f, l + effects.brightness);
        }
        return hslToRgb(Color3({h, s, l})).map(math::clampedCast<f32, u8>).extend<4>();
    }
    
    Vec2 point(const Drawable& drawable, Vec2 v) noexcept {
        const auto& effects = drawable.uniforms().effects;
        const auto hasEffect = drawable.getEnabledEffects();
        
        if (hasEffect & shader::effects::mosaic) {
            const auto w = effects.mosaic * v;
            v = w % 1.f;
        }
        if (hasEffect & shader::effects::pixelate) {
            const auto& skinUniforms = drawable.skin().uniforms();
            const auto texel = skinUniforms.skinSize * effects.pixelate;
            v = ((v * texel).map(floorf) + CENTER) / texel;
        }
        if (hasEffect & shader::effects::whirl) {
            constexpr auto RADIUS = 0.5f;
            const auto offset = v - CENTER;
            const auto whirlFactor = math::max(1.f - (offset.norm() / RADIUS), 0.f);
            const auto whirlActual = effects.whirl * whirlFactor * whirlFactor;
            const auto sinWhirl = std::sin(whirlActual);
            const auto cosWhirl = std::cos(whirlActual);
            f32 _rot[2][2] = {{cosWhirl, -sinWhirl},
                              {sinWhirl, cosWhirl}};
            const auto rot = math::Mat<2, 2>(_rot);
            v = (rot * offset) + CENTER;
        }
        if (hasEffect & shader::effects::fisheye) {
            const auto w = (v - CENTER) / CENTER;
            const auto norm = w.norm();
            const auto r = std::pow(math::min(norm, 1.f), effects.fisheye) * math::max(1.f, norm);
            v = CENTER + (r * (w / norm) * CENTER);
        }
        return v;
    }
}
