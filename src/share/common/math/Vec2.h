//
// Created by Khyber on 4/28/2019.
//

#pragma once

#include "src/share/common/math/Vec.h"

namespace math {
    
    template <typename T = f32>
    class Vec2 : public Vec<2, T> {
    
    public:
        
        using Base = Vec<2, T>;
        
        // @formatter:off
        /*implicit*/ _constexpr Vec2(const Base& v) noexcept : Base(v) {} // NOLINT(google-explicit-constructor,hicpp-explicit-conversions)
        // @formatter:on
        
        _constexpr Vec2(T x, T y) noexcept : Base({x, y}) {}
        
        _constexpr const T& x() const noexcept {
            return (*this)[0];
        }
        
        _constexpr T& x() noexcept {
            return (*this)[0];
        }
        
        _constexpr const T& y() const noexcept {
            return (*this)[1];
        }
        
        _constexpr T& y() noexcept {
            return (*this)[1];
        }
        
        static _constexpr Vec2 ofAngle(T radians) noexcept {
            return Vec2(std::cos(radians), std::sin(radians));
        }
        
        struct getter {
            
            static constexpr auto x = Base::getter::template index<0>();
            static constexpr auto y = Base::getter::template index<1>();
            
        };
        
        static _constexpr Vec2 zero() noexcept {
            return Base::zero();
        }
        
    };
    
    template <typename T>
    _constexpr T cross(const Vec<2, T>& a, const Vec<2, T>& b) noexcept {
        return a[0] * b[1] - a[1] * b[0]; // z-component of zero-extended Vec3 cross product
    }
    
    /**
     * Computes twice the signed area of the triangle oab.
     * If >0, then they're CCW.
     * If <0, then they're CW.
     * If =0, then they're collinear.
     */
    template <typename T>
    _constexpr T signedArea(const Vec<2, T>& o, const Vec<2, T>& a, const Vec<2, T>& b) noexcept {
        return math::cross(a - o, b - o);
    }
    
    template <typename T>
    _constexpr T ccw(const Vec<2, T>& o, const Vec<2, T>& a, const Vec<2, T>& b) noexcept {
        const auto area = signedArea(o, a, b);
        return area > 0 ? 1 : area < 0 ? -1 : 0;
    }
    
    template <typename T>
    _constexpr T isCcw(const Vec<2, T>& o, const Vec<2, T>& a, const Vec<2, T>& b) noexcept {
        return signedArea(o, a, b) < 0;
    }
    
    template <typename T>
    _constexpr T isCw(const Vec<2, T>& o, const Vec<2, T>& a, const Vec<2, T>& b) noexcept {
        return signedArea(o, a, b) > 0;
    }
    
}

enable_tuple_templated(::math::Vec2, typename T, T)
