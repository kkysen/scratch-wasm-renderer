//
// Created by Khyber on 5/2/2019.
//

#include "src/main/render/scratch/types.h"

constexpr i64 _random() {
    return 100;
}

// TODO Note: -mllvm -inline-threshold=N (default 225) must be set higher to inline all the array::Array methods.
// However, this might not be optimal for WASM as a program-wide optimization
// Instead, I only want the high inline threshold for array::Array, array::ArrayInterface, and inheriting classes like Vec.
// Although it does appear Vec<4> and Mat<4, 4> are still inlined, which are the important ones.
// I don't use higher dimensions in my code.
// "[^:\.]array" shouldn't appear in the IR if everything is correctly inlined.

extern "C"
int f1() {
    using namespace math;
    Vec<2> a = Vec<2>::same(1) / static_cast<f32>(_random());
    Vec<2> b = Vec<2>::same(2) * static_cast<f32>(_random());
//    Vec<2> c = Vec<2>({0.5, -0.5});
//    Vec<2> d = Vec2<>::ofAngle(math::PI_2 * 1.5);
//    Vec<2> e = a * b + c * 1.6f - (d * b) / 2.f / (a + c / b).normalized().norm();
    Vec<16, Vec<2>> v = Vec<16, Vec<2>>(
            {a * 1.f, b * 2.f, a * 3.f, b * 4.f, a * 5.f, b * 6.f, a * 7.f, b * 8.f, a * 9.f, b * 10.f, a * 11.f,
             b * 12.f, a * 13.f, b * 14.f, a * 15.f, b * 16.f});
    Mat<16, 2> A(v);
    Vec<16> f = A * a;
//    for (auto x : f.array) {
//        printf("%f\n", x);
//    }
    auto norm2 = f.norm2();
    return static_cast<int>(norm2);
}

extern "C"
int f2() {
    f32 r1 = static_cast<f32>(_random());
    f32 a0 = 1 / r1;
    f32 a1 = 1 / r1;
    f32 r2 = static_cast<f32>(_random());
    f32 b0 = 2 * r2;
    f32 b1 = 2 * r2;
    f32 A00 = a0 * 1.f;
    f32 A01 = a1 * 1.f;
    f32 A10 = b0 * 2.f;
    f32 A11 = b1 * 2.f;
    f32 A20 = a0 * 3.f;
    f32 A21 = a1 * 3.f;
    f32 A30 = b0 * 4.f;
    f32 A31 = b1 * 4.f;
    f32 A40 = a0 * 5.f;
    f32 A41 = a1 * 5.f;
    f32 A50 = b0 * 6.f;
    f32 A51 = b1 * 6.f;
    f32 A60 = a0 * 7.f;
    f32 A61 = a1 * 7.f;
    f32 A70 = b0 * 8.f;
    f32 A71 = b1 * 8.f;
    f32 A80 = a0 * 9.f;
    f32 A81 = a1 * 9.f;
    f32 A90 = b0 * 10.f;
    f32 A91 = b1 * 10.f;
    f32 A100 = a0 * 11.f;
    f32 A101 = a1 * 11.f;
    f32 A110 = b0 * 12.f;
    f32 A111 = b1 * 12.f;
    f32 A120 = a0 * 13.f;
    f32 A121 = a1 * 13.f;
    f32 A130 = b0 * 14.f;
    f32 A131 = b1 * 14.f;
    f32 A140 = a0 * 15.f;
    f32 A141 = a1 * 15.f;
    f32 A150 = b0 * 16.f;
    f32 A151 = b1 * 16.f;
    f32 f0 = A00 * a0 + A01 * a1;
    f32 f1 = A10 * a0 + A11 * a1;
    f32 f2 = A20 * a0 + A21 * a1;
    f32 f3 = A30 * a0 + A31 * a1;
    f32 f4 = A40 * a0 + A41 * a1;
    f32 f5 = A50 * a0 + A51 * a1;
    f32 f6 = A60 * a0 + A61 * a1;
    f32 f7 = A70 * a0 + A71 * a1;
    f32 f8 = A80 * a0 + A81 * a1;
    f32 f9 = A90 * a0 + A91 * a1;
    f32 f10 = A100 * a0 + A101 * a1;
    f32 f11 = A110 * a0 + A111 * a1;
    f32 f12 = A120 * a0 + A121 * a1;
    f32 f13 = A130 * a0 + A131 * a1;
    f32 f14 = A140 * a0 + A141 * a1;
    f32 f15 = A150 * a0 + A151 * a1;
    f32 norm2 = (f0 * f0 + f1 * f1 + f2 * f2 + f3 * f3 + f4 * f4 + f5 * f5 + f6 * f6 + f7 * f7 + f8 * f8 + f9 * f9 +
                 f10 * f10 + f11 * f11 + f12 * f12 + f13 * f13 + f14 * f14 + f15 * f15);
    return static_cast<int>(norm2);
}

extern "C"
int f3() {
    return array::range<100>().cast<int>()
            .map([](auto i) { return i * 2; })
            .mapIndexed([](auto i, auto j) { return i * j; })
            .fold(std::plus<>());
}

extern "C"
int f4(int n) {
    // loop optimized into multiplication
    int triangle = 0;
    for (int i = 0; i < n; i++) {
        triangle += (i * i * i * i * i);
    }
    return triangle;
}

extern "C"
int f5() {
    using namespace math;
    Vec<4> a = Vec<4>::same(1) / static_cast<f32>(random());
    Vec<4> b = Vec<4>::same(4) * static_cast<f32>(random());
    Vec<4> c = Vec<4>({0.5, -0.5});
    Vec<4> d = Vec2<>::ofAngle(math::PI_4 * 1.5).extend<4>(1);
    Vec<4> e = a * b + c * 1.6f - (d * b) / 4.f / (a + c / b).normalized().norm();
    Vec<4, Vec<4>> v = Vec<4, Vec<4>>({a * 13.f, b * 14.f, e * 15.f, b * 16.f});
    Mat<4, 4> A(v);
    Vec<4> f = A * a;
//    for (auto x : f.array) {
//        printf("%f\n", x);
//    }
    return static_cast<int>(f.norm());
}

int main(int argc, char**) {
    return f1() + f2() + f3() + f4(argc) + f5();
}
