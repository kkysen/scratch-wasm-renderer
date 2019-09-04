//
// Created by Khyber on 5/11/2019.
//

#pragma once

#include "types.h"
#include "src/share/stde/get_or_default.h"

#include <unordered_map>

namespace render::hull {
    
    class Grid {
    
    private:
        
        using XY = math::Vec2<u32>;
        
        static Points emptyCell;
        
        std::unordered_map<XY, Points, XY::Hash> cells;
        f32 cellSize;
        
        constexpr XY xy(const Point& point) const noexcept {
            return (point / cellSize).cast<u32>();
        }
    
    public:
        
        Grid(const Points& points, f32 cellSize);
    
    private:
        
        const Points& cellPoints(const XY& xy) const noexcept;
        
        Points& cellPoints(const XY& xy) noexcept;
    
    public:
        
        constexpr Rect extendBbox(const Rect& bbox, f32 scaleFactor) const noexcept {
            const auto scale = Point::same(scaleFactor * cellSize);
            return Rect(bbox.bottomLeft - scale, bbox.topRight + scale);
        }
        
        template <class F>
        void forEachPointInRange(const Rect& bbox, F f) const noexcept {
            // thinking of 2D array/map as upside down
            const auto topLeftXY = xy(bbox.bottomLeft);
            const auto bottomRightXY = xy(bbox.topRight);
            for (auto x = topLeftXY[0]; x <= bottomRightXY[0]; x++) {
                for (auto y = topLeftXY[1]; y <= bottomRightXY[1]; y++) {
                    for (const auto& point : cellPoints({x, y})) {
                        f(point);
                    }
                }
            }
        }
        
        Points pointsInRange(const Rect& bbox) const noexcept;
        
        void removePoint(const Point& point) noexcept;
        
    };
    
}
