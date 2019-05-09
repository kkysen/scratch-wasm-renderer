//
// Created by Khyber on 5/1/2019.
//

#pragma once

#include "src/share/common/math/Vec2.h"
#include "src/share/common/math/Vec3.h"
#include "src/share/common/math/Mat4.h"
#include "src/share/common/math/Rect.h"

#define CORRADE_ARRAYVIEW_STL_COMPATIBILITY 1

#include "src/share/lib/corrade/CorradeArrayView.h"

namespace render {
    
    using Float = f32;
    
    using Vec2 = math::Vec2<Float>;
    using Vec3 = math::Vec3<Float>;
    using Mat4 = math::Mat4<Float>;
    using Rect = math::Rect<Float>;
    
    using Corrade::Containers::ArrayView;
    using Corrade::Containers::StaticArrayView;
    
    class JS {};
    
    class Drawable;
    
}
