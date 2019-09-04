//
// Created by Khyber on 5/11/2019.
//

#pragma once

#include "src/main/render/Color.h"
#include "src/main/render/Id.h"

namespace {
    
    using render::Id;
    using render::Color;
    
    constexpr f32 encode(Id id, size_t bits) noexcept {
        return ((id >> bits) & 255u) / 255.0;
    }
    
    constexpr Id decode(f32 encoded, size_t bits) noexcept {
        return (static_cast<Id>(encoded) & 255u) << bits;
    }
    
    constexpr Color encodeId(Id id) noexcept {
        return array::range<3>()
                .map([id = id - Id::none()](auto i) { return encode(id, i * 8); })
                .wrap([](auto&& x) { return Color(x); });
    }
    
    constexpr Id decodeId(const Color& color) noexcept {
        return color
                       .rgb
                       .mapIndexed([](auto rgb, auto i) { return decode(rgb, i * 8); })
                       .fold(std::bit_or()) + Id::none();
    }
    
}

namespace render::scratch::color {
    
    constexpr Color encodeId(Id id) noexcept {
        return ::encodeId(id);
    }
    
    constexpr Id decodeId(const Color& color) noexcept {
        return ::decodeId(color);
    }
    
}
