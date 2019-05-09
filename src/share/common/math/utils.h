//
// Created by Khyber on 4/27/2019.
//

#pragma once

#include <src/share/common/numbers.h>
#include <limits>
#include <src/share/common/math/math.h>

namespace math {
    
    constexpr void sort(f32& left, f32& right) noexcept {
        const f32 tmpLeft = left;
        left = min(tmpLeft, right);
        right = max(tmpLeft, right);
    }
    
}
