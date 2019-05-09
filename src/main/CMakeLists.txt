files(ScratchWasmRenderer
        main.h
        main.cpp
        ScratchRenderer.h
        ScratchRenderer.cpp
        render/ShaderManager.h
        render/ShaderManager.cpp
        render/utils.h
        render/utils.cpp
        render/Drawable.h
        render/Drawable.cpp
        render/Color.h
        render/Color.cpp
        render/Id.h
        render/Id.cpp
        render/Skin.h
        render/Skin.cpp
        render/effectTransform.h
        render/effectTransform.cpp
        render/IsTouching.h
        render/IsTouching.cpp
        render/Silhouette.h
        render/Silhouette.cpp
        render/shaderEffects.h
        render/shaderEffects.cpp
        render/ir.cpp
        twgl/Twgl.h
        twgl/Twgl.cpp
        twgl/FrameBufferInfo.h
        twgl/FrameBufferInfo.cpp
        WebGL/types.h
        WebGL/WebGL.h
        WebGL/WebGL.cpp
        WebGL/Canvas.h
        WebGL/Canvas.cpp
        )

set(files.share ${files.share.common} ${files.share.stde} ${files.share.lib})

add_executable(ScratchWasmRenderer ${files.ScratchWasmRenderer} ${files.share})
