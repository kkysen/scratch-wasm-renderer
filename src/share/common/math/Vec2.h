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
    
    private:
        
        static const Vec2 _zero;
    
    public:
        
        static _constexpr const Vec2& zero() noexcept {
            return _zero;
        }
        
    };
    
    template <typename T>
    const Vec2<T> Vec2<T>::_zero = Base::zero();
    
    template <typename T>
    _constexpr T cross(const Vec<2, T>& a, const Vec<2, T>& b) noexcept {
        return a[0] * b[1] - a[1] * b.x[0]; // z-component of zero-extended Vec3 cross product
    }
    
}

enable_tuple(::math::Vec2, typename T, T)
