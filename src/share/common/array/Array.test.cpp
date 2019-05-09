//
// Created by Khyber on 5/5/2019.
//

#include "Array.h"

template <typename T, size_t N>
constexpr T f(const std::array<T, N>& a) noexcept {
    std::array<T, N> A = {};
    static_assert(stde::is_std_array_v<decltype(A)>);
    const auto b = array::Array(a);
    static_assert(std::tuple_size<array::Array<T, N>>() == N);
    auto c = b.mapIndexed([](T x, size_t i) {return x * 2 * i;});
    auto d = c.fold(std::plus<>());
    return d;
}

int main() {
    return f<int, 4>({1, 2, 3, 4});
}
