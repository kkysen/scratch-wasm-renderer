//
// Created by Khyber on 5/1/2019.
//

#pragma once

#include "src/main/render/utils.h"
#include "src/main/render/IsTouching.h"
#include "src/main/render/Silhouette.h"

#include <memory>

namespace scratch::render {
    
    class Skin {
    
    private:
        
        Id _id;
        Vec2 _rotationCenter;
        struct Uniforms {
            mutable Vec2 skinSize;
            mutable std::unique_ptr<JS> skin; // WebGLTexture
        } _uniforms;
        Silhouette silhouette;
        
        static constexpr Vec2 zero = Vec2::zero();
    
    public:
        
        constexpr const Id& id() const noexcept {
            return _id;
        }
        
        constexpr const Vec2& rotationCenter() const noexcept {
            return _rotationCenter;
        }
        
        virtual const Vec2& size() const noexcept {
            return zero;
        }
        
        void setRotationCenter(const Vec2& rotationCenter) noexcept {
            const bool emptySkin = size() == Vec2::zero();
            const bool changed = rotationCenter != _rotationCenter;
            if (!emptySkin && changed) {
                _rotationCenter = rotationCenter;
                // emit(Skin.Events.WasAltered)
            }
        }
        
        Vec2 calculateRotationCenter() const noexcept {
            return size() * 0.5f;
        }
        
        virtual std::unique_ptr<JS> getTexture() const noexcept {
            return nullptr;
        }
    
    protected:
        
        // TODO is this supposed to be a destructor
        virtual void dispose() noexcept {
            _id = Id::none();
        }
    
    private:
        
        static Rect getFenceBounds(Drawable& drawable) noexcept;
    
    public:
        
        const Uniforms& uniforms() const noexcept {
            _uniforms.skin = getTexture();
            _uniforms.skinSize = size();
            return _uniforms;
        }
        
        virtual bool isRaster() const noexcept {
            return false;
        }
        
        virtual void updateSilhouette() noexcept {}
        
        constexpr IsTouching<Silhouette> isTouching() const noexcept {
            return IsTouching(silhouette);
        }
        
        constexpr Silhouette::Color colorAtNearest(const Vec2& p) const noexcept {
            return silhouette.colorAtNearest(p);
        }
        
        constexpr Silhouette::Color colorAtLinear(const Vec2& p) const noexcept {
            return silhouette.colorAtLinear(p);
        }
        
    };
    
}
