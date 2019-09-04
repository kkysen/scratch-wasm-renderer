//
// Created by Khyber on 5/11/2019.
//

#pragma once

#include "types.h"

namespace render::hull {
    
    // points are already sorted by X
    Points convex(const Points& points) noexcept;

}
