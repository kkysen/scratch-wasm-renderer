//
// Created by Khyber on 5/2/2019.
//

#pragma once

#include <src/share/common/array/Array.h>
#include "types.h"
#include "src/main/render/Color.h"
#include "src/main/render/ImageData.h"

namespace render::scratch {
    
    class Silhouette {
    
    public:
        
        using Rect = math::Rect<u32>;
        using Vec2 = math::Vec2<u32>;
        using Color = Pixel;
    
    private:
        
        ImageData colorData;
        scratch::Vec2 sizeMinusOne; // will be negative if !colorData, so need to be careful
    
    public:
        
        explicit constexpr Silhouette(ImageData colorData) noexcept
                : colorData(colorData),
                  sizeMinusOne(Vec2(colorData.size() - Vec2::same(1)).cast<f32>()) {}
        
        constexpr Silhouette() noexcept : Silhouette(ImageData(nullptr)) {}
        
        static constexpr Color noColor = Color::zero();
    
    private:
        
        constexpr const Vec2& size() const noexcept {
            return colorData.size();
        }
        
        constexpr u8 getPoint(const Vec2& p) const noexcept {
            return !colorData.contains(p) ? 0 : colorData[p][3];
        }
        
        constexpr const Color& getColor(const Vec2& p) const noexcept {
            return !colorData.contains(p) ? noColor : colorData[p];
        }
        
        constexpr Vec2 flooredTimesSizeMinusOne(const scratch::Vec2& p) const noexcept {
            return (p * sizeMinusOne).cast<u32>();
        }
    
    public:
        
        constexpr const Color& colorAtNearest(const scratch::Vec2& p) const noexcept {
            return !colorData ? noColor : getColor(flooredTimesSizeMinusOne(p));
        }
    
    private:
        
        static constexpr f32 linearFunc(const math::Mat<2, 2, Color>& xy,
                                        const math::Mat<2, 2, f32>& d, u8 k) noexcept {
            return xy.mapIndexed([d, k](const Color& color, auto i, auto j) -> f32 {
                return color[k] * d[i][0] * d[j][1];
            }).fold(std::plus());
        }
    
    public:
        
        constexpr Color colorAtLinear(const scratch::Vec2& p) const noexcept {
            if (!colorData) {
                return noColor;
            }
            using namespace math;
            const auto p2 = p * sizeMinusOne;
            const auto d1 = p2 % 1.f;
            const auto d0 = Vec<2, f32>::same(1) - d1;
            const auto xFloor = d0.cast<u32>();
            const auto xy = Rect(xFloor, xFloor + Vec2::same(1))
                    .corners()
                    .matrix
                    .map([this](auto&& p) { return getColor(p); });
            const Mat<2, 2, f32> d = Vec<2, Vec<2, f32>>({d0, d1});
            return array::range<4>()
                    .map([&xy, &d](auto k) -> u8 { return linearFunc(xy, d, k); })
                    .map(math::clampedCast<f32, u8>)
                    .wrap([](auto&& x) { return Color(x); });
        }
        
        constexpr bool isTouchingNearest(const scratch::Vec2& p) const noexcept {
            return !colorData ? false : getPoint(flooredTimesSizeMinusOne(p));
        }
        
        constexpr bool isTouchingLinear(const scratch::Vec2& p) const noexcept {
            const auto x = flooredTimesSizeMinusOne(p);
            return Rect(x, x + Vec2::same(1))
                    .corners()
                    .vector
                    .array()
                    .map([this](auto&& p) { return getPoint(p); })
                    .map([](auto x) { return x > 0; })
                    .fold(std::logical_or());
        }
        
        // TODO update logic needs to be in JS
        
    };
    
}
