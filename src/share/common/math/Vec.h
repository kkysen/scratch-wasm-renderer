//
// Created by Khyber on 5/5/2019.
//

#pragma once

//
// Created by Khyber on 4/28/2019.
//

#pragma once

#include "src/share/common/array/Array.h"
#include "src/share/common/numbers.h"
#include "src/share/common/math/math.h"

#include <algorithm>
#include <cmath>

#define _op(op) [](auto x, auto y) { return x op y; }

namespace {
    
    template <typename T, typename U>
    using convertible = typename std::enable_if_t<std::is_convertible_v<U, T>>;
    
}

namespace math {
    
    template <size_t N, typename T = f32>
    class Vec : public array::ArrayInterface<array::Array<T, N>> {
    
    private:
        
        template <typename U>
        using convertible = ::convertible<U, T>;
        
        template <typename _T, size_t _N>
        using Array = array::Array<_T, _N>;
        
        using A = Array<T, N>;
        
        using Super = array::ArrayInterface<A>;
        
        using Super::a;
        
        template <typename U>
        static _constexpr Vec<N, U> of(const Array<U, N>& array) noexcept {
            return Vec<N, U>(array);
        }
    
    public:
        
        _constexpr array::StaticArrayView<N, const T> view() const noexcept {
            return a.view();
        }
        
        /*implicit*/ _constexpr Vec(const Array<T, N>& array) noexcept : Super(array) {}
        
        /*implicit*/ _constexpr Vec(const std::array<T, N>& array) noexcept : Super(array) {}
        
        _constexpr Vec copy() const noexcept {
            return Vec(a);
        }
        
        template <class F>
        _constexpr auto map(F f) const noexcept {
            return of(a.map(f));
        }
        
        template <class F>
        _constexpr auto mapIndexed(F f) const noexcept {
            return of(a.mapIndexed(f));
        }
        
        template <class F>
        _constexpr void forEachIndexed(F f) const noexcept {
            return a.forEachIndexed(f);
        }
        
        template <class F>
        _constexpr Vec& mutForEach(F f) noexcept {
            a.mutForEach(f);
            return *this;
        }
        
        template <class F>
        _constexpr Vec& mutForEachIndexed(F f) noexcept {
            a.mutForEachIndexed(f);
            return *this;
        }
        
        template <class F>
        static _constexpr auto mapIndex(F f) noexcept {
            return of(A::template range<N>().map(f));
        }
        
        template <typename U, class F>
        _constexpr auto combine(const Vec<N, U>& b, F f) const noexcept {
            return mapIndex([a = *this, b, f](auto i) { return f(a[i], b[i]); });
        }
        
        template <class F>
        _constexpr auto combine(const T& c, F f) const noexcept {
            return map([c, f](auto x) { return f(x, c); });
        }
        
        template <class F>
        _constexpr Vec& combineMut(const Vec& v, F f) noexcept {
            mutForEachIndexed([v, f](auto& x, auto i) { x = f(x, v[i]); });
        }
        
        template <class F>
        _constexpr Vec& combineMut(const T& c, F f) noexcept {
            mutForEach([c, f](auto& x) { x = f(x, c); });
        }
        
        template <typename R = T, class F>
        _constexpr R fold(F f) const noexcept {
            return a.fold(f);
        }
        
        _constexpr Vec& operator+=(const Vec& v) noexcept {
            return combineMut(v, _op(+));
        }
        
        _constexpr Vec& operator-=(const Vec& v) noexcept {
            return combineMut(v, _op(-));
        }
        
        _constexpr Vec& operator*=(const Vec& v) noexcept {
            return combineMut(v, _op(*));
        }
        
        _constexpr Vec& operator/=(const Vec& v) noexcept {
            return combineMut(v, _op(*));
        }
        
        _constexpr Vec& operator*=(const T& c) noexcept {
            return combineMut(c, _op(*));
        }
        
        template <typename U, typename convertible<U>::type>
        _constexpr Vec& operator*=(const U& c) noexcept {
            return *this *= static_cast<T>(c);
        }
        
        _constexpr Vec& negate() noexcept {
            return *this *= -1;
        }
        
        _constexpr Vec& mulAdd(const Vec& v, const T& c) noexcept {
            return mutForEachIndexed([v, c](auto& x, auto i) { x = v[i] * c; });
        }
        
        _constexpr Vec& operator/=(const T& c) noexcept {
            return combineMut(c, std::divides());
        }
        
        _constexpr Vec& operator%=(const T& c) noexcept {
            return combineMut(c, std::modulus());
        }
        
        _constexpr Vec& operator&=(const T& c) noexcept {
            return combineMut(c, std::bit_and());
        }
        
        template <typename U, typename convertible<U>::type>
        _constexpr Vec& operator/=(const U& c) noexcept {
            return *this /= static_cast<T>(c);
        }
        
        template <typename U>
        _constexpr Vec& operator%=(const U& c) noexcept {
            return *this %= static_cast<T>(c);
        }
        
        _constexpr T norm2() const noexcept {
            return dot(*this, *this);
        }
        
        _constexpr T norm() const noexcept {
            return sqrt(norm2());
        }
        
        _constexpr Vec& normalize() noexcept {
            return *this /= norm();
        }
        
        _constexpr Vec normalized() const noexcept {
            return *this / norm();
        }
        
        _constexpr Vec& clamp(const Vec& min, const Vec& max) noexcept {
            return mutForEachIndexed([min, max](auto& x, auto i) { x = math::clamp(x, min[i], max[i]); });
        }
        
        _constexpr Vec clamped(const Vec& min, const Vec& max) const noexcept {
            return mapIndexed([min, max](auto x, auto i) { return math::clamp(x, min[i], max[i]); });
        }
        
        template <typename U>
        _constexpr Vec<N, U> cast() const noexcept {
            return map([](auto x) { return static_cast<U>(x); });
        }
        
        static _constexpr Vec same(const T& t) noexcept {
            return Vec(A::template same<N>(t));
        }
    
    private:
        
        static const Vec _zero;
    
    public:
        
        static _constexpr const Vec& zero() noexcept {
            return _zero;
        }
        
        template <size_t M>
        _constexpr Vec<M, T> extend(const T& zero = T()) const noexcept {
            return Vec<M, T>(a.template extend<M>(zero));
        }
        
        template <size_t M>
        _constexpr Vec<M, T> truncate() const noexcept {
            return Vec<M, T>(a.template truncate<M>());
        }
        
    };
    
    template <size_t N, typename T>
    const Vec<N, T> Vec<N, T>::_zero = same(0);
    
    template <size_t N, typename T>
    _constexpr bool operator==(const Vec<N, T>& a, const Vec<N, T>& b) noexcept {
        return a.array() == b.array();
    }
    
    template <size_t N, typename T>
    _constexpr bool operator!=(const Vec<N, T>& a, const Vec<N, T>& b) noexcept {
        return a != b;
    }
    
    template <size_t N, typename T>
    _constexpr Vec<N, T> operator+(const Vec<N, T>& a, const Vec<N, T>& b) noexcept {
        return a.combine(b, _op(+));
    }
    
    template <size_t N, typename T>
    _constexpr Vec<N, T> operator-(const Vec<N, T>& a, const Vec<N, T>& b) noexcept {
        return a.combine(b, _op(-));
    }
    
    template <size_t N, typename T>
    _constexpr Vec<N, T> operator*(const Vec<N, T>& a, const T& c) noexcept {
        return a.combine(c, _op(*));
    }
    
    template <size_t N, typename T, typename U, typename convertible<T, U>::type>
    _constexpr Vec<N, T> operator*(const Vec<N, T>& a, const U& c) noexcept {
        return a * static_cast<T>(c);
    }
    
    template <size_t N, typename T>
    _constexpr Vec<N, T> operator*(T c, const Vec<N, T>& a) noexcept {
        return a * c;
    }
    
    template <size_t N, typename T, typename U, typename convertible<T, U>::type>
    _constexpr Vec<N, T> operator*(U c, const Vec<N, T>& a) noexcept {
        return a * c;
    }
    
    template <size_t N, typename T>
    _constexpr Vec<N, T> operator/(const Vec<N, T>& a, const T& c) noexcept {
        return a.combine(c, _op(/));
    }
    
    template <size_t N, typename T>
    _constexpr Vec<N, T> operator%(const Vec<N, T>& a, const T& c) noexcept {
        return a.combine(c, math::mod<T>::call);
    }

//    template <size_t N, typename T, typename std::enable_if_t<std::is_floating_point_v<T>>::type>
//    _constexpr Vec<N, T> operator%(const Vec<N, T>& a, T c) noexcept {
//        return a.combine(c, fmod);
//    }
    
    template <size_t N, typename T, typename U, typename convertible<T, U>::type>
    _constexpr Vec<N, T> operator/(const Vec<N, T>& a, const U& c) noexcept {
        return a / static_cast<T>(c);
    }
    
    template <size_t N, typename T, typename U, typename convertible<T, U>::type>
    _constexpr Vec<N, T> operator%(const Vec<N, T>& a, const U& c) noexcept {
        return a % static_cast<T>(c);
    }
    
    template <size_t N, typename T>
    _constexpr Vec<N, T> operator/(const T& c, const Vec<N, T>& a) noexcept {
        return a.combine(c, [](auto x, auto c) { return c / x; });
    }
    
    template <size_t N, typename T, typename U, typename convertible<T, U>::type>
    _constexpr Vec<N, T> operator/(const U& c, const Vec<N, T>& a) noexcept {
        return static_cast<T>(c) / a;
    }
    
    template <size_t N, typename T>
    _constexpr Vec<N, T> operator-(const Vec<N, T>& a) noexcept {
        return a * -1;
    }
    
    template <size_t N, typename T>
    _constexpr Vec<N, T> negated(const Vec<N, T>& a) noexcept {
        return -a;
    }
    
    // private, therefore static, but anonymous namespace is complicated here
    template <size_t N, typename T, typename U>
    static _constexpr auto elementWiseMultiplication(const Vec<N, T>& a, const Vec<N, U>& b) noexcept {
        return a.combine(b, _op(*));
    }
    
    template <size_t N, typename T, typename U>
    _constexpr auto operator*(const Vec<N, T>& a, const Vec<N, U>& b) noexcept {
        return elementWiseMultiplication(a, b);
    }
    
    template <size_t N, typename T>
    _constexpr Vec<N, T> operator/(const Vec<N, T>& a, const Vec<N, T>& b) noexcept {
        return a.combine(b, _op(/));
    }
    
    template <size_t N, typename T, typename U>
    _constexpr auto dot(const Vec<N, T>& a, const Vec<N, U>& b) noexcept {
        // operator * can be ambiguous here, but we always mean the element wise version, not scalar mult
        return elementWiseMultiplication(a, b).fold(_op(+));
    }
    
    template <size_t N, typename T>
    _constexpr T norm2(const Vec<N, T>& a) noexcept {
        return a.norm2();
    }
    
    template <size_t N, typename T>
    _constexpr T norm(const Vec<N, T>& a) noexcept {
        return a.norm();
    }
    
    template <size_t N, typename T>
    _constexpr Vec<N, T> normalized(const Vec<N, T>& a) noexcept {
        return a.normalized();
    }

//    // TODO will this specialize math::clamp?
//    template <size_t N, typename T>
//    _constexpr Vec<N, T> clamp(const Vec<N, T>& value, const Vec<N, T>& min, const Vec<N, T>& max) noexcept {
//        return value.clamped(min, max);
//    }
    
    template <size_t N>
    struct vec {
        
        template <typename T>
        static _constexpr Vec<N, T> of(const std::array<T, N>& array) {
            return Vec<N, T>(array);
        }
        
    };
    
}

#undef _op

// @formatter:off
enable_tuple(::math::Vec, size_t N COMMA typename T, N COMMA T)
// @formatter:on
