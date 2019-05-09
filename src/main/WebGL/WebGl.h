//
// Created by Khyber on 4/27/2019.
//

#pragma once

#include "src/main/WebGL/Canvas.h"

namespace gl {
    
    constexpr GLenum FRAMEBUFFER;
    
    constexpr GLenum COLOR_BUFFER_BIT;
    
    class WebGL {

    public:
        
        Canvas canvas() const;
        
        void viewport(GLint x, GLint y, GLsizei width, GLsizei height);
    
        void clearColor(GLclampf red, GLclampf green, GLclampf blue, GLclampf alpha);
        
        void clear(GLbitfield mask);
        
    };
    
}
