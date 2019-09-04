//
// Created by Khyber on 5/4/2019.
//

#pragma once

#include "ArrayInterface.h"

#ifndef CORRADE_ARRAYVIEW_STL_COMPATIBILITY
#define CORRADE_ARRAYVIEW_STL_COMPATIBILITY 1
#endif

#include "src/share/lib/corrade/CorradeArrayView.h"

namespace {
    
    template <size_t N, class F, size_t... Indices>
    _constexpr auto mapIndex(F f, std::index_sequence<Indices...>) noexcept
    -> std::array<decltype(f(0LU)), N> {
        return {{f(Indices)...}};
    }
    
    template <class F, size_t...Indices>
    _constexpr void forEachIndex(F f, std::index_sequence<Indices...>) noexcept {
        (f(Indices), ...);
    }
    
}

namespace array {
    
    using Corrade::Containers::StaticArrayView;
    using Corrade::Containers::ArrayView;
    
    template <typename T, size_t N>
    class Array : public ArrayInterface<std::array<T, N>> {
    
    public:
        
        using Base = std::array<T, N>;
        using View = StaticArrayView<N, const T>;
        using MutView = StaticArrayView<N, T>;
        
        using Super = ArrayInterface<Base>;
    
    private:
        
        using Super::a;
    
    public:
        
        _constexpr View view() const noexcept {
            return a;
        }
        
        _constexpr MutView view() noexcept {
            return a;
        }
        
        /*implicit*/ _constexpr operator View() const noexcept { // NOLINT(google-explicit-constructor,hicpp-explicit-conversions)
            return view();
        }
        
        /*implicit*/ _constexpr operator MutView() noexcept { // NOLINT(google-explicit-constructor,hicpp-explicit-conversions)
            return view();
        }
        
        _constexpr Array() noexcept : Super({}) {}
        
        // @formatter:off
        // formatter puts NOLINT comments on another line, which makes them not apply to the right line
        
        /*implicit*/ _constexpr Array(const Base& array) noexcept : Super(array) {} // NOLINT(google-explicit-constructor,hicpp-explicit-conversions)
        
        /*implicit*/ _constexpr Array(T(& array)[N]) noexcept : Super(array) {} // NOLINT(google-explicit-constructor,hicpp-explicit-conversions)
        
        // @formatter:on
    
    private:
        
        static constexpr auto indices = std::make_index_sequence<N>();
        
        template <class F>
        static _constexpr auto mapIndex(F f) noexcept {
            using U = decltype(f(0UL));
            return Array<U, N>(::mapIndex<N, F>(f, indices));
        }
        
        template <class F>
        static _constexpr void forEachIndex(F f) noexcept {
            ::forEachIndex(f, indices);
        }
    
    public:
        
        // extra copies here are okay b/c they're static/_constexpr and can easily be optimized out
        
        // @formatter:off
        /*implicit*/ _constexpr Array(View view) noexcept // NOLINT(google-explicit-constructor,hicpp-explicit-conversions)
        // @formatter:on
                : Array(mapIndex([view](auto i) { return view[i]; })) {}
        
        // @formatter:off
        /*implicit*/ _constexpr Array(MutView view) noexcept // NOLINT(google-explicit-constructor,hicpp-explicit-conversions)
        // @formatter:on
                : Array(mapIndex([view](auto i) { return view[i]; })) {}
        
        
        
        #define _map mapIndex([f, &a = this->a](auto i)
        #define _forEach forEachIndex([f, &a = this->a](auto i)
        
        template <class F>
        _constexpr auto map(F f) const noexcept {
            return _map { return f(a[i]); });
        }
        
        template <class F>
        _constexpr auto mapIndexed(F f) const noexcept {
            return _map { return f(a[i], i); });
        }
        
        template <typename U>
        _constexpr Array<U, N> cast() const noexcept {
            return map([](const T& t) {
                return static_cast<const U&>(t);
            });
        }
        
        
        
        template <class F>
        _constexpr const Array& forEach(F f) const noexcept {
            _forEach { f(a[i]); });
            return *this;
        }
        
        template <class F>
        _constexpr const Array& forEachIndexed(F f) const noexcept {
            _forEach { f(a[i], i); });
            return *this;
        }
        
        template <class F>
        _constexpr Array& mutForEach(F f) noexcept {
            _forEach { f(a[i]); });
            return *this;
        }
        
        template <class F>
        _constexpr Array& mutForEachIndexed(F f) noexcept {
            _forEach { f(a[i], i); });
            return *this;
        }
        
        #undef _map
        #undef _forEach
    
    
    
    private:
        
        template <typename R, class F>
        _constexpr R foldLeft(F f, R acc, size_t i) const noexcept {
            return i == N ? acc : foldLeft(f, f(acc, a[i]), i + 1);
        }
        
        template <typename R, class F>
        _constexpr R foldRight(F f, R acc, size_t i) const noexcept {
            return i == 0 ? acc : foldRight(f, f(acc, a[i - 1]), i - 1);
        }
    
    public:
        
        template <typename R, class F>
        _constexpr R foldLeft(F f, R initial) const noexcept {
            foldLeft(f, std::move(initial), 0);
        }
        
        template <typename R, class F>
        _constexpr R foldRight(F f, R initial) const noexcept {
            foldRight(f, std::move(initial), N);
        }
        
        template <typename R, class F>
        _constexpr R fold(F f, R initial) const noexcept {
            return foldLeft(f, std::move(initial));
        }
        
        template <class F>
        _constexpr T foldLeft(F f) const noexcept {
            return foldLeft(f, a[0], 1);
        }
        
        template <class F>
        _constexpr T foldRight(F f) const noexcept {
            return foldRight(f, a[N - 1], N - 1);
        }
        
        template <class F>
        _constexpr T fold(F f) const noexcept {
            return foldLeft(f);
        }
        
        
        template <typename U>
        _constexpr Array<U, N> filled(const U& u) const noexcept {
            return map([u](auto) { return u; });
        }
        
        template <size_t M>
        static _constexpr Array<size_t, M> range() noexcept {
            return Array<size_t, M>().mapIndexed([](auto, size_t i) { return i; });
        }
        
        template <size_t M>
        static _constexpr Array<T, M> same(const T& t) noexcept {
            return range<M>().filled(t);
        }
        
        template <size_t M>
        static _constexpr Array<T, M> zero() noexcept {
            return same<M>(T());
        }
        
        
        template <size_t Begin, size_t End>
        _constexpr Array<T, End - Begin> slice() const noexcept {
            static_assert(Begin <= End);
            static_assert(End <= N);
            if constexpr (Begin == 0 && End == N) {
                return *this;
            }
            return range<End - Begin>().map([&a = *this](auto i) {
                return a[i + Begin];
            });
        }
        
        template <size_t Begin>
        _constexpr Array<T, N - Begin> slice() const noexcept {
            return slice<Begin, N>();
        }
        
        template <size_t N2>
        _constexpr Array<T, N2> truncate() const noexcept {
            static_assert(N2 <= N);
            return slice<0, N2>();
        }
        
        template <size_t M>
        _constexpr Array<T, N + M> operator+(const Array<T, M>& other) const noexcept {
            return range<N + M>().map([&a = *this, b = other](auto i) {
                return i < N ? a[i] : b[i - N];
            });
        }
        
        template <size_t N2>
        _constexpr Array<T, N2> extend(const T& zero = T()) const noexcept {
            static_assert(N2 >= N);
            return *this + same<N2 - N>(zero);
        }
        
        template <size_t N2>
        _constexpr Array<T, N2> sized(const T& zero = T()) const noexcept {
            if constexpr (N2 <= N) {
                return truncate<N2>();
            } else {
                return extend<N2>(zero);
            }
        }
        
        template <class F>
        _constexpr auto wrap(F f) const noexcept {
            return f(*this);
        }
        
        _constexpr size_t hash() const noexcept {
            return 31 ^ map([](const auto& e) { return std::hash<T>(e); })
                    .fold(std::bit_or());
        }
        
        struct Hash {
            
            _constexpr size_t operator()(const Array& array) const noexcept {
                return array.hash();
            }
        
        };
        
    };
    
    #define define_cmp(cmp) \
    template <typename T, size_t N> \
    _constexpr bool operator cmp (const Array<T, N>& lhs, const Array<T, N>& rhs) noexcept { \
        return lhs.array() cmp rhs.array(); \
    }
    
    define_cmp(==)
    
    define_cmp(!=)
    
    define_cmp(<=)
    
    define_cmp(<)
    
    define_cmp(>=)
    
    define_cmp(>)
    
    #undef define_cmp
    
    template <size_t N>
    _constexpr Array<size_t, N> range() noexcept {
        return Array<size_t, N>::template range<N>();
    }
    
}

// @formatter:off
enable_tuple_templated(::array::Array, typename T COMMA size_t N, T COMMA N)
// @formatter:on
