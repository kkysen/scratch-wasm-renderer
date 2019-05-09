//
// Created by Khyber on 4/27/2019.
//

#pragma once

#include "utils.h"
#include "Vec2.h"
#include "Mat.h"
#include "src/share/lib/corrade/CorradeArrayView.h"

#include <cmath>

namespace math {
    
    using namespace Corrade::Containers;
    
    template <typename T = f32>
    class Rect {
    
    public:
        
        union {
            struct {
                T left;
                T bottom;
            };
            Vec2<T> bottomLeft;
        };
        union {
            struct {
                T right;
                T top;
            };
            Vec2<T> topRight;
        };
        
        constexpr Rect(T left, T bottom, T right, T top) noexcept
                : left(left), bottom(bottom), right(right), top(top) {}
        
        constexpr Rect(const Vec2<T>& bottomLeft, const Vec2<T>& topRight) noexcept
                : bottomLeft(bottomLeft), topRight(topRight) {}
        
        constexpr Rect() noexcept : Rect(Vec2<T>::zero(), Vec2<T>::zero()) {}
    
    private:
        
        // fromAABB
        explicit constexpr Rect(ArrayView<const Vec2<T>> points) noexcept : Rect() {
            for (const auto& point : points) {
                const auto[x, y] = point;
                if (x < left) {
                    left = x;
                }
                if (x > right) {
                    right = x;
                }
                if (y > top) {
                    top = y;
                }
                if (y < bottom) {
                    bottom = y;
                }
            }
        }
    
    public:
        
        static constexpr Rect fromAABB(ArrayView<const Vec2<T>> points) noexcept {
            return Rect(points);
        }
        
        constexpr T width() const noexcept {
            return abs(right - left); // TODO do I need abs?
        }
        
        constexpr T height() const noexcept {
            return abs(top - bottom); // TODO do I need abs?
        }
        
        constexpr bool intersects(const Rect& other) const noexcept {
            return left <= other.right
                   && other.left <= right
                   && top >= other.bottom
                   && other.top >= bottom;
        }
        
        constexpr bool contains(const Rect& other) const noexcept {
            return other.left > left &&
                   other.right < right &&
                   other.top < top &&
                   other.bottom > bottom;
        }
        
        static constexpr Rect& intersection(const Rect& a, const Rect& b, Rect& result) noexcept {
            result.left = max(a.left, b.left);
            result.right = min(a.right, b.right);
            result.bottom = max(a.bottom, b.bottom);
            result.top = min(a.top, b.top);
            return result;
        }
        
        static constexpr Rect& union_(const Rect& a, const Rect& b, Rect& result) noexcept {
            result.left = min(a.left, b.left);
            result.right = max(a.right, b.right);
            result.bottom = min(a.bottom, b.bottom);
            result.top = max(a.top, b.top);
            return result;
        }
        
        static constexpr Rect intersection(const Rect& a, const Rect& b) noexcept {
            Rect result;
            return intersection(a, b, result);
        }
        
        static constexpr Rect union_(const Rect& a, const Rect& b) noexcept {
            Rect result;
            return union_(a, b, result);
        }
        
        constexpr Rect operator&(const Rect& other) noexcept {
            return intersection(*this, other);
        }
        
        constexpr Rect operator|(const Rect& other) noexcept {
            return union_(*this, other);
        }
        
        constexpr void orient() noexcept {
            // ensure rectangle coordinates in order
            sort(left, right);
            sort(bottom, top);
        }
        
        constexpr void clamp(const Rect& bounds) noexcept {
            intersection(*this, bounds, *this);
            orient();
        }
        
        void snapToInt() noexcept {
            left = floor(left);
            right = ceil(right);
            bottom = floor(bottom);
            top = ceil(top);
        }
        
        constexpr bool contains(const Vec2<T>& p) const noexcept {
            return p.x() > left && p.x() < right && p.y() > bottom && p.y() < top;
        }
        
        constexpr bool containsOrBordersTopRight(const Vec2<T>& p) const noexcept {
            return p.x() > left && p.x() <= right && p.y() > bottom && p.y() <= top;
        }
        
        constexpr Vec2<T> bottomRight() const noexcept {
            return Vec2(right, bottom);
        }
        
        constexpr Vec2<T> topLeft() const noexcept {
            return Vec2(left, top);
        }
        
        template <class F>
        auto apply(F f) const noexcept {
            return Rect(f(left), f(bottom), f(right), f(top));
        }
        
        class Corners {
        
        public:
            
            union {
                struct {
                    Vec2<T> bottomLeft;
                    Vec2<T> topLeft;
                    Vec2<T> bottomRight;
                    Vec2<T> topRight;
                };
                math::Vec<4, Vec2<T>> vector;
                math::Mat<2, 2, Vec2<T>> matrix;
            };
        
        private:
            
            constexpr Corners(const Vec2<T>& bottomLeft,
                              const Vec2<T>& topLeft,
                              const Vec2<T>& bottomRight,
                              const Vec2<T>& topRight) noexcept
                    : bottomLeft(bottomLeft),
                      topLeft(topLeft),
                      bottomRight(bottomRight),
                      topRight(topRight) {}
        
        public:
            
            explicit constexpr Corners(const Rect& rect) noexcept
                    : bottomLeft(rect.bottomLeft),
                      topLeft(rect.topLeft()),
                      bottomRight(rect.bottomRight()),
                      topRight(rect.topRight) {}
            
        };
        
        constexpr Corners corners() const noexcept {
            return Corners(*this);
        }
        
    };
    
}
