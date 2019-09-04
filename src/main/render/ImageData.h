//
// Created by Khyber on 5/9/2019.
//

#pragma once

#include "src/main/render/scratch/types.h"
#include <src/share/common/math/Vec.h>

// TODO this shouldn't be in namespace scratch, it wraps JS's ImageData
namespace render {
    
    class Pixel : public math::Vec<4, u8> {
    
    public:
        
        using Base = math::Vec<4, u8>;
        
        /*implicit*/ constexpr Pixel(const Base& base) // NOLINT(google-explicit-constructor,hicpp-explicit-conversions)
                : Base(base) {}
        
        constexpr const u8& r() const noexcept {
            return get<0>();
        }
        
        constexpr u8& r() noexcept {
            return get<0>();
        }
        
        constexpr const u8& g() const noexcept {
            return get<1>();
        }
        
        constexpr u8& g() noexcept {
            return get<1>();
        }
        
        constexpr const u8& b() const noexcept {
            return get<2>();
        }
        
        constexpr u8& b() noexcept {
            return get<2>();
        }
        
        constexpr const u8& a() const noexcept {
            return get<3>();
        }
        
        constexpr u8& a() noexcept {
            return get<3>();
        }
        
    };
    
    class ImageData {
    
    private:
        
        using Vec2 = math::Vec2<u32>;
        
        Pixel* data; // Uint8ClampedArray
        Vec2 _size;
    
    public:
        
        constexpr ImageData(Pixel* data, Vec2 size) noexcept : data(data), _size(size) {}
        
        // JS export
        constexpr ImageData(Pixel* data, u32 width, u32 height) noexcept : ImageData(data, Vec2(width, height)) {}
        
        explicit constexpr ImageData(std::nullptr_t) noexcept : ImageData(nullptr, 0, 0) {}
        
        constexpr const Vec2& size() const noexcept {
            return _size;
        }
        
        constexpr u32 width() const noexcept {
            return size()[0];
        }
        
        constexpr u32 height() const noexcept {
            return size()[1];
        }
        
        explicit constexpr operator bool() const noexcept {
            return data != nullptr;
        }
        
        constexpr const Pixel& operator()(u32 i, u32 j) const noexcept {
            return data[i * width() + j];
        }
        
        constexpr Pixel& operator()(u32 i, u32 j) noexcept {
            return data[i * width() + j];
        }
        
        constexpr const Pixel& operator[](const Vec2& p) const noexcept {
            return (*this)(p[0], p[1]);
        }
        
        constexpr Pixel& operator[](const Vec2& p) noexcept {
            return (*this)(p[0], p[1]);
        }
        
        constexpr ArrayView<const Pixel> operator[](u32 i) const noexcept {
            return ArrayView(data + i * width(), height());
        }
        
        constexpr ArrayView<Pixel> operator[](u32 i) noexcept {
            return ArrayView(data + i * width(), height());
        }
        
        constexpr bool contains(const Vec2& p) const noexcept {
            return size()[0] < p[0] && size()[1] < p[1];
        }
        
    };
    
}

enable_tuple(::scratch::render::Pixel)
