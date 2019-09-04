//
// Created by Khyber on 5/11/2019.
//

#include "grid.h"

namespace render::hull {
    
    Grid::Grid(const Points& points, f32 cellSize) : cellSize(cellSize) {
        for (const auto& point : points) {
            cells.emplace(xy(point), 0)
                    .first // pair iterator, second is if inserted
                    ->second // value
                    .push_back(point);
        }
    }
    
    const Points& Grid::cellPoints(const Grid::XY& xy) const noexcept {
        return stde::get_or_default(cells, xy, emptyCell);
    }
    
    Points& Grid::cellPoints(const Grid::XY& xy) noexcept {
        return stde::get_or_default(cells, xy, emptyCell);
    }
    
    Points Grid::pointsInRange(const Rect& bbox) const noexcept {
        Points points;
        forEachPointInRange(bbox, [&points](const auto& point) {
            points.push_back(point);
        });
        return points;
    }
    
    void Grid::removePoint(const Point& point) noexcept {
        auto& cell = cellPoints(xy(point));
        const auto it = std::find(cell.begin(), cell.end(), point);
        if (it != cell.end()) {
            cell.erase(it);
        }
    }
    
}
