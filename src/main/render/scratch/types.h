//
// Created by Khyber on 5/1/2019.
//

#pragma once

#include "src/main/render/types.h"

#include "src/share/common/math/Vec2.h"
#include "src/share/common/math/Vec3.h"
#include "src/share/common/math/Mat4.h"
#include "src/share/common/math/Rect.h"

namespace render::scratch {
    
    using Float = f32;
    
    using Vec2 = math::Vec2<Float>;
    using Vec3 = math::Vec3<Float>;
    using Mat4 = math::Mat4<Float>;
    using Rect = math::Rect<Float>;
    
    class JS {};
    
    class Drawable;
    class Renderer;
    
}
