//
// Created by Khyber on 5/1/2019.
//

#include "Skin.h"

#include "Drawable.h"

namespace scratch::render {
    
    Rect Skin::getFenceBounds(Drawable& drawable) noexcept {
        return drawable.getFastBounds();
    }
    
}