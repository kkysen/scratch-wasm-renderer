//
// Created by Khyber on 5/17/2019.
//

#pragma once

#include "Mat.h"
#include "utils.h"
#include "interval.h"

namespace math {
    
    template <size_t N, typename T = f32>
    class NRect {
    
    public:
        
        using Point = Vec<N, T>;
        
        template <typename U>
        using ArrayView = Corrade::Containers::ArrayView<U>;
        
        Mat<2, N, T> intervals;
        
        _constexpr const Point& min() const noexcept {
            return intervals.col(0);
        }
        
        _constexpr Point& min() noexcept {
            return intervals.col(0);
        }
        
        _constexpr const Point& max() const noexcept {
            return intervals.col(1);
        }
        
        _constexpr Point& max() noexcept {
            return intervals.col(1);
        }
        
        explicit _constexpr NRect(const Mat<2, N, T>& intervals) noexcept : intervals(intervals) {}
        
        explicit _constexpr NRect(const Mat<N, 2, T>& intervalsTranspose) noexcept : NRect(
                intervalsTranspose.transpose()) {}
        
        _constexpr NRect(const Point& min, const Point& max) noexcept : NRect(Mat({min, max})) {}
        
        static _constexpr NRect zero() noexcept {
            return NRect(Mat<2, N, T>::zero());
        }
        
        _constexpr void bound(ArrayView<const Point> points) noexcept {
            for (const auto& point : points) {
                for (size_t i = 0; i < N; i++) {
                    auto&[min, max] = intervals[i];
                    const auto x = point[i];
                    min = math::min(min, x);
                    max = math::max(max, x);
                }
            }
        }
        
        static _constexpr NRect bounding(ArrayView<const Point> points) noexcept {
            const auto bounds = zero();
            bounds.bound(points);
            return bounds;
        }
        
        _constexpr Point size() const noexcept {
            return max() - min();
        }
        
        _constexpr void orient() noexcept {
            intervals.matrix.mutForEach(interval::orient);
        }
        
        static _constexpr NRect checked(const Point& c1, const Point& c2) noexcept {
            const auto rect = NRect(c1, c2);
            rect.orient();
            return rect;
        }
        
        _constexpr bool contains(const Point& p, interval::Contains<T> contains = interval::contains) const noexcept {
            return intervals.matrix.mapIndexed([&p, contains](const auto& interval, auto i) {
                return contains(interval, p[i]);
            }).fold(std::logical_and());
        }
        
        // TODO? I'm not sure how to compute all the corners of an N-D rectangle.
        
        static _constexpr NRect combine(const NRect& a, const NRect& b, Extreme<T> minOp, Extreme<T> maxOp) noexcept {
            return NRect(Vec<N>::mapIndex([&a, &b, minOp, maxOp](auto i) {
                const auto& aa = a.intervals[i];
                const auto& bb = b.intervals[i];
                return interval::Interval(
                    minOp(aa[0], bb[0]),
                    maxOp(aa[1], bb[1])
                );
            }));
        }
        
        static _constexpr NRect intersection(const NRect& a, const NRect& b) noexcept {
            return combine(a, b, math::max, math::min);
        }
        
        static _constexpr NRect& union_(const NRect& a, const NRect& b) noexcept {
            return combine(a, b, math::min, math::max);
        }
        
        _constexpr NRect operator&(const NRect& other) noexcept {
            return intersection(*this, other);
        }
        
        _constexpr NRect operator|(const NRect& other) noexcept {
            return union_(*this, other);
        }
        
        _constexpr NRect clamped(const NRect& bounds) noexcept {
            const auto clamped = *this & bounds;
            clamped.orient();
            return clamped;
        }
        
    };
    
}
