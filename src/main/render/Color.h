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
    
    private:
        
        static constexpr f32 encode(Id id, size_t bits) noexcept {
            return ((id >> bits) & 255u) / 255.0;
        }
        
        static constexpr Id decode(f32 encoded, size_t bits) noexcept {
            return (static_cast<Id>(encoded) & 255u) << bits;
        }
    
    public:
        
        static constexpr Color encodeId(Id id) noexcept {
            id -= Id::none();
            return Color(encode(id, 0), encode(id, 8), encode(id, 16));
        }
        
        constexpr Id decodeId() const noexcept {
            return (decode(r, 0) | decode(g, 8) | decode(b, 16)) + Id::none();
        }
        
    };
    
}
