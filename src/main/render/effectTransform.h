//
// Created by Khyber on 5/2/2019.
//

#pragma once

#include "src/main/render/utils.h"
#include "Silhouette.h"

namespace scratch::render::effectTransform {

    Silhouette::Color color(const Drawable& drawable, Silhouette::Color color, u32 effectMask = 0xffffffff) noexcept;
    
    Vec2 point(const Drawable& drawable, Vec2 v) noexcept;

}
