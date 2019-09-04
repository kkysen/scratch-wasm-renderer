//
// Created by Khyber on 4/28/2019.
//

#pragma once

#include <src/share/common/numbers.h>
#include <array>
#include <src/main/render/Id.h>
#include <src/share/common/math/Vec.h>

namespace render {
    
    class Color {
    
    public:
        
        union {
            struct {
                f32 r;
                f32 g;
                f32 b;
                f32 a;
            };
            struct {
                f32 red;
                f32 green;
                f32 blue;
                f32 alpha;
            };
            math::Vec<3, f32> rgb;
            math::Vec<4, f32> rgba;
        };
        
        constexpr Color(f32 r, f32 g, f32 b, f32 a = 1.0) noexcept
                : r(r), g(g), b(b), a(a) {}
        
        explicit constexpr Color(const math::Vec<4, f32>& rgba) noexcept : rgba(rgba) {}
    
        explicit constexpr Color(const math::Vec<3, f32>& rgb, f32 a = 1.0) noexcept : Color(rgb[0], rgb[1], rgb[2], a) {}
        
    };
    
}
