//
// Created by Khyber on 4/28/2019.
//

#pragma once

#include "src/share/common/math/Vec.h"

namespace math {
    
    template <typename T = f32>
    class Vec3 : public Vec<3, T> {
    
    public:
        
        using Base = Vec<3, T>;
        
        // @formatter:off
        /*implicit*/ _constexpr Vec3(const Base& v) noexcept : Base(v) {} // NOLINT(google-explicit-constructor,hicpp-explicit-conversions)
        // @formatter:on
        
        _constexpr Vec3(T x, T y, T z) noexcept : Base({x, y, z}) {}
        
        _constexpr const T& x() const noexcept {
            return this[0];
        }
        
        _constexpr T& x() noexcept {
            return this[0];
        }
        
        _constexpr const T& y() const noexcept {
            return this[1];
        }
        
        _constexpr T& y() noexcept {
            return this[1];
        }
        
        _constexpr const T& z() const noexcept {
            return this[2];
        }
        
        _constexpr T& z() noexcept {
            return this[2];
        }
        
        struct getter {
            
            static constexpr auto x = Base::getter::template index<0>();
            static constexpr auto y = Base::getter::template index<1>();
            static constexpr auto z = Base::getter::template index<2>();
            
        };
        
        static _constexpr Vec3 zero() noexcept {
            return Base::zero();
        }
        
    };
    
    template <typename T>
    _constexpr Vec3<T> cross(const Vec3<T>& a, const Vec3<T>& b) noexcept {
        return Vec3(
                a[1] * b[2] - a[2] * b[1],
                a[2] * b[0] - a[0] * b[2],
                a[0] * b[1] - a[1] * b[0]
        );
    }
    
}
