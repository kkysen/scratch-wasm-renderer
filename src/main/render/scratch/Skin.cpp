//
// Created by Khyber on 5/1/2019.
//

#include "Skin.h"

#include "Drawable.h"

namespace render::scratch {
    
    const Vec2& Skin::size() const noexcept {
        return zero;
    }
    
    void Skin::setRotationCenter(const Vec2& rotationCenter) noexcept {
        const bool emptySkin = size() == Vec2::zero();
        const bool changed = rotationCenter != _rotationCenter;
        if (!emptySkin && changed) {
            _rotationCenter = rotationCenter;
            // emit(Skin.Events.WasAltered) // TODO
        }
    }
    
    Vec2 Skin::calculateRotationCenter() const noexcept {
        return size() * 0.5f;
    }
    
    std::unique_ptr<JS> Skin::getTexture() const noexcept {
        return nullptr;
    }
    
    Skin::~Skin() noexcept {
        _id = Id::none();
    }
    
    Rect Skin::getFenceBounds(Drawable& drawable) noexcept {
        return drawable.getFastBounds();
    }
    
    const Skin::Uniforms& Skin::uniforms() const noexcept {
        _uniforms.skin = getTexture();
        _uniforms.skinSize = size();
        return _uniforms;
    }
    
    bool Skin::isRaster() const noexcept {
        return false;
    }
    
    void Skin::updateSilhouette() noexcept {}
    
}