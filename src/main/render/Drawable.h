//
// Created by Khyber on 4/27/2019.
//

#pragma once

#include "src/main/render/utils.h"
#include <src/share/common/numbers.h>
#include <src/main/render/Color.h>
#include <src/main/render/Id.h>
#include "src/main/render/Skin.h"
#include "effectTransform.h"
#include "shaderEffects.h"
#include <src/share/common/math/math.h>
#include <src/share/stde/by.h>
#include <memory>
#include <vector>
#include <functional>

namespace scratch::render {
    
    class Drawable {
    
    public:
        
        Id id;
    
    private:
        
        using Effect = shader::effects::Effect;
        using Effects = shader::effects::Effects;
        
        static constexpr Color colorFromId(Id id) {
            return Color::encodeId(id);
        }
        
        // TODO is this ever used?
        static Id idFromColor(const Color& color) {
            return color.decodeId();
        }
        
        struct Uniforms {
            
            Mat4 modelMatrix = Mat4::identity();
            Color silhouetteColor;
            Effects effects = Effects();
            
            explicit constexpr Uniforms(Id id) noexcept : silhouetteColor(colorFromId(id)) {}
            
        } _uniforms;
        
        static constexpr f32 NORMAL_SCALE = 100;
        
        Vec2 position = Vec2::zero();
        Vec2 _scale = Vec2::same(NORMAL_SCALE); // percentages, so (100, 100) is normal
        u8 direction = 2; // 90 deg, multiple of pi/4 radians, TODO check if this is precise enough
        bool transformDirty = true;
        
        Mat4 rotationMatrix = Mat4::identity();
        bool rotationTransformDirty = true;
        Vec2 rotationAdjusted = Vec2::zero();
        bool rotationCenterDirty = true;
        
        std::unique_ptr<Skin> _skin = nullptr;
        Vec2 skinScale = Vec2::zero();
        bool skinScaleDirty = true;
        
        Mat4 inverseMatrix = Mat4::identity();
        bool inverseTransformDirty = true;
        
        bool _visible = true;
        
        ArrayView<Vec2> convexHullPoints = nullptr;
        bool convexHullDirty = true;
    
    public:
        
        explicit constexpr Drawable(Id id) noexcept : id(id), _uniforms(id) {}
        
        const Skin& skin() const noexcept {
            #ifndef NDEBUG
            assert(!!_skin);
            #endif
            return *_skin;
        }
        
        // setSkin()
        
        // TODO figure out skin pointer semantics
        
        void dispose() {
            // TODO call setter
            _skin = nullptr;
        }
        
        constexpr void setTransformDirty() noexcept {
            transformDirty = true;
            inverseTransformDirty = true;
        }
        
        Vec2 scale() const noexcept {
            return _scale;
        }
        
        constexpr u32 getEnabledEffects() const noexcept {
            return _uniforms.effects.bits;
        }
        
        constexpr const Uniforms& uniforms() const noexcept {
            return _uniforms;
        }
        
        constexpr bool visible() const noexcept {
            return _visible;
        }
        
        void updatePosition(const Vec2& _position) noexcept {
            if (position == _position) {
                return;
            }
            position = _position.map(roundf);
            setTransformDirty();
        }
        
        void updateDirection(u8 _direction) noexcept {
            if (direction == _direction) {
                return;
            }
            direction = _direction;
            rotationTransformDirty = true;
            setTransformDirty();
        }
        
        void updateScale(const Vec2& scale) noexcept {
            if (_scale == scale) {
                return;
            }
            _scale = scale;
            rotationCenterDirty = true;
            skinScaleDirty = true;
            setTransformDirty();
        }
        
        void updateVisibility(bool visible) noexcept {
            if (_visible == visible) {
                return;
            }
            _visible = visible;
            setConvexHullDirty();
        }
        
        void updateEffects(ArrayView<const Effect> effects) noexcept {
            _uniforms.effects.update(effects);
            convexHullDirty = std::any_of(effects.begin(), effects.end(), std::mem_fn(&Effect::shapeChanges));
        }
        
        // updateProperties
    
    private:
        
        void calculateRotationTransform() noexcept {
            if (!rotationTransformDirty) {
                return;
            }
            const auto rotation = Vec2::ofAngle((6 - direction) * math::PI_4);
            rotationMatrix.setVec2(0) = rotation;
            rotationMatrix.setVec2(2) = Vec2(-rotation.y(), rotation.x());
            rotationTransformDirty = false;
        }
        
        void calculateRotationCenter() noexcept {
            if (!(rotationCenterDirty && _skin)) {
                return;
            }
            const auto& skin_ = skin();
            rotationAdjusted = (skin_.rotationCenter() - (skin_.size() * 0.5f)) * _scale / NORMAL_SCALE;
            rotationAdjusted.y() *= -1;
            rotationCenterDirty = false;
        }
        
        void calculateSkinScale() noexcept {
            if (!(skinScaleDirty && _skin)) {
                return;
            }
            skinScale = skin().size() * _scale / NORMAL_SCALE;
            skinScaleDirty = false;
        }
        
        void calculateModelMatrix() noexcept {
            auto& modelMatrix = _uniforms.modelMatrix;
            const auto rotation = rotationMatrix.truncate<2, 2>().matrix;
            modelMatrix.subAssign(math::Mat(skinScale * rotation));
            modelMatrix.setVec2(6) = math::dot(rotation, rotationAdjusted) + position;
        }
        
        void calculateTransform() noexcept {
            if (!transformDirty) {
                return;
            }
            calculateRotationTransform();
            calculateRotationCenter();
            calculateSkinScale();
            calculateModelMatrix();
            transformDirty = false;
        }
    
    public:
        
        constexpr bool needsConvexHullPoints() const noexcept {
            // TODO check, esp. if convexHullPoints should be a nullable pointer
            return convexHullDirty || convexHullPoints.empty();
        }
        
        constexpr void setConvexHullDirty() noexcept {
            convexHullDirty = true;
        }
        
        constexpr void setConvexHullPoints(ArrayView<Vec2> points) noexcept {
            convexHullPoints = points;
            convexHullDirty = false;
        }
        
        
        Vec2 getLocalPosition(const Vec2& v) const noexcept {
            const auto& m = inverseMatrix;
            const auto col = m.col(3);
            const auto d = math::dot(v, col.truncate<2>()) + col[3];
            const Vec2 p = (m.truncate<2, 2>() * v) + (m.vec2(6) / d);
            const auto localPosition = Vec2(-p.x() + 0.5, p.y() + 0.5);
            return effectTransform::point(*this, localPosition);
        }
        
        constexpr bool scaleIsNormal() const noexcept {
            return Rect(Vec2::same(NORMAL_SCALE - 1), Vec2::same(NORMAL_SCALE + 1)).contains(_scale);
        }
        
        constexpr bool useNearest() const noexcept {
            return skin().isRaster() || (direction % 2 == 0 && scaleIsNormal());
        }
        
        constexpr bool isTouching(const Vec2& v) const noexcept {
            return _skin && skin().isTouching()(getLocalPosition(v), useNearest());
        }
    
    private:
        
        static std::vector<Vec2> _transformedHullPoints; // buffer
        
        std::vector<Vec2>& getTransformedHullPoints() noexcept {
            const auto projection = Mat4::ortho(array::range<3>().filled(Vec2(-1, 1)));
            const auto skinSize = skin().size();
            const Vec2 halfPixel = 1.0f / skinSize * 0.5f;
            const auto adjustedHalfPixel = Vec2(-halfPixel.x() + 0.5, halfPixel.y() - 0.5);
            const auto tm = _uniforms.modelMatrix * projection;
            auto& transformed = _transformedHullPoints;
            transformed.clear();
            transformed.reserve(convexHullPoints.size());
            for (const auto point : convexHullPoints) {
                const auto glPoint = point / skinSize + adjustedHalfPixel;
                const auto transformedGlPoint = tm * glPoint;
                transformed.emplace_back(transformedGlPoint);
            }
            return transformed;
        }
        
        std::vector<Vec2>& getTransformedAndFilteredHullPoints() noexcept {
            auto& transformed = getTransformedHullPoints();
            const auto slice = 8;
            const auto maxY = stde::maxBy(transformed.begin(), transformed.end(), Vec2::getter::y)->y();
            std::remove_if(transformed.begin(), transformed.end(), [maxY](Vec2 v) { return v.y() > maxY - slice; });
            return transformed;
        }
        
        void assertNeedsConvexHullPoints() noexcept {
            assert(!needsConvexHullPoints());
        }
    
    public:
        
        Rect getBounds() noexcept {
            assertNeedsConvexHullPoints();
            calculateTransform();
            return Rect::fromAABB(getTransformedHullPoints());
        }
        
        Rect getBoundsForBubble() noexcept {
            assertNeedsConvexHullPoints();
            calculateTransform();
            return Rect::fromAABB(getTransformedAndFilteredHullPoints());
        }
    
    private:
        
        constexpr Rect getAABBNoCalc() const noexcept {
            const auto rect = Rect(Vec2::same(-0.5), Vec2::same(0.5));
            return Rect::fromAABB((_uniforms.modelMatrix.truncate<2, 2>() * rect.corners().matrix)
                                          .vector
                                          .map([](const auto& x) { return Vec2(x); })
                                          .view());
        }
    
    public:
        
        Rect getAABB() noexcept {
            calculateTransform();
            return getAABBNoCalc();
        }
        
        void updateMatrix() noexcept {
            calculateTransform();
            if (!inverseTransformDirty) {
                return;
            }
            auto& inv = inverseMatrix;
            inv = _uniforms.modelMatrix;
            inv[2][2] = 1;
            inv = inv.inverse();
            inverseTransformDirty = false;
        }
        
        Rect getFastBounds() noexcept {
            updateMatrix();
            if (!needsConvexHullPoints()) {
                return getBounds();
            } else {
                return getAABB();
            }
        }
    
    private:
        
        constexpr void skinWasAltered() noexcept {
            rotationCenterDirty = true;
            skinScaleDirty = true;
            setConvexHullDirty();
            setTransformDirty();
        }
    
    public:
        
        Silhouette::Color sampleColor(Vec2 v) const noexcept {
            const auto localPosition = getLocalPosition(v);
            if (!Rect(Vec2::same(0), Vec2::same(0)).contains(localPosition)) {
                return Silhouette::noColor(); // TODO is this right?
            }
            const auto textColor = skin().colorAtNearest(localPosition);
            return effectTransform::color(*this, textColor);
        }
        
    };
    
    std::vector<Vec2> Drawable::_transformedHullPoints = {};
    
}
