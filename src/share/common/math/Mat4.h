//
// Created by Khyber on 4/28/2019.
//

#pragma once

#include <array>
#include <src/share/common/numbers.h>
#include <src/share/common/Setter.h>
#include "Vec2.h"
#include "Vec3.h"
#include "Mat.h"

namespace math {
    
    template <typename T = f32>
    class Mat4 : public Mat<4, 4, T> {
    
    public:
        
        using Base = Mat<4, 4, T>;
        
        /*implicit*/ _constexpr Mat4(const Base& base) noexcept : Base(base) {}
        
        _constexpr Vec2<T> vec2(size_t i) const noexcept {
            const auto j = i * 2;
            return Vec2(this->vector[j], this->vector[j + 1]);
        }
        
        _constexpr auto setVec2(size_t i) noexcept {
            const auto j = i * 2;
            const auto setter = [this, j](const Vec2<T>& v) {
                this->vector[j] = v[0];
                this->vector[j + 1] = v[1];
            };
            return Setter<Vec2<T>, decltype(setter)>(setter);
        }
        
        _constexpr Mat4 inverse() const noexcept {
            const auto& m = *this;
            const auto m00 = m[0][0];
            const auto m01 = m[0][1];
            const auto m02 = m[0][2];
            const auto m03 = m[0][3];
            const auto m10 = m[1][0];
            const auto m11 = m[1][1];
            const auto m12 = m[1][2];
            const auto m13 = m[1][3];
            const auto m20 = m[2][0];
            const auto m21 = m[2][1];
            const auto m22 = m[2][2];
            const auto m23 = m[2][3];
            const auto m30 = m[3][0];
            const auto m31 = m[3][1];
            const auto m32 = m[3][2];
            const auto m33 = m[3][3];
            const auto tmp00 = m22 * m33;
            const auto tmp01 = m32 * m23;
            const auto tmp02 = m12 * m33;
            const auto tmp03 = m32 * m13;
            const auto tmp04 = m12 * m23;
            const auto tmp05 = m22 * m13;
            const auto tmp06 = m02 * m33;
            const auto tmp07 = m32 * m03;
            const auto tmp08 = m02 * m23;
            const auto tmp09 = m22 * m03;
            const auto tmp10 = m02 * m13;
            const auto tmp11 = m12 * m03;
            const auto tmp12 = m20 * m31;
            const auto tmp13 = m30 * m21;
            const auto tmp14 = m10 * m31;
            const auto tmp15 = m30 * m11;
            const auto tmp16 = m10 * m21;
            const auto tmp17 = m20 * m11;
            const auto tmp18 = m00 * m31;
            const auto tmp19 = m30 * m01;
            const auto tmp20 = m00 * m21;
            const auto tmp21 = m20 * m01;
            const auto tmp22 = m00 * m11;
            const auto tmp23 = m10 * m01;
            const auto t0 = tmp00 * m11 + tmp03 * m21 + tmp04 * m31 - (tmp01 * m11 + tmp02 * m21 + tmp05 * m31);
            const auto t1 = tmp01 * m01 + tmp06 * m21 + tmp09 * m31 - (tmp00 * m01 + tmp07 * m21 + tmp08 * m31);
            const auto t2 = tmp02 * m01 + tmp07 * m11 + tmp10 * m31 - (tmp03 * m01 + tmp06 * m11 + tmp11 * m31);
            const auto t3 = tmp05 * m01 + tmp08 * m11 + tmp11 * m21 - (tmp04 * m01 + tmp09 * m11 + tmp10 * m21);
            const auto d = 1.0 / (m00 * t0 + m10 * t1 + m20 * t2 + m30 * t3);
            Mat4 inv = Mat4::zero();
            inv[0][0] = d * t0;
            inv[0][1] = d * t1;
            inv[0][2] = d * t2;
            inv[0][3] = d * t3;
            inv[1][0] = d * (tmp01 * m10 + tmp02 * m20 + tmp05 * m30 - (tmp00 * m10 + tmp03 * m20 + tmp04 * m30));
            inv[1][1] = d * (tmp00 * m00 + tmp07 * m20 + tmp08 * m30 - (tmp01 * m00 + tmp06 * m20 + tmp09 * m30));
            inv[1][2] = d * (tmp03 * m00 + tmp06 * m10 + tmp11 * m30 - (tmp02 * m00 + tmp07 * m10 + tmp10 * m30));
            inv[1][3] = d * (tmp04 * m00 + tmp09 * m10 + tmp10 * m20 - (tmp05 * m00 + tmp08 * m10 + tmp11 * m20));
            inv[2][0] = d * (tmp12 * m13 + tmp15 * m23 + tmp16 * m33 - (tmp13 * m13 + tmp14 * m23 + tmp17 * m33));
            inv[2][1] = d * (tmp13 * m03 + tmp18 * m23 + tmp21 * m33 - (tmp12 * m03 + tmp19 * m23 + tmp20 * m33));
            inv[2][2] = d * (tmp14 * m03 + tmp19 * m13 + tmp22 * m33 - (tmp15 * m03 + tmp18 * m13 + tmp23 * m33));
            inv[2][3] = d * (tmp17 * m03 + tmp20 * m13 + tmp23 * m23 - (tmp16 * m03 + tmp21 * m13 + tmp22 * m23));
            inv[3][0] = d * (tmp14 * m22 + tmp17 * m32 + tmp13 * m12 - (tmp16 * m32 + tmp12 * m12 + tmp15 * m22));
            inv[3][1] = d * (tmp20 * m32 + tmp12 * m02 + tmp19 * m22 - (tmp18 * m22 + tmp21 * m32 + tmp13 * m02));
            inv[3][2] = d * (tmp18 * m12 + tmp23 * m32 + tmp15 * m02 - (tmp22 * m32 + tmp14 * m02 + tmp19 * m12));
            inv[3][3] = d * (tmp22 * m22 + tmp16 * m02 + tmp21 * m12 - (tmp20 * m12 + tmp23 * m22 + tmp17 * m02));
            return inv;
        }
        
        static _constexpr Mat4 ortho(const Mat<2, 3, T>& cube) noexcept {
            const Mat<3, 2, T> sides = cube.transpose();
            return Mat<3, 4, T>::mapIndex([&sides](auto i, auto j) -> f32 {
                if (i != j) {
                    return 0;
                }
                const auto& x = sides[i];
                return 2 / (x[1] - x[0]);
            }).template extendRows<4>(sides.matrix.map([](const auto& x) {
                return (x[0] + x[1]) / (x[0] - x[1]);
            }).template extend<4>(1));
        }
        
    };
    
}
