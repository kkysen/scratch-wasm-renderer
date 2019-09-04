//
// Created by Khyber on 5/1/2019.
//

#pragma once

#include "types.h"
#include "IsTouching.h"
#include "Silhouette.h"

#include <memory>

namespace render::scratch {
    
    class Skin {

    public:
    
        // TODO should this be public
        static constexpr Vec2 zero = Vec2::zero();
        
    private:
        
        Id _id;
    
    protected:
        
        Renderer& renderer;
    
    public:
        
        Vec2 _rotationCenter;
        struct Uniforms {
            mutable Vec2 skinSize;
            mutable std::unique_ptr<JS> skin; // WebGLTexture
        } _uniforms;
        Silhouette silhouette;

    protected:
        
        Skin(Id id, Renderer& renderer) noexcept : _id(id), renderer(renderer) {}
        
    public:
        
        constexpr const Id& id() const noexcept {
            return _id;
        }
        
        constexpr const Vec2& rotationCenter() const noexcept {
            return _rotationCenter;
        }
        
        virtual const Vec2& size() const noexcept;
        
        void setRotationCenter(const Vec2& rotationCenter) noexcept;
        
        Vec2 calculateRotationCenter() const noexcept;
        
        virtual std::unique_ptr<JS> getTexture() const noexcept;
    
    protected:
        
        virtual ~Skin() noexcept;
    
    private:
        
        static Rect getFenceBounds(Drawable& drawable) noexcept;
    
    public:
        
        const Uniforms& uniforms() const noexcept;
        
        virtual bool isRaster() const noexcept;
        
        virtual void updateSilhouette() noexcept;
        
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
