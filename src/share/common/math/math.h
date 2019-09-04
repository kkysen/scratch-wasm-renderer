//
// Created by Khyber on 3/16/2019.
//

#pragma once

#include "src/share/common/numbers.h"

#include <type_traits>
#include <algorithm>
#include <cmath>

namespace math {
    
    template <typename T>
    using Extreme = const T& (*)(const T&, const T&);
    
    template <typename T>
    constexpr const T& min(const T& a, const T& b) noexcept {
        return a < b ? a : b;
    }
    
    template <typename T>
    constexpr const T& max(const T& a, const T& b) noexcept {
        return a > b ? a : b;
    }
    
    template <typename T>
    constexpr T abs(T t) noexcept {
        return t < 0 ? -t : t;
    }
    
    template <typename T>
    constexpr const T& clamp(const T& value, const T& min, const T& max) noexcept {
        return std::clamp(value, min, max);
    }
    
    template <typename T, typename U>
    constexpr U clampedCast(const T& value) noexcept {
        using limits = std::numeric_limits<U>;
        const auto min = static_cast<T>(limits::min());
        const auto max = static_cast<T>(limits::max());
        return static_cast<U>(clamp(value, min, max));
    }
    
    template <typename A, typename B>
    constexpr std::common_type_t<A, B> gcd(A a, B b) noexcept {
        return a == 0 ? abs(b) : b == 0 ? abs(a) : gcd(b, a % b);
    }
    
    template <typename A, typename B>
    constexpr std::common_type_t<A, B> lcm(A a, B b) noexcept {
        return (a == 0 || b == 0) ? 0 : (abs(a) / gcd(a, b)) * abs(b);
    }
    
    template <typename T1, typename... T2>
    constexpr size_t lcmSizeOf() noexcept {
        return lcm(sizeof(T1), lcmSizeOf<T2...>());
    }
    
    template <typename A, typename B>
    constexpr std::common_type_t<A, B> divUp(A dividend, B divisor) noexcept {
        return (dividend / divisor) + (dividend % divisor == 0);
    }
    
    constexpr size_t minBytesForBits(size_t bits) noexcept {
        return math::divUp(bits, numBits<u8>());
    }
    
    template <typename A, typename B>
    constexpr std::common_type_t<A, B> multipleGreaterThan(A multiple, B greaterThan) noexcept {
        return multiple > greaterThan ? multiple : multiple + multipleGreaterThan(multiple, greaterThan - multiple);
    }
    
    constexpr f64 PI = M_PI;
    constexpr f64 PI_2 = M_PI_2;
    constexpr f64 PI_4 = M_PI_4;
    
    template <typename T>
    struct mod {
        
        static T call(T x, T y) noexcept {
            return x % y;
        }
        
    };
    
    template<>
    struct mod<f32> {
        
        static f32 call(f32 x, f32 y) noexcept {
            return fmod(x, y);
        }
        
    };
    
    template<>
    struct mod<f64> {
        
        static f64 call(f64 x, f64 y) noexcept {
            return fmod(x, y);
        }
        
    };
    
    template<>
    struct mod<f128> {
        
        static f128 call(f128 x, f128 y) noexcept {
            return fmod(x, y);
        }
        
    };
    
    template <typename T>
    T modulus(T x, T y) noexcept {
        return mod<T>::call(x, y);
    }
    
    template <typename T>
    constexpr int signum(T x) {
        if constexpr (std::is_signed_v<T>) {
            return (T(0) < x) - (x < T(0));
        } else {
            return T(0) < x;
        }
    }
    
}
