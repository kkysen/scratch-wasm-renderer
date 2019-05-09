//
// Created by Khyber on 5/8/2019.
//

#pragma once

#include <type_traits>
#include <array>

namespace stde {
    
    template <typename>
    struct is_std_array : public std::false_type {};
    
    template <typename T, size_t N>
    struct is_std_array<std::array<T, N>> : public std::true_type {};
    
    template <class T>
    constexpr bool is_std_array_v = is_std_array<T>::value;
    
}
