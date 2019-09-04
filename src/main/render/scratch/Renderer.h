//
// Created by Khyber on 5/10/2019.
//

#pragma once

#include "Drawable.h"
#include "ShaderManager.h"

namespace render::scratch {
    
    enum class UseGpuMode {
        
        automatic,
        forceGPU,
        forceCPU,
        
    };
    
    struct LayerGroup {
        u32 groupIndex;
        u32 drawListOffset;
    };
    
    class Renderer {
    
    private:
        
        math::Rect<u32> size;
        
        UseGpuMode useGpuMode = UseGpuMode::automatic;
        std::vector<Drawable> drawables;
        std::vector<Skin> skins;
        std::vector<u32> drawList;
        std::vector<u32> groupOrdering;
        
        static std::vector<LayerGroup> layerGroups;
        
        Id nextDrawableId = Id::none() + 1;
        Id nextSkinId = Id::none() + 1;
        
        Mat4 projection = Mat4::identity();
        
        ShaderManager shaderManager;
        
        // HTMLCanvasElement tempCanvas
        
        Id regionId; // TODO is than an Id or any?
        
        std::function<void()> exitRegion;
        
        // JS
        // std::vector<void(std::string_view)>snapshotCallbacks;
        
        // JS
        // SVGTextBubble svgTextBubble
        
        Color backgroundColor = Color(Vec3::same(1));
        
        math::Vec2<u32> nativeSize;
    
    public:
        
        template <class Skin, class ...Args>
        Id createSkin(Args&& ... args) {
            const Id id = static_cast<Id>(skins.size());
            skins.emplace_back(id, *this, args...);
            return id;
        }
    
    private:
        
        static i32 findTurningPoint(std::vector<Vec2>& points, Vec2 Q, i32 i, int ccwSign) {
            while (i > 0) {
                if (math::ccw(points[i - 1], points[i], Q) * ccwSign < 0) {
                    break;
                } else {
                    i--;
                }
            }
            assert(i >= 0 && static_cast<u32>(i) < points.size()); // TODO remove if assertion always true
            points[i++] = Q; // TODO check if vector used right
            return i;
        };
        
        
        
        /**
          * Get the convex hull points for a particular Drawable.
          * To do this, draw the Drawable unrotated, unscaled, and untranslated.
          * Read back the pixels and find all boundary points.
          * Finally, apply a convex hull algorithm to simplify the set.
          * @param drawableID The Drawable IDs calculate convex hull for.
          * @return points Convex hull points, as [[x, y], ...]
          */
        ArrayView<Vec2> getConvexHullPointsForDrawable(Id drawableId) {
            const auto& drawable = drawables[drawableId];
            const auto& skin = drawable.skin();
    
            // TODO make sure this is a float
            // I'm pretty sure it is b/c for SVGSkin,
            // it's from <svg>.viewBox.baseVal.{x, y} which can have floats.
            // But in BitmapSkin, even though it's the quotient of two ints,
            // it seems it's supposed to be an int
            const auto _size = skin.size();
            assert(_size.cast<u32>().cast<f32>() == _size);
            // TODO remove assertion if always right and make _size u32
            
            // No points in the hull if invisible or size is 0.
            if (!drawable.visible() || _size == Vec2::zero()) {
                return ArrayView<Vec2>();
            }
            
            // https://github.com/LLK/scratch-flash/blob/dcbeeb59d44c3be911545dfe54d
            // 46a32404f8e69/src/scratch/ScratchCostume.as#L369-L413 Following
            // RasterHull creation, compare and store left and right values that
            // maintain a convex shape until that data can be passed to `hull` for
            // further work.
    
            const auto isTouchableSpot = [&drawable, &skin, &_size](const Vec2& xy) -> bool {
                return skin.isTouching().linear(effectTransform::point(drawable, xy / _size));
            };
    
            const auto findTouchableSpot = [isTouchableSpot](i32 start, i32 stop, i32 step,
                                                             u32 y) -> std::optional<Vec2> {
                for (i32 x = start; x != stop; x += step) {
                    const auto xy = Vec2(x, y);
                    if (isTouchableSpot(xy)) {
                        return xy;
                    }
                }
                return std::nullopt;
            };
            
            const auto[width, height] = _size.cast<u32>();
            std::vector<Vec2> L;
            std::vector<Vec2> R;
            i32 ll = -1;
            i32 rr = -1;
            
            for (u32 y = 0; y < height; y++) {
                if (const auto found = findTouchableSpot(0, width, 1, y)) {
                    ll = findTurningPoint(L, *found, ll, 1);
                } else {
                    // If x is equal to the width there are no touchable points in the skin.
                    // Nothing we can add to L. And looping for R would find the same thing.
                    continue;
                }
                if (const auto found = findTouchableSpot(width - 1, -1, -1, y)) {
                    rr = findTurningPoint(R, *found, rr, -1);
                }
            }
            
            // Truncate L to the index of the last added Q to L.
            // L may have more entries than the index for the last Q.
            L.resize(ll + 1);
            
            // Add points in R to boundaryPoints in reverse so all points in
            // boundaryPoints are clockwise from each other.
            L.insert(L.end(), R.rbegin(), R.rend());
            
            // Simplify boundary points using convex hull.
            return hull(L, Infinity);
        }
        
    };
    
}
