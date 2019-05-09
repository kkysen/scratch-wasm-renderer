//
// Created by Khyber on 5/6/2019.
//

#pragma once

#include "utils.h"
#include <src/share/common/math/math.h>

#include <array>
#include <string>
#include <functional>

namespace render::shader::effects {
    
    using Converter = f32(*)(f32);
    
    class EffectType {
    
    public:
        
        u32 id;
        bool shapeChanges;
    
    private:
        
        Converter convert;
    
    public:
        
        constexpr EffectType(u32 id, bool shapeChanges, Converter convert) noexcept
                : id(id), shapeChanges(shapeChanges), convert(convert) {}

//        EffectType(const EffectType& other) = delete;
// TODO make deleted
        
        constexpr u32 mask() const noexcept {
            return 1u << id;
        }
        
        constexpr f32 operator()(f32 x) const noexcept {
            return convert(x);
        }
        
    };
    
    constexpr bool operator&(u32 value, const EffectType& effect) noexcept {
        return (value & effect.mask()) != 0;
    }
    
    using math::modulus;
    using math::max;
    using math::min;
    using math::clamp;
    using math::abs;
    using math::PI;
    using std::round;
    
    using array::Array;
    
    static constexpr std::array<EffectType, 7> _all = {
            EffectType {0, false, [](f32 x) -> f32 {
                return modulus(x / 200, 1.f);
            }},
            {1, true, [](f32 x) -> f32 {
                return max(0.f, (x + 100) / 100);
            }},
            {2, true, [](f32 x) -> f32 {
                return -x * PI / 180;
            }},
            {3, true, [](f32 x) -> f32 {
                return abs(x) / 10;
            }},
            {4, true, [](f32 x) -> f32 {
                return clamp(round((abs(x) + 10) / 10), 1.f, 512.f);
            }},
            {5, false, [](f32 x) -> f32 {
                return clamp(x, -100.f, 100.f) / 100;
            }},
            {6, false, [](f32 x) -> f32 {
                return 1 - (clamp(x, 0.f, 100.f) / 100);
            }},
    };
    
    constexpr const EffectType& color = _all[0];
    constexpr const EffectType& fisheye = _all[1];
    constexpr const EffectType& whirl = _all[2];
    constexpr const EffectType& pixelate = _all[3];
    constexpr const EffectType& mosaic = _all[4];
    constexpr const EffectType& brightness = _all[5];
    constexpr const EffectType& ghost = _all[6];
    
    constexpr Array<EffectType, 7> all() noexcept {
        return _all;
    }
    
    class Effect {
    
    private:
        
        const EffectType& type;
        f32 value;
    
    public:
        
        constexpr Effect(const EffectType& type, f32 value) noexcept : type(type), value(value) {}
        
        constexpr u32 id() const noexcept {
            return type.id;
        }
        
        constexpr bool shapeChanges() const noexcept {
            return type.shapeChanges;
        }
        
        constexpr u32 mask(u32 bits) const noexcept {
            // TODO is this the right bool check?
            if (static_cast<bool>(value)) {
                return bits | type.mask();
            } else {
                return bits & ~type.mask();
            }
        }
        
        constexpr f32 operator()() const noexcept {
            return type(value);
        }
        
    };
    
    struct Effects {
        
        u32 bits = 0;
        union {
            struct {
                f32 color;
                f32 fisheye;
                f32 whirl;
                f32 pixelate;
                f32 mosaic;
                f32 brightness;
                f32 ghost;
            };
            std::array<f32, 7> all = {};
        };
        
        constexpr Effects() noexcept : all(
                effects::all().map([](const EffectType& type) { return type(0); })
        ) {}
        
        constexpr void update(const Effect& effect) noexcept {
            bits = effect.mask(bits);
            all[effect.id()] = effect();
        }
        
        constexpr void update(ArrayView<const Effect> effects) noexcept {
            for (const auto& effect : effects) {
                update(effect);
            }
        }
        
    };
    
}
