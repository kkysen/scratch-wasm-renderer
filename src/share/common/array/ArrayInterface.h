//
// Created by Khyber on 5/7/2019.
//

#pragma once

#include <cstdlib>
#include <type_traits>
#include <array>

#include "is_std_array.h"

#define _constexpr inline __attribute__((always_inline)) constexpr

namespace array {
    
    template <class Base>
    class ArrayInterface {
    
    public:
        
        using value_type = typename Base::value_type;
        using size_type = typename Base::size_type;
        using difference_type = typename Base::difference_type;
        using const_reference = typename Base::const_reference;
        using reference = typename Base::reference;
        using const_pointer = typename Base::const_pointer;
        using pointer = typename Base::pointer;
        using const_iterator = typename Base::const_iterator;
        using iterator = typename Base::iterator;
        using const_reverse_iterator = typename Base::const_reverse_iterator;
        using reverse_iterator = typename Base::reverse_iterator;
        
        using tuple_size = std::tuple_size<Base>;
        
        template <size_t I>
        using tuple_element = std::tuple_element<I, Base>;
        
        using T = value_type;
    
        // There are a lot of unnecessary copies done in these methods.
        // This won't matter for literal types.
        static_assert(std::is_literal_type_v<T>);
    
    protected:
        
        Base a;
        
        explicit _constexpr ArrayInterface(const Base& a) noexcept : a(a) {}
    
    public:
        
        _constexpr const Base& array() const noexcept {
            return a;
        }
        
        _constexpr Base& array() noexcept {
            return a;
        }
        
        /*implicit*/ _constexpr operator const Base&() const noexcept { // NOLINT(google-explicit-constructor,hicpp-explicit-conversions)
            return a;
        }
        
        /*implicit*/ _constexpr operator Base&() noexcept { // NOLINT(google-explicit-constructor,hicpp-explicit-conversions)
            return a;
        }
        
        _constexpr const T* operator*() const noexcept {
            return a.data();
        }
        
        _constexpr T* operator*() noexcept {
            return a.data();
        }
        
        template <size_t I>
        _constexpr const T& get() const noexcept {
            if constexpr (stde::is_std_array_v<Base>) {
                return std::get<I>(a);
            } else {
                return a.template get<I>();
            }
        }
        
        template <size_t I>
        _constexpr T& get() noexcept {
            if constexpr (stde::is_std_array_v<Base>) {
                return std::get<I>(a);
            } else {
                return a.template get<I>();
            }
        }
        
        _constexpr const T& at(size_t i) const noexcept {
            return a.at(i);
        }
        
        _constexpr T& at(size_t i) noexcept {
            return a.at(i);
        }
        
        _constexpr const T& operator[](size_t i) const noexcept {
            return a[i];
        }
        
        _constexpr T& operator[](size_t i) noexcept {
            return a[i];
        }
        
        _constexpr const T& front() const noexcept {
            return a.front();
        }
        
        _constexpr T& front() noexcept {
            return a.front();
        }
        
        _constexpr const T& back() const noexcept {
            return a.back();
        }
        
        _constexpr T& back() noexcept {
            return a.back();
        }
        
        _constexpr const T* data() const noexcept {
            return a.data();
        }
        
        _constexpr T* data() noexcept {
            return a.data();
        }
        
        
        
        _constexpr const T* cbegin() const noexcept {
            return a.cbegin();
        }
        
        _constexpr const T* begin() const noexcept {
            return a.begin();
        }
        
        _constexpr T* begin() noexcept {
            return a.begin();
        }
        
        _constexpr const T* cend() const noexcept {
            return a.cend();
        }
        
        _constexpr const T* end() const noexcept {
            return a.cend();
        }
        
        _constexpr T* end() noexcept {
            return a.end();
        }
        
        _constexpr const T* crbegin() const noexcept {
            return a.crbegin();
        }
        
        _constexpr const T* rbegin() const noexcept {
            return a.rbegin();
        }
        
        _constexpr T* rbegin() noexcept {
            return a.rbegin();
        }
        
        _constexpr const T* crend() const noexcept {
            return a.crend();
        }
        
        _constexpr const T* rend() const noexcept {
            return a.crend();
        }
        
        _constexpr T* rend() noexcept {
            return a.rend();
        }
        
        
        _constexpr bool empty() const noexcept {
            return a.empty();
        }
        
        _constexpr size_t size() const noexcept {
            return a.size();
        }
        
        _constexpr size_t max_size() const noexcept {
            return a.max_size();
        }
        
        
        
        _constexpr void fill(const T& t) noexcept {
            a.fill(t);
        }
        
        _constexpr void swap(ArrayInterface& other) noexcept(std::is_nothrow_swappable_v<T>) {
            a.swap(other.a);
        }
        
        
        
        struct getter {
            
            template <size_t i>
            static _constexpr auto index() noexcept {
                return [](const ArrayInterface& _a) { return _a[i]; };
            }
            
        };
        
        struct setter {
            
            template <size_t i>
            static _constexpr auto index() noexcept {
                return [](ArrayInterface& _a, T t) { _a[i] = t; };
            }
            
        };
        
    };
    
}

namespace std { // NOLINT(cert-dcl58-cpp)
    
    // non UB std template specializations
    
    namespace {
        template <class Base>
        using AI = ::array::ArrayInterface<Base>;
    }
    
    template <size_t I, class Base>
    _constexpr const typename AI<Base>::T& get(const AI<Base>& array) noexcept {
        return array.template get<I>();
    }
    
    template <size_t I, class Base>
    _constexpr typename AI<Base>::T& get(AI<Base>& array) noexcept {
        return array.template get<I>();
    }
    
    template <class Base>
    struct tuple_size<AI<Base>> : public tuple_size<Base> {};
    
    template <size_t I, class Base>
    struct tuple_element<I, AI<Base>> {
        using type = tuple_element_t<I, Base>;
    };
    
    template <class Base>
    _constexpr void swap(AI<Base>& lhs, AI<Base>& rhs) noexcept(noexcept(swap(lhs.a, rhs.a))) {
        swap(lhs.array(), rhs.array());
    }
    
}

#define COMMA ,

/**
 * Specialize std::tuple_size and std::tuple_element for a type
 * that has a dependent tuple_size and tuple_element type
 */
#define enable_tuple_templated(Tuple, TemplateDeclaration, TemplateVars) \
namespace std { \
    \
    template <TemplateDeclaration> \
    struct tuple_size<Tuple<TemplateVars>> : public Tuple<TemplateVars>::tuple_size {}; \
    \
    template <size_t __I, TemplateDeclaration> \
    struct tuple_element<__I, Tuple<TemplateVars>> : public Tuple<TemplateVars>::template tuple_element<__I> {}; \
    \
}

#define enable_tuple(Tuple) \
namespace std { \
    \
    template <> \
    struct tuple_size<Tuple> : public Tuple::tuple_size {}; \
    \
    template <size_t I> \
    struct tuple_element<I, Tuple> : public Tuple::template tuple_element<I> {}; \
    \
}
