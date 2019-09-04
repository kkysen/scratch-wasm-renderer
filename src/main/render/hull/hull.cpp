//
// Created by Khyber on 5/10/2019.
//

#include "hull.h"
#include <src/share/stde/contains.h>
#include "convex.h"
#include "grid.h"

#include <unordered_set>

namespace {
    
    using namespace render;
    using namespace render::hull;
    
    // TODO sorting and then filtering consecutive duplicates
    // should I use a sorted tree set?
    
    void sortByX(Points& points) noexcept {
        std::sort(points.begin(), points.end(), [](const auto& a, const auto& b) {
            return a[0] < b[0] || (a[0] == b[0] && a[1] < b[1]);
        });
    }
    
    void filterDuplicates(Points& points) noexcept {
        // removes consecutive duplicates
        const auto startOfDuplicates = std::unique(points.begin(), points.end());
        points.erase(startOfDuplicates, points.end());
    }
    
    Point calcOccupiedArea(const Points& points) noexcept {
        constexpr auto infinity = std::numeric_limits<f32>::infinity();
        auto min = Point::same(infinity);
        auto max = Point::same(-infinity);
        
        // TODO is this the same as Rect::fromAABB?
        // TODO why is this iterated in reverse, it doesn't change anything, right?
        // if so, ArrayView can be passed to Rect::fromAABB without modification,
        // or else I'll have to create an iterator version of Rect::fromAABB
        for (auto it = points.rbegin(); it != points.rend(); it++) {
            const auto p = *it;
            if (p[0] < min[0]) {
                min[0] = p[0];
            }
            if (p[1] < min[1]) {
                min[1] = p[1];
            }
            if (p[0] > max[0]) {
                max[0] = p[0];
            }
            if (p[1] > max[1]) {
                max[1] = p[1];
            }
        }
        
        return max - min;
    }
    
    constexpr f32 MAX_SEARCH_BBOX_SIZE_PERCENT = 0.6;
    
    using Edge = math::Vec2<Point>;
    using EdgeSkipList = std::unordered_set<Edge, Edge::Hash>;
    
    constexpr bool intersects(const Edge& segment1, const Edge& segment2) noexcept {
        const auto& s1 = segment1;
        const auto& s2 = segment2;
        using math::ccw;
        return ccw(s1[0], s2[0], s2[1]) != ccw()
    }
    
    constexpr bool intersects(const Edge& segment, const Points& points) noexcept {
    
    }
    
    constexpr f32 cos(const Point& origin, const Point& a, const Point& b) {
        return math::cosineSimilarity(a - origin, b - origin);
    }
    
    const f32 MAX_CONCAVE_ANGLE_COS = std::cos(math::PI_4); // angle = 90 deg
    
    std::optional<Point> midPoint(const Edge& edge, const Grid& grid, const Rect& bbox, const Points& convex) {
        std::optional<Point> midPoint = std::nullopt;
        grid.forEachPointInRange(bbox, [&edge](const Point& point) {
            const auto a1Cos = cos(edge[0], edge[1], point);
            const auto a2Cos = cos(edge[1], edge[0], point);
            
        });
        return midPoint;
    }
    
    Points concave(const Points& convex, f32 maxEdgeLength, const Point& maxSearchArea, Grid& grid, EdgeSkipList& edgeSkipList) noexcept {
        const auto maxSquareEdgeLength = maxEdgeLength * maxEdgeLength;
        for (size_t i = 0; i < convex.size() - 1; i++) {
            const auto edge = Edge(convex[i], convex[i + 1]);
            if ((edge[1] - edge[0]).norm2() < maxSquareEdgeLength || stde::contains(edgeSkipList.begin(), edgeSkipList.end(), edge)) {
                continue;
            }
            f32 scaleFactor = 0;
            auto bbox = Rect::fromPoints(edge[0], edge[1]);
            do {
            
            } while ();
        }
    }
    
    void hull(Points& points, f32 concavity) noexcept {
        if (points.empty()) {
            return;
        }
        
        sortByX(points);
        filterDuplicates(points);
        
        if (points.size() < 4) {
            points.push_back(points[0]);
            return;
        }
        
        const auto occupiedArea = calcOccupiedArea(points);
        const auto maxSearchArea = occupiedArea * MAX_SEARCH_BBOX_SIZE_PERCENT;
        
        const auto convex = hull::convex(points);
        
        // TODO should these be sets?
        Points innerPoints;
        innerPoints.reserve(points.size());
        // TODO don't call non-const iterator methods when vector is non const when I want const iterators
        std::copy_if(points.begin(), points.end(), innerPoints.begin(), [&convex](const auto& p) {
            return stde::contains(convex.begin(), convex.end(), p);
        });
        
        const auto cellSize = std::ceil(1 / (points.size() / (occupiedArea.fold(std::multiplies()))));
        
        const auto maxEdgeLength = concavity;
        return concave(convex, concavity, maxSearchArea, grid(innerPoints, cellSize), {});
    }
    
}

namespace render::hull {
    
    void hull(Points& points, f32 concavity) noexcept {
        return ::hull(points, concavity);
    }
    
}
