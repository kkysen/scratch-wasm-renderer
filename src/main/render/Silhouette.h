//
// Created by Khyber on 5/2/2019.
//

#pragma once

#include <src/share/common/array/Array.h>
#include "src/main/render/utils.h"
#include "src/main/render/Color.h"

namespace scratch::render {
    
    class Silhouette {
    
    public:
        
        using Rect = math::Rect<u32>;
        using Vec2 = math::Vec2<u32>;
        using Color = math::Vec<4, u8>;
    
    private:
        
        Rect rect;
        render::Vec2 sizeMinusOne;
        ArrayView<u8> colorData; // Uint8ClampedArray
    
    public:
        
        constexpr Silhouette(const Vec2& size, ArrayView<u8> colorData) noexcept
                : rect(Vec2::zero(), size),
                  sizeMinusOne(Vec2(size - Vec2::same(1)).cast<f32>()),
                  colorData(colorData) {}
        
        constexpr Silhouette() noexcept : Silhouette(Vec2::zero(), nullptr) {}
    
    private:
        
        constexpr const Vec2& size() const noexcept {
            return rect.topRight;
        }
        
        constexpr u32 index(const Vec2& p) const noexcept {
            return (p.y() * size().x()) + p.x();
        }
        
        constexpr u8 getPoint(const Vec2& point) const noexcept {
            // TODO check if <= vs. < matters
            if (!rect.contains(point)) {
                return 0;
            }
            return colorData[(index(point) * 4) + 3];
        }
    
    public:
        
        static constexpr Color noColor() noexcept {
            return Color::zero();
        }
    
    private:
        
        constexpr Color getColor(const Vec2& point) const noexcept {
            if (!rect.contains(point)) {
                return noColor();
            }
            const auto offset = index(point) * 4;
            return Color(colorData.slice<4>(offset));
        }
        
        constexpr Vec2 flooredTimesSizeMinusOne(const render::Vec2& p) const noexcept {
            return (p * sizeMinusOne).cast<u32>();
        }
    
    public:
        
        constexpr Color colorAtNearest(const render::Vec2& p) const noexcept {
            if (!colorData) {
                return noColor();
            }
            return getColor(flooredTimesSizeMinusOne(p));
        }
    
    private:
        
        static constexpr f32 linearFunc(const math::Mat<2, 2, Color>& xy,
                                        const math::Mat<2, 2, f32>& d, u8 k) noexcept {
            return xy.mapIndexed([d, k](const Color& color, auto i, auto j) -> f32 {
                return color[k] * d[i][0] * d[j][1];
            }).fold(std::plus());
        }
    
    public:
        
        constexpr Color colorAtLinear(const render::Vec2& p) const noexcept {
            if (!colorData) {
                return noColor();
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
        
        constexpr bool isTouchingNearest(const render::Vec2& p) const noexcept {
            return !colorData ? false : getPoint(flooredTimesSizeMinusOne(p));
        }
        
        constexpr bool isTouchingLinear(const render::Vec2& p) const noexcept {
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
