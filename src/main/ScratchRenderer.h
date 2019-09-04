//
// Created by Khyber on 12/30/2018.
//

#pragma once

#include "src/share/common/numbers.h"
#include "src/main/twgl/Twgl.h"
#include "src/main/render/scratch/ShaderManager.h"
#include "cheerp/client.h"
#include "cheerp/clientlib.h"
#include "cheerp/webgl.h"

namespace scratch {
    
    using namespace gl;
    using namespace twgl;
    
    struct BackgroundColor {
        
        GLclampf red;
        GLclampf green;
        GLclampf blue;
        GLclampf alpha;
        
    };
    
    class ScratchRenderer {
    
    private:
        
        client::WebGLRenderingContext gl;
        
        BackgroundColor backgroundColor;
    
        std::vector<Drawable> drawList;
    
    private:
        
        void doExitDrawRegion();
        
        void runSnapshotCallbacks();
    
    public:
        
        void draw() {
            
            doExitDrawRegion();
            twgl::bindFrameBufferInfo(gl);
            gl.viewport(0, 0, gl.get_canvas()->get_width(), gl.get_canvas()->get_height());
            gl.clearColor(backgroundColor.red, backgroundColor.green, backgroundColor.blue, backgroundColor.alpha);
            gl.clear(gl.get_COLOR_BUFFER_BIT());
            
            drawThese(drawList, ShaderManager::DRAW_MODE::_default, projection);
            runSnapshotCallbacks();
        }
        
    };
    
}
