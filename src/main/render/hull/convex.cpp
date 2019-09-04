//
// Created by Khyber on 5/11/2019.
//

#include "convex.h"

namespace {
    
    using namespace render::hull;
    
    constexpr f32 cross(const Point& origin, const Point& a, const Point& b) {
        return math::cross(a - origin, b - origin);
    }
    
    template <class It>
    Points tangent(It begin, It end) {
        Points points;
        for (auto it = begin; it != end; it++) {
            while (points.size() >= 2 && cross(points.end()[-2], points.end()[-1], *it) <= 0) {
                points.pop_back();
            }
            points.push_back(*it);
        }
        points.pop_back();
        return points;
    }
    
    Points upperTangent(const Points& points) noexcept {
        return tangent(points.begin(), points.end());
    }
    
    Points lowerTangent(const Points& points) noexcept {
        return tangent(points.rbegin(), points.rend());
    }
    
    Points convex(const Points& points) noexcept {
        const auto upper = upperTangent(points);
        auto lower = lowerTangent(points);
        auto& convex = lower;
        convex.insert(lower.end(), upper.begin(), upper.end());
        convex.push_back(points[0]);
        return convex;
    }
    
}

namespace render::hull {
    
    Points convex(const Points& points) noexcept {
        return ::convex(points);
    }
    
}
