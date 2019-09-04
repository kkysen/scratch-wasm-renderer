add_compile_options(-fcolor-diagnostics)

set(CXX_LIBS "$ENV{WORKSPACE}/C++")

include(cmake/files.cmake)
include(cmake/llvmVersion.cmake)
include(cmake/llvmImport.cmake)

files(share.common
        share/common/numbers.h
        share/common/debug.h
        share/common/debug.cpp
        share/common/lazy.h
        share/common/math/math.h
        share/common/math/utils.h
        share/common/math/utils.cpp
        share/common/math/Vec.h
        share/common/math/Vec.cpp
        share/common/math/Vec2.h
        share/common/math/Vec2.cpp
        share/common/math/Vec3.h
        share/common/math/Vec3.cpp
        share/common/math/Mat.h
        share/common/math/Mat.cpp
        share/common/math/Mat4.h
        share/common/math/Mat4.cpp
        share/common/math/Rect.h
        share/common/math/Rect.cpp
        share/common/math/NRect.h
        share/common/math/NRect.cpp
        share/common/math/interval.h
        share/common/math/interval.cpp
        share/common/array/Array.h
        share/common/array/ArrayInterface.h
        share/common/array/Array.test.cpp
        share/common/array/is_std_array.h
        share/common/Setter.h
        share/common/Setter.cpp
        )

files(share.stde
        share/stde/contains.h
        share/stde/contains.cpp
        share/stde/c_str.h
        share/stde/c_str.cpp
        share/stde/by.h
        share/stde/by.cpp
        share/stde/get_or_default.h
        share/stde/get_or_default.cpp
        )

files(share.lib
        share/lib/corrade/CorradeArrayView.h
        )

set(CMAKE_CXX_STANDARD 17)

set(CMAKE_C_COMPILER clang)
set(CMAKE_CXX_COMPILER clang++)

add_link_options("-fuse-ld=lld")

set(CMAKE_INTERPROCEDURAL_OPTIMIZATION TRUE)

add_compile_options(-Wall -Werror -Wextra -Wno-error=unused-parameter)

add_definitions(-DCORRADE_ARRAYVIEW_STL_COMPATIBILITY)

include_directories(/opt/cheerp/include/client)

add_subdirectory(main)
add_subdirectory(test)
