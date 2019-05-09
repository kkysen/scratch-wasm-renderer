//
// Created by Khyber on 4/27/2019.
//

#pragma once

#include <cheerp/webgl.h>
#include "src/main/twgl/FrameBufferInfo.h"

#include "src/share/common/numbers.h"
#include "src/main/WebGL/WebGl.h"

namespace twgl {
    
    using namespace gl;
    
    void bindFrameBufferInfo(client::WebGLRenderingContext& gl);
    
    void bindFrameBufferInfo(client::WebGLRenderingContext& gl, FrameBufferInfo& frameBufferInfo, GLenum target = gl::FRAMEBUFFER);
    
}
