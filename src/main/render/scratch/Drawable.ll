; ModuleID = 'Drawable.cpp'
source_filename = "Drawable.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"struct.std::array" = type { [7 x %"class.render::scratch::shader::effects::EffectType"] }
%"class.render::scratch::shader::effects::EffectType" = type { i32, i8, float (float)* }
%"class.std::vector" = type { %"struct.std::_Vector_base" }
%"struct.std::_Vector_base" = type { %"struct.std::_Vector_base<math::Vec2<float>, std::allocator<math::Vec2<float> > >::_Vector_impl" }
%"struct.std::_Vector_base<math::Vec2<float>, std::allocator<math::Vec2<float> > >::_Vector_impl" = type { %"class.math::Vec2"*, %"class.math::Vec2"*, %"class.math::Vec2"* }
%"class.math::Vec2" = type { %"class.math::Vec" }
%"class.math::Vec" = type { %"class.array::ArrayInterface" }
%"class.array::ArrayInterface" = type { %"class.array::Array" }
%"class.array::Array" = type { %"class.array::ArrayInterface.0" }
%"class.array::ArrayInterface.0" = type { %"struct.std::array.1" }
%"struct.std::array.1" = type { [2 x float] }
%"class.render::scratch::Drawable" = type <{ %"class.render::scratch::Id", %"struct.render::scratch::Drawable::Uniforms", %"class.math::Vec2", %"class.math::Vec2", i8, i8, [2 x i8], %"class.math::Mat4", i8, [3 x i8], %"class.math::Vec2", i8, [3 x i8], %"class.std::unique_ptr", %"class.math::Vec2", i8, [3 x i8], %"class.math::Mat4", i8, i8, [2 x i8], %"class.Corrade::Containers::ArrayView.50", i8, [7 x i8] }>
%"class.render::scratch::Id" = type { i32 }
%"struct.render::scratch::Drawable::Uniforms" = type { %"class.math::Mat4", %"class.render::scratch::Color", %"struct.render::scratch::shader::effects::Effects" }
%"class.render::scratch::Color" = type { %union.anon.18 }
%union.anon.18 = type { %struct.anon.19 }
%struct.anon.19 = type { float, float, float, float }
%"struct.render::scratch::shader::effects::Effects" = type { i32, %union.anon.26 }
%union.anon.26 = type { %struct.anon.27 }
%struct.anon.27 = type { float, float, float, float, float, float, float }
%"class.std::unique_ptr" = type { %"class.std::__uniq_ptr_impl" }
%"class.std::__uniq_ptr_impl" = type { %"class.std::tuple" }
%"class.std::tuple" = type { %"struct.std::_Tuple_impl" }
%"struct.std::_Tuple_impl" = type { %"struct.std::_Head_base.30" }
%"struct.std::_Head_base.30" = type { %"class.render::scratch::Skin"* }
%"class.render::scratch::Skin" = type { i32 (...)**, %"class.render::scratch::Id", %"class.math::Vec2", %"struct.render::scratch::Skin::Uniforms", %"class.render::scratch::Silhouette" }
%"struct.render::scratch::Skin::Uniforms" = type { %"class.math::Vec2", %"class.std::unique_ptr.31" }
%"class.std::unique_ptr.31" = type { %"class.std::__uniq_ptr_impl.32" }
%"class.std::__uniq_ptr_impl.32" = type { %"class.std::tuple.33" }
%"class.std::tuple.33" = type { %"struct.std::_Tuple_impl.34" }
%"struct.std::_Tuple_impl.34" = type { %"struct.std::_Head_base.39" }
%"struct.std::_Head_base.39" = type { %"class.render::scratch::JS"* }
%"class.render::scratch::JS" = type { i8 }
%"class.render::scratch::Silhouette" = type { %"class.math::Rect", %"class.math::Vec2", %"class.Corrade::Containers::ArrayView" }
%"class.math::Rect" = type { %union.anon.40, %union.anon.48 }
%union.anon.40 = type { %struct.anon.41 }
%struct.anon.41 = type { i32, i32 }
%union.anon.48 = type { %struct.anon.49 }
%struct.anon.49 = type { i32, i32 }
%"class.Corrade::Containers::ArrayView" = type { i8*, i64 }
%"class.math::Mat4" = type { %"class.math::Mat" }
%"class.math::Mat" = type { %union.anon }
%union.anon = type { %struct.anon }
%struct.anon = type { %"struct.std::array.17", %"struct.std::array.16" }
%"struct.std::array.17" = type { [4 x %"struct.std::array.11"] }
%"struct.std::array.11" = type { [4 x float] }
%"struct.std::array.16" = type { [16 x float] }
%"class.Corrade::Containers::ArrayView.50" = type { %"class.math::Vec2"*, i64 }
%"struct.std::array.53" = type { [5 x %"class.math::Vec2"] }

$_ZNSt6vectorIN4math4Vec2IfEESaIS2_EED2Ev = comdat any

$__clang_call_terminate = comdat any

$_ZN7scratch6render8Drawable18calculateTransformEv = comdat any

$_ZN7scratch6render8Drawable24getTransformedHullPointsEv = comdat any

$_ZNK7scratch6render4Skin4sizeEv = comdat any

$_ZNK7scratch6render4Skin10getTextureEv = comdat any

$_ZN7scratch6render4Skin7disposeEv = comdat any

$_ZNK7scratch6render4Skin8isRasterEv = comdat any

$_ZN7scratch6render4Skin16updateSilhouetteEv = comdat any

$_ZTVN7scratch6render4SkinE = comdat any

$_ZTSN7scratch6render4SkinE = comdat any

$_ZTIN7scratch6render4SkinE = comdat any

$_ZN7scratch6render4Skin4zeroE = comdat any

@_ZN12_GLOBAL__N_13allE = internal constant %"struct.std::array" { [7 x %"class.render::scratch::shader::effects::EffectType"] [%"class.render::scratch::shader::effects::EffectType" { i32 0, i8 0, float (float)* @"_ZN12_GLOBAL__N_13$_08__invokeEf" }, %"class.render::scratch::shader::effects::EffectType" { i32 1, i8 1, float (float)* @"_ZN12_GLOBAL__N_13$_18__invokeEf" }, %"class.render::scratch::shader::effects::EffectType" { i32 2, i8 1, float (float)* @"_ZN12_GLOBAL__N_13$_28__invokeEf" }, %"class.render::scratch::shader::effects::EffectType" { i32 3, i8 1, float (float)* @"_ZN12_GLOBAL__N_13$_38__invokeEf" }, %"class.render::scratch::shader::effects::EffectType" { i32 4, i8 1, float (float)* @"_ZN12_GLOBAL__N_13$_48__invokeEf" }, %"class.render::scratch::shader::effects::EffectType" { i32 5, i8 0, float (float)* @"_ZN12_GLOBAL__N_13$_58__invokeEf" }, %"class.render::scratch::shader::effects::EffectType" { i32 6, i8 0, float (float)* @"_ZN12_GLOBAL__N_13$_68__invokeEf" }] }, align 8
@_ZN7scratch6render6shader7effects5colorE = dso_local local_unnamed_addr constant %"class.render::scratch::shader::effects::EffectType"* getelementptr inbounds (%"struct.std::array", %"struct.std::array"* @_ZN12_GLOBAL__N_13allE, i64 0, i32 0, i64 0), align 8
@_ZN7scratch6render6shader7effects7fisheyeE = dso_local local_unnamed_addr constant %"class.render::scratch::shader::effects::EffectType"* bitcast (i32* getelementptr inbounds (%"struct.std::array", %"struct.std::array"* @_ZN12_GLOBAL__N_13allE, i64 0, i32 0, i64 1, i32 0) to %"class.render::scratch::shader::effects::EffectType"*), align 8
@_ZN7scratch6render6shader7effects5whirlE = dso_local local_unnamed_addr constant %"class.render::scratch::shader::effects::EffectType"* bitcast (i32* getelementptr inbounds (%"struct.std::array", %"struct.std::array"* @_ZN12_GLOBAL__N_13allE, i64 0, i32 0, i64 2, i32 0) to %"class.render::scratch::shader::effects::EffectType"*), align 8
@_ZN7scratch6render6shader7effects8pixelateE = dso_local local_unnamed_addr constant %"class.render::scratch::shader::effects::EffectType"* bitcast (i32* getelementptr inbounds (%"struct.std::array", %"struct.std::array"* @_ZN12_GLOBAL__N_13allE, i64 0, i32 0, i64 3, i32 0) to %"class.render::scratch::shader::effects::EffectType"*), align 8
@_ZN7scratch6render6shader7effects6mosaicE = dso_local local_unnamed_addr constant %"class.render::scratch::shader::effects::EffectType"* bitcast (i32* getelementptr inbounds (%"struct.std::array", %"struct.std::array"* @_ZN12_GLOBAL__N_13allE, i64 0, i32 0, i64 4, i32 0) to %"class.render::scratch::shader::effects::EffectType"*), align 8
@_ZN7scratch6render6shader7effects10brightnessE = dso_local local_unnamed_addr constant %"class.render::scratch::shader::effects::EffectType"* bitcast (i32* getelementptr inbounds (%"struct.std::array", %"struct.std::array"* @_ZN12_GLOBAL__N_13allE, i64 0, i32 0, i64 5, i32 0) to %"class.render::scratch::shader::effects::EffectType"*), align 8
@_ZN7scratch6render6shader7effects5ghostE = dso_local local_unnamed_addr constant %"class.render::scratch::shader::effects::EffectType"* bitcast (i32* getelementptr inbounds (%"struct.std::array", %"struct.std::array"* @_ZN12_GLOBAL__N_13allE, i64 0, i32 0, i64 6, i32 0) to %"class.render::scratch::shader::effects::EffectType"*), align 8
@_ZN7scratch6render8Drawable22_transformedHullPointsE = dso_local global %"class.std::vector" zeroinitializer, align 8
@__dso_handle = external hidden global i8
@.str = private unnamed_addr constant [4 x i8] c"%u\0A\00", align 1
@constinit.1 = private unnamed_addr constant [5 x { { %"struct.std::array.1" } }] [{ { %"struct.std::array.1" } } { { %"struct.std::array.1" } { %"struct.std::array.1" { [2 x float] [float 1.000000e+00, float 2.000000e+00] } } }, { { %"struct.std::array.1" } } { { %"struct.std::array.1" } { %"struct.std::array.1" { [2 x float] [float 5.000000e+00, float 4.000000e+00] } } }, { { %"struct.std::array.1" } } { { %"struct.std::array.1" } { %"struct.std::array.1" { [2 x float] [float 1.000000e+01, float 2.400000e+01] } } }, { { %"struct.std::array.1" } } { { %"struct.std::array.1" } { %"struct.std::array.1" { [2 x float] [float 9.000000e+00, float 3.000000e+00] } } }, { { %"struct.std::array.1" } } { { %"struct.std::array.1" } { %"struct.std::array.1" { [2 x float] [float 3.400000e+01, float 4.300000e+01] } } }], align 4
@.str.3 = private unnamed_addr constant [13 x i8] c"./Drawable.h\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"!!_skin\00", align 1
@__PRETTY_FUNCTION__._ZNK7scratch6render8Drawable4skinEv = private unnamed_addr constant [69 x i8] c"const render::scratch::Skin &render::scratch::Drawable::skin() const\00", align 1
@.str.5 = private unnamed_addr constant [16 x i8] c"vector::reserve\00", align 1
@_ZTVN7scratch6render4SkinE = linkonce_odr dso_local unnamed_addr constant { [7 x i8*] } { [7 x i8*] [i8* null, i8* bitcast ({ i8*, i8* }* @_ZTIN7scratch6render4SkinE to i8*), i8* bitcast (%"class.math::Vec2"* (%"class.render::scratch::Skin"*)* @_ZNK7scratch6render4Skin4sizeEv to i8*), i8* bitcast (void (%"class.std::unique_ptr.31"*, %"class.render::scratch::Skin"*)* @_ZNK7scratch6render4Skin10getTextureEv to i8*), i8* bitcast (void (%"class.render::scratch::Skin"*)* @_ZN7scratch6render4Skin7disposeEv to i8*), i8* bitcast (i1 (%"class.render::scratch::Skin"*)* @_ZNK7scratch6render4Skin8isRasterEv to i8*), i8* bitcast (void (%"class.render::scratch::Skin"*)* @_ZN7scratch6render4Skin16updateSilhouetteEv to i8*)] }, comdat, align 8
@_ZTVN10__cxxabiv117__class_type_infoE = external dso_local global i8*
@_ZTSN7scratch6render4SkinE = linkonce_odr dso_local constant [23 x i8] c"N7scratch6render4SkinE\00", comdat, align 1
@_ZTIN7scratch6render4SkinE = linkonce_odr dso_local constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @_ZTSN7scratch6render4SkinE, i32 0, i32 0) }, comdat, align 8
@_ZN7scratch6render4Skin4zeroE = linkonce_odr dso_local constant { { %"struct.std::array.1" } } zeroinitializer, comdat, align 4
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_Drawable.cpp, i8* null }]

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local void @_ZNSt6vectorIN4math4Vec2IfEESaIS2_EED2Ev(%"class.std::vector"*) unnamed_addr #0 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = getelementptr inbounds %"class.std::vector", %"class.std::vector"* %0, i64 0, i32 0, i32 0, i32 0
  %3 = load %"class.math::Vec2"*, %"class.math::Vec2"** %2, align 8, !tbaa !2
  %4 = icmp eq %"class.math::Vec2"* %3, null
  br i1 %4, label %7, label %5

; <label>:5:                                      ; preds = %1
  %6 = bitcast %"class.math::Vec2"* %3 to i8*
  tail call void @_ZdlPv(i8* %6) #1
  br label %7

; <label>:7:                                      ; preds = %1, %5
  ret void
}

; Function Attrs: nounwind
declare dso_local i32 @__cxa_atexit(void (i8*)*, i8*, i8*) local_unnamed_addr #1

; Function Attrs: norecurse nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %1 = alloca %"class.render::scratch::Drawable", align 8
  %2 = alloca %"struct.std::array.53", align 4
  %3 = bitcast %"class.render::scratch::Drawable"* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 520, i8* nonnull %3) #1
  %4 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 0, i32 0
  store i32 0, i32* %4, align 8
  %5 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 1
  %6 = bitcast %"struct.render::scratch::Drawable::Uniforms"* %5 to <2 x float>*
  store <2 x float> <float 1.000000e+00, float 0.000000e+00>, <2 x float>* %6, align 4
  %7 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i64 0, i32 0, i64 2
  %8 = bitcast float* %7 to <2 x float>*
  store <2 x float> zeroinitializer, <2 x float>* %8, align 4
  %9 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i64 1
  %10 = bitcast %"struct.std::array.11"* %9 to <2 x float>*
  store <2 x float> <float 0.000000e+00, float 1.000000e+00>, <2 x float>* %10, align 4
  %11 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i64 1, i32 0, i64 2
  %12 = bitcast float* %11 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 %12, i8 0, i64 16, i1 false) #1
  %13 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i64 2, i32 0, i64 2
  %14 = bitcast float* %13 to <2 x float>*
  store <2 x float> <float 1.000000e+00, float 0.000000e+00>, <2 x float>* %14, align 4
  %15 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i64 3
  %16 = bitcast %"struct.std::array.11"* %15 to <2 x float>*
  store <2 x float> zeroinitializer, <2 x float>* %16, align 4
  %17 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i64 3, i32 0, i64 2
  %18 = bitcast float* %17 to <2 x float>*
  store <2 x float> <float 0.000000e+00, float 1.000000e+00>, <2 x float>* %18, align 4
  %19 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 1, i32 1, i32 0, i32 0
  %20 = bitcast %struct.anon.19* %19 to <2 x float>*
  store <2 x float> <float 0x3F70101020000000, float 0.000000e+00>, <2 x float>* %20, align 4
  %21 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 1, i32 1, i32 0, i32 0, i32 2
  %22 = bitcast float* %21 to <2 x float>*
  store <2 x float> <float 0.000000e+00, float 1.000000e+00>, <2 x float>* %22, align 4
  %23 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 1, i32 2, i32 0
  %24 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 1, i32 2, i32 1, i32 0, i32 0
  %25 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 1, i32 2, i32 1, i32 0, i32 1
  %26 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 1, i32 2, i32 1, i32 0, i32 2
  %27 = bitcast float* %26 to <4 x float>*
  store <4 x float> <float -0.000000e+00, float 0.000000e+00, float 1.000000e+00, float 0.000000e+00>, <4 x float>* %27, align 4
  %28 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 1, i32 2, i32 1, i32 0, i32 6
  %29 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 3
  %30 = bitcast %"class.math::Vec2"* %29 to i64*
  store i64 4806466703430254592, i64* %30, align 4
  %31 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 4
  %32 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 5
  %33 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 7
  %34 = bitcast %"class.math::Mat4"* %33 to <2 x float>*
  store <2 x float> <float 1.000000e+00, float 0.000000e+00>, <2 x float>* %34, align 8
  %35 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 7, i32 0, i32 0, i32 0, i32 0, i32 0, i64 0, i32 0, i64 2
  %36 = bitcast float* %35 to <2 x float>*
  store <2 x float> zeroinitializer, <2 x float>* %36, align 8
  %37 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 7, i32 0, i32 0, i32 0, i32 0, i32 0, i64 1
  %38 = bitcast %"struct.std::array.11"* %37 to <2 x float>*
  store <2 x float> <float 0.000000e+00, float 1.000000e+00>, <2 x float>* %38, align 8
  %39 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 7, i32 0, i32 0, i32 0, i32 0, i32 0, i64 1, i32 0, i64 2
  %40 = bitcast float* %39 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 %40, i8 0, i64 16, i1 false) #1
  %41 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 7, i32 0, i32 0, i32 0, i32 0, i32 0, i64 2, i32 0, i64 2
  %42 = bitcast float* %41 to <2 x float>*
  store <2 x float> <float 1.000000e+00, float 0.000000e+00>, <2 x float>* %42, align 8
  %43 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 7, i32 0, i32 0, i32 0, i32 0, i32 0, i64 3
  %44 = bitcast %"struct.std::array.11"* %43 to <2 x float>*
  store <2 x float> zeroinitializer, <2 x float>* %44, align 8
  %45 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 7, i32 0, i32 0, i32 0, i32 0, i32 0, i64 3, i32 0, i64 2
  %46 = bitcast float* %45 to <2 x float>*
  store <2 x float> <float 0.000000e+00, float 1.000000e+00>, <2 x float>* %46, align 8
  %47 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 8
  %48 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 10, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %49 = bitcast [2 x float]* %48 to <2 x float>*
  store <2 x float> zeroinitializer, <2 x float>* %49, align 4
  %50 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 11
  %51 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 13, i32 0, i32 0, i32 0, i32 0, i32 0
  %52 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 15
  %53 = bitcast %"class.render::scratch::Skin"** %51 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 %53, i8 0, i64 16, i1 false) #1
  %54 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 17
  %55 = bitcast %"class.math::Mat4"* %54 to <2 x float>*
  store <2 x float> <float 1.000000e+00, float 0.000000e+00>, <2 x float>* %55, align 4
  %56 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 17, i32 0, i32 0, i32 0, i32 0, i32 0, i64 0, i32 0, i64 2
  %57 = bitcast float* %56 to <2 x float>*
  store <2 x float> zeroinitializer, <2 x float>* %57, align 4
  %58 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 17, i32 0, i32 0, i32 0, i32 0, i32 0, i64 1
  %59 = bitcast %"struct.std::array.11"* %58 to <2 x float>*
  store <2 x float> <float 0.000000e+00, float 1.000000e+00>, <2 x float>* %59, align 4
  %60 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 17, i32 0, i32 0, i32 0, i32 0, i32 0, i64 1, i32 0, i64 2
  %61 = bitcast float* %60 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 %61, i8 0, i64 16, i1 false) #1
  %62 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 17, i32 0, i32 0, i32 0, i32 0, i32 0, i64 2, i32 0, i64 2
  %63 = bitcast float* %62 to <2 x float>*
  store <2 x float> <float 1.000000e+00, float 0.000000e+00>, <2 x float>* %63, align 4
  %64 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 17, i32 0, i32 0, i32 0, i32 0, i32 0, i64 3
  %65 = bitcast %"struct.std::array.11"* %64 to <2 x float>*
  store <2 x float> zeroinitializer, <2 x float>* %65, align 4
  %66 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 17, i32 0, i32 0, i32 0, i32 0, i32 0, i64 3, i32 0, i64 2
  %67 = bitcast float* %66 to <2 x float>*
  store <2 x float> <float 0.000000e+00, float 1.000000e+00>, <2 x float>* %67, align 4
  %68 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 18
  %69 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 19
  store i8 1, i8* %69, align 1, !tbaa !8
  %70 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 22
  %71 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 0)
  store i8 5, i8* %31, align 4, !tbaa !23
  store i8 1, i8* %47, align 8, !tbaa !24
  %72 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 2
  %73 = bitcast %"class.math::Vec2"* %72 to <2 x float>*
  store <2 x float> <float 1.000000e+02, float 2.000000e+02>, <2 x float>* %73, align 4
  store i8 1, i8* %50, align 4, !tbaa !25
  store i8 1, i8* %52, align 8, !tbaa !26
  store i8 1, i8* %32, align 1, !tbaa !27
  store i8 1, i8* %68, align 4, !tbaa !28
  store float 0x3FA99999A0000000, float* %24, align 4, !tbaa !29
  store float 0x3FF3333340000000, float* %25, align 4, !tbaa !29
  store i32 67, i32* %23, align 4, !tbaa !31
  store float 7.500000e-01, float* %28, align 4, !tbaa !29
  %74 = bitcast %"struct.std::array.53"* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %74) #1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 %74, i8* align 4 bitcast ([5 x { { %"struct.std::array.1" } }]* @constinit.1 to i8*), i64 40, i1 false), !tbaa.struct !32
  %75 = getelementptr inbounds %"struct.std::array.53", %"struct.std::array.53"* %2, i64 0, i32 0, i64 0
  %76 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 21, i32 0
  store %"class.math::Vec2"* %75, %"class.math::Vec2"** %76, align 8
  %77 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %1, i64 0, i32 21, i32 1
  store i64 5, i64* %77, align 8
  store i8 0, i8* %70, align 8, !tbaa !34
  call void @_ZN7scratch6render8Drawable18calculateTransformEv(%"class.render::scratch::Drawable"* nonnull %1) #1
  %78 = call dereferenceable(24) %"class.std::vector"* @_ZN7scratch6render8Drawable24getTransformedHullPointsEv(%"class.render::scratch::Drawable"* nonnull %1) #1
  %79 = getelementptr inbounds %"class.std::vector", %"class.std::vector"* %78, i64 0, i32 0, i32 0, i32 0
  %80 = load %"class.math::Vec2"*, %"class.math::Vec2"** %79, align 8, !tbaa !2
  %81 = getelementptr inbounds %"class.std::vector", %"class.std::vector"* %78, i64 0, i32 0, i32 0, i32 1
  %82 = bitcast %"class.math::Vec2"** %81 to i64*
  %83 = load i64, i64* %82, align 8, !tbaa !35
  %84 = ptrtoint %"class.math::Vec2"* %80 to i64
  %85 = sub i64 %83, %84
  %86 = ashr exact i64 %85, 3
  %87 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %80, i64 %86
  %88 = icmp eq i64 %85, 0
  br i1 %88, label %145, label %89

; <label>:89:                                     ; preds = %0
  %90 = add i64 %85, -8
  %91 = and i64 %90, 8
  %92 = icmp eq i64 %91, 0
  br i1 %92, label %93, label %107

; <label>:93:                                     ; preds = %89
  %94 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %80, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i64 0
  %95 = load float, float* %94, align 4
  %96 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %80, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i64 1
  %97 = load float, float* %96, align 4
  %98 = fcmp olt float %95, 0.000000e+00
  %99 = insertelement <2 x float> <float undef, float 0.000000e+00>, float %95, i32 0
  %100 = select i1 %98, <2 x float> %99, <2 x float> zeroinitializer
  %101 = select i1 %98, float %95, float 0.000000e+00
  %102 = fcmp olt float %97, 0.000000e+00
  %103 = insertelement <2 x float> %100, float %97, i32 1
  %104 = select i1 %102, <2 x float> %103, <2 x float> %100
  %105 = select i1 %102, float %97, float 0.000000e+00
  %106 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %80, i64 1
  br label %107

; <label>:107:                                    ; preds = %93, %89
  %108 = phi <2 x float> [ undef, %89 ], [ %104, %93 ]
  %109 = phi <2 x float> [ zeroinitializer, %89 ], [ %104, %93 ]
  %110 = phi float [ 0.000000e+00, %89 ], [ %105, %93 ]
  %111 = phi float [ 0.000000e+00, %89 ], [ %101, %93 ]
  %112 = phi %"class.math::Vec2"* [ %80, %89 ], [ %106, %93 ]
  %113 = icmp ult i64 %90, 8
  br i1 %113, label %145, label %114

; <label>:114:                                    ; preds = %107, %114
  %115 = phi <2 x float> [ %141, %114 ], [ %109, %107 ]
  %116 = phi float [ %142, %114 ], [ %110, %107 ]
  %117 = phi float [ %138, %114 ], [ %111, %107 ]
  %118 = phi %"class.math::Vec2"* [ %143, %114 ], [ %112, %107 ]
  %119 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %118, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i64 0
  %120 = load float, float* %119, align 4
  %121 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %118, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i64 1
  %122 = load float, float* %121, align 4
  %123 = fcmp olt float %120, %117
  %124 = insertelement <2 x float> %115, float %120, i32 0
  %125 = select i1 %123, <2 x float> %124, <2 x float> %115
  %126 = select i1 %123, float %120, float %117
  %127 = fcmp olt float %122, %116
  %128 = insertelement <2 x float> %125, float %122, i32 1
  %129 = select i1 %127, <2 x float> %128, <2 x float> %125
  %130 = select i1 %127, float %122, float %116
  %131 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %118, i64 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i64 0
  %132 = load float, float* %131, align 4
  %133 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %118, i64 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i64 1
  %134 = load float, float* %133, align 4
  %135 = fcmp olt float %132, %126
  %136 = insertelement <2 x float> %129, float %132, i32 0
  %137 = select i1 %135, <2 x float> %136, <2 x float> %129
  %138 = select i1 %135, float %132, float %126
  %139 = fcmp olt float %134, %130
  %140 = insertelement <2 x float> %137, float %134, i32 1
  %141 = select i1 %139, <2 x float> %140, <2 x float> %137
  %142 = select i1 %139, float %134, float %130
  %143 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %118, i64 2
  %144 = icmp eq %"class.math::Vec2"* %143, %87
  br i1 %144, label %145, label %114

; <label>:145:                                    ; preds = %107, %114, %0
  %146 = phi <2 x float> [ zeroinitializer, %0 ], [ %108, %107 ], [ %141, %114 ]
  %147 = extractelement <2 x float> %146, i32 0
  %148 = fptosi float %147 to i32
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %74) #1
  %149 = load %"class.render::scratch::Skin"*, %"class.render::scratch::Skin"** %51, align 8, !tbaa !36
  %150 = icmp eq %"class.render::scratch::Skin"* %149, null
  br i1 %150, label %160, label %151

; <label>:151:                                    ; preds = %145
  %152 = getelementptr inbounds %"class.render::scratch::Skin", %"class.render::scratch::Skin"* %149, i64 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN7scratch6render4SkinE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %152, align 8, !tbaa !37
  %153 = getelementptr inbounds %"class.render::scratch::Skin", %"class.render::scratch::Skin"* %149, i64 0, i32 3, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0
  %154 = load %"class.render::scratch::JS"*, %"class.render::scratch::JS"** %153, align 8, !tbaa !36
  %155 = icmp eq %"class.render::scratch::JS"* %154, null
  br i1 %155, label %158, label %156

; <label>:156:                                    ; preds = %151
  %157 = getelementptr inbounds %"class.render::scratch::JS", %"class.render::scratch::JS"* %154, i64 0, i32 0
  call void @_ZdlPv(i8* %157) #16
  br label %158

; <label>:158:                                    ; preds = %156, %151
  %159 = bitcast %"class.render::scratch::Skin"* %149 to i8*
  call void @_ZdlPv(i8* %159) #16
  br label %160

; <label>:160:                                    ; preds = %145, %158
  call void @llvm.lifetime.end.p0i8(i64 520, i8* nonnull %3) #1
  ret i32 %148
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #3

; Function Attrs: nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #4

declare dso_local i32 @__gxx_personality_v0(...)

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #3

; Function Attrs: inlinehint nounwind uwtable
define internal float @"_ZN12_GLOBAL__N_13$_08__invokeEf"(float) #5 align 2 {
  %2 = fdiv float %0, 2.000000e+02
  %3 = fpext float %2 to double
  %4 = tail call double @fmod(double %3, double 1.000000e+00) #1
  %5 = fptrunc double %4 to float
  ret float %5
}

; Function Attrs: inlinehint norecurse nounwind readnone uwtable
define internal float @"_ZN12_GLOBAL__N_13$_18__invokeEf"(float) #6 align 2 {
  %2 = fadd float %0, 1.000000e+02
  %3 = fdiv float %2, 1.000000e+02
  %4 = fcmp olt float %3, 0.000000e+00
  %5 = select i1 %4, float 0.000000e+00, float %3
  ret float %5
}

; Function Attrs: inlinehint norecurse nounwind readnone uwtable
define internal float @"_ZN12_GLOBAL__N_13$_28__invokeEf"(float) #6 align 2 {
  %2 = fsub float -0.000000e+00, %0
  %3 = fpext float %2 to double
  %4 = fmul double %3, 0x400921FB54442D18
  %5 = fdiv double %4, 1.800000e+02
  %6 = fptrunc double %5 to float
  ret float %6
}

; Function Attrs: inlinehint norecurse nounwind readnone uwtable
define internal float @"_ZN12_GLOBAL__N_13$_38__invokeEf"(float) #6 align 2 {
  %2 = fcmp olt float %0, 0.000000e+00
  %3 = fsub float -0.000000e+00, %0
  %4 = select i1 %2, float %3, float %0
  %5 = fdiv float %4, 1.000000e+01
  ret float %5
}

; Function Attrs: inlinehint nounwind readnone uwtable
define internal float @"_ZN12_GLOBAL__N_13$_48__invokeEf"(float) #7 align 2 personality i32 (...)* @__gxx_personality_v0 {
  %2 = fcmp olt float %0, 0.000000e+00
  %3 = fsub float -0.000000e+00, %0
  %4 = select i1 %2, float %3, float %0
  %5 = fadd float %4, 1.000000e+01
  %6 = fdiv float %5, 1.000000e+01
  %7 = tail call float @llvm.round.f32(float %6) #1
  %8 = fcmp olt float %7, 1.000000e+00
  %9 = fcmp ogt float %7, 5.120000e+02
  %10 = select i1 %9, float 5.120000e+02, float %7
  %11 = select i1 %8, float 1.000000e+00, float %10
  ret float %11
}

; Function Attrs: inlinehint norecurse nounwind readnone uwtable
define internal float @"_ZN12_GLOBAL__N_13$_58__invokeEf"(float) #6 align 2 personality i32 (...)* @__gxx_personality_v0 {
  %2 = fcmp olt float %0, -1.000000e+02
  %3 = fcmp ogt float %0, 1.000000e+02
  %4 = select i1 %3, float 1.000000e+02, float %0
  %5 = fdiv float %4, 1.000000e+02
  %6 = select i1 %2, float -1.000000e+00, float %5
  ret float %6
}

; Function Attrs: inlinehint norecurse nounwind readnone uwtable
define internal float @"_ZN12_GLOBAL__N_13$_68__invokeEf"(float) #6 align 2 personality i32 (...)* @__gxx_personality_v0 {
  %2 = fcmp olt float %0, 0.000000e+00
  %3 = fcmp ogt float %0, 1.000000e+02
  %4 = select i1 %3, float 1.000000e+02, float %0
  %5 = fdiv float %4, 1.000000e+02
  %6 = fsub float 1.000000e+00, %5
  %7 = select i1 %2, float 1.000000e+00, float %6
  ret float %7
}

; Function Attrs: nounwind
declare dso_local double @fmod(double, double) local_unnamed_addr #4

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8*) local_unnamed_addr #8 comdat {
  %2 = tail call i8* @__cxa_begin_catch(i8* %0) #1
  tail call void @_ZSt9terminatev() #17
  unreachable
}

declare dso_local i8* @__cxa_begin_catch(i8*) local_unnamed_addr

declare dso_local void @_ZSt9terminatev() local_unnamed_addr

; Function Attrs: nounwind readnone speculatable
declare float @llvm.round.f32(float) #9

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1) #3

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local void @_ZN7scratch6render8Drawable18calculateTransformEv(%"class.render::scratch::Drawable"*) local_unnamed_addr #10 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
  %2 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 5
  %3 = load i8, i8* %2, align 1, !tbaa !27, !range !39
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %144, label %5

; <label>:5:                                      ; preds = %1
  %6 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 8
  %7 = load i8, i8* %6, align 8, !tbaa !24, !range !39
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %24, label %9

; <label>:9:                                      ; preds = %5
  %10 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 4
  %11 = load i8, i8* %10, align 4, !tbaa !23
  %12 = zext i8 %11 to i32
  %13 = sub nsw i32 6, %12
  %14 = sitofp i32 %13 to double
  %15 = fmul double %14, 0x3FE921FB54442D18
  %16 = fptrunc double %15 to float
  %17 = tail call float @cosf(float %16) #1
  %18 = tail call float @sinf(float %16) #1
  %19 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 7, i32 0, i32 0, i32 0, i32 0, i32 0, i64 0, i32 0, i64 0
  store float %17, float* %19, align 4, !tbaa !29
  %20 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 7, i32 0, i32 0, i32 0, i32 0, i32 0, i64 0, i32 0, i64 1
  store float %18, float* %20, align 4, !tbaa !29
  %21 = fsub float -0.000000e+00, %18
  %22 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 7, i32 0, i32 0, i32 0, i32 0, i32 0, i64 1, i32 0, i64 0
  store float %21, float* %22, align 4, !tbaa !29
  %23 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 7, i32 0, i32 0, i32 0, i32 0, i32 0, i64 1, i32 0, i64 1
  store float %17, float* %23, align 4, !tbaa !29
  store i8 0, i8* %6, align 8, !tbaa !24
  br label %24

; <label>:24:                                     ; preds = %5, %9
  %25 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 11
  %26 = load i8, i8* %25, align 4, !tbaa !25, !range !39
  %27 = icmp eq i8 %26, 0
  br i1 %27, label %64, label %28

; <label>:28:                                     ; preds = %24
  %29 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 13, i32 0, i32 0, i32 0, i32 0, i32 0
  %30 = load %"class.render::scratch::Skin"*, %"class.render::scratch::Skin"** %29, align 8, !tbaa !36
  %31 = icmp eq %"class.render::scratch::Skin"* %30, null
  br i1 %31, label %64, label %32

; <label>:32:                                     ; preds = %28
  %33 = getelementptr inbounds %"class.render::scratch::Skin", %"class.render::scratch::Skin"* %30, i64 0, i32 2, i32 0
  %34 = bitcast %"class.render::scratch::Skin"* %30 to %"class.math::Vec2"* (%"class.render::scratch::Skin"*)***
  %35 = load %"class.math::Vec2"* (%"class.render::scratch::Skin"*)**, %"class.math::Vec2"* (%"class.render::scratch::Skin"*)*** %34, align 8, !tbaa !37
  %36 = load %"class.math::Vec2"* (%"class.render::scratch::Skin"*)*, %"class.math::Vec2"* (%"class.render::scratch::Skin"*)** %35, align 8
  %37 = tail call dereferenceable(8) %"class.math::Vec2"* %36(%"class.render::scratch::Skin"* nonnull %30) #1
  %38 = bitcast %"class.math::Vec2"* %37 to <2 x float>*
  %39 = load <2 x float>, <2 x float>* %38, align 4, !tbaa !29
  %40 = fmul <2 x float> %39, <float 5.000000e-01, float 5.000000e-01>
  %41 = bitcast %"class.math::Vec"* %33 to i64*
  %42 = load i64, i64* %41, align 4
  %43 = lshr i64 %42, 32
  %44 = insertelement <2 x i64> undef, i64 %42, i32 0
  %45 = insertelement <2 x i64> %44, i64 %43, i32 1
  %46 = trunc <2 x i64> %45 to <2 x i32>
  %47 = bitcast <2 x i32> %46 to <2 x float>
  %48 = fsub <2 x float> %47, %40
  %49 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 3, i32 0
  %50 = bitcast %"class.math::Vec"* %49 to i64*
  %51 = load i64, i64* %50, align 4
  %52 = lshr i64 %51, 32
  %53 = insertelement <2 x i64> undef, i64 %51, i32 0
  %54 = insertelement <2 x i64> %53, i64 %52, i32 1
  %55 = trunc <2 x i64> %54 to <2 x i32>
  %56 = bitcast <2 x i32> %55 to <2 x float>
  %57 = fmul <2 x float> %48, %56
  %58 = fdiv <2 x float> %57, <float 1.000000e+02, float 1.000000e+02>
  %59 = extractelement <2 x float> %58, i32 1
  %60 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 10
  %61 = bitcast %"class.math::Vec2"* %60 to <2 x float>*
  store <2 x float> %58, <2 x float>* %61, align 4
  %62 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 10, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i64 1
  %63 = fsub float -0.000000e+00, %59
  store float %63, float* %62, align 4, !tbaa !29
  store i8 0, i8* %25, align 4, !tbaa !25
  br label %64

; <label>:64:                                     ; preds = %24, %28, %32
  %65 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 15
  %66 = load i8, i8* %65, align 8, !tbaa !26, !range !39
  %67 = icmp eq i8 %66, 0
  br i1 %67, label %96, label %68

; <label>:68:                                     ; preds = %64
  %69 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 13, i32 0, i32 0, i32 0, i32 0, i32 0
  %70 = load %"class.render::scratch::Skin"*, %"class.render::scratch::Skin"** %69, align 8, !tbaa !36
  %71 = icmp eq %"class.render::scratch::Skin"* %70, null
  br i1 %71, label %96, label %72

; <label>:72:                                     ; preds = %68
  %73 = bitcast %"class.render::scratch::Skin"* %70 to %"class.math::Vec2"* (%"class.render::scratch::Skin"*)***
  %74 = load %"class.math::Vec2"* (%"class.render::scratch::Skin"*)**, %"class.math::Vec2"* (%"class.render::scratch::Skin"*)*** %73, align 8, !tbaa !37
  %75 = load %"class.math::Vec2"* (%"class.render::scratch::Skin"*)*, %"class.math::Vec2"* (%"class.render::scratch::Skin"*)** %74, align 8
  %76 = tail call dereferenceable(8) %"class.math::Vec2"* %75(%"class.render::scratch::Skin"* nonnull %70) #1
  %77 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 3, i32 0
  %78 = bitcast %"class.math::Vec2"* %76 to i64*
  %79 = load i64, i64* %78, align 4
  %80 = bitcast %"class.math::Vec"* %77 to i64*
  %81 = load i64, i64* %80, align 4
  %82 = lshr i64 %79, 32
  %83 = insertelement <2 x i64> undef, i64 %79, i32 0
  %84 = insertelement <2 x i64> %83, i64 %82, i32 1
  %85 = trunc <2 x i64> %84 to <2 x i32>
  %86 = lshr i64 %81, 32
  %87 = insertelement <2 x i64> undef, i64 %81, i32 0
  %88 = insertelement <2 x i64> %87, i64 %86, i32 1
  %89 = trunc <2 x i64> %88 to <2 x i32>
  %90 = bitcast <2 x i32> %85 to <2 x float>
  %91 = bitcast <2 x i32> %89 to <2 x float>
  %92 = fmul <2 x float> %90, %91
  %93 = fdiv <2 x float> %92, <float 1.000000e+02, float 1.000000e+02>
  %94 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 14
  %95 = bitcast %"class.math::Vec2"* %94 to <2 x float>*
  store <2 x float> %93, <2 x float>* %95, align 8
  store i8 0, i8* %65, align 8, !tbaa !26
  br label %96

; <label>:96:                                     ; preds = %64, %68, %72
  %97 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 7, i32 0, i32 0, i32 0, i32 0, i32 0, i64 0, i32 0, i64 0
  %98 = load float, float* %97, align 4, !noalias !40
  %99 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 7, i32 0, i32 0, i32 0, i32 0, i32 0, i64 0, i32 0, i64 1
  %100 = load float, float* %99, align 4, !noalias !40
  %101 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 7, i32 0, i32 0, i32 0, i32 0, i32 0, i64 1, i32 0, i64 0
  %102 = load float, float* %101, align 4, !noalias !40
  %103 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 7, i32 0, i32 0, i32 0, i32 0, i32 0, i64 1, i32 0, i64 1
  %104 = load float, float* %103, align 4, !noalias !40
  %105 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 14, i32 0
  %106 = bitcast %"class.math::Vec"* %105 to i64*
  %107 = load i64, i64* %106, align 4
  %108 = trunc i64 %107 to i32
  %109 = lshr i64 %107, 32
  %110 = trunc i64 %109 to i32
  %111 = bitcast i32 %108 to float
  %112 = fmul float %98, %111
  %113 = fmul float %100, %111
  %114 = bitcast i32 %110 to float
  %115 = fmul float %102, %114
  %116 = fmul float %104, %114
  %117 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i64 0, i32 0, i64 0
  store float %112, float* %117, align 4, !tbaa !29
  %118 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i64 0, i32 0, i64 1
  store float %113, float* %118, align 4, !tbaa !29
  %119 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i64 1, i32 0, i64 0
  store float %115, float* %119, align 4, !tbaa !29
  %120 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i64 1, i32 0, i64 1
  store float %116, float* %120, align 4, !tbaa !29
  %121 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 10, i32 0
  %122 = bitcast %"class.math::Vec"* %121 to <2 x float>*
  %123 = load <2 x float>, <2 x float>* %122, align 4
  %124 = extractelement <2 x float> %123, i32 0
  %125 = fmul float %98, %124
  %126 = extractelement <2 x float> %123, i32 1
  %127 = fmul float %100, %126
  %128 = fmul float %102, %124
  %129 = fmul float %104, %126
  %130 = fadd float %125, %128
  %131 = fadd float %127, %129
  %132 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 2, i32 0
  %133 = bitcast %"class.math::Vec"* %132 to i64*
  %134 = load i64, i64* %133, align 4
  %135 = trunc i64 %134 to i32
  %136 = lshr i64 %134, 32
  %137 = trunc i64 %136 to i32
  %138 = bitcast i32 %135 to float
  %139 = fadd float %130, %138
  %140 = bitcast i32 %137 to float
  %141 = fadd float %131, %140
  %142 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i64 3, i32 0, i64 0
  store float %139, float* %142, align 4, !tbaa !29
  %143 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i64 3, i32 0, i64 1
  store float %141, float* %143, align 4, !tbaa !29
  store i8 0, i8* %2, align 1, !tbaa !27
  br label %144

; <label>:144:                                    ; preds = %1, %96
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local dereferenceable(24) %"class.std::vector"* @_ZN7scratch6render8Drawable24getTransformedHullPointsEv(%"class.render::scratch::Drawable"*) local_unnamed_addr #10 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 13, i32 0, i32 0, i32 0, i32 0, i32 0
  %3 = load %"class.render::scratch::Skin"*, %"class.render::scratch::Skin"** %2, align 8, !tbaa !36
  %4 = icmp eq %"class.render::scratch::Skin"* %3, null
  br i1 %4, label %5, label %6

; <label>:5:                                      ; preds = %1
  tail call void @__assert_fail(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.3, i64 0, i64 0), i32 82, i8* getelementptr inbounds ([69 x i8], [69 x i8]* @__PRETTY_FUNCTION__._ZNK7scratch6render8Drawable4skinEv, i64 0, i64 0)) #17
  unreachable

; <label>:6:                                      ; preds = %1
  %7 = bitcast %"class.render::scratch::Skin"* %3 to %"class.math::Vec2"* (%"class.render::scratch::Skin"*)***
  %8 = load %"class.math::Vec2"* (%"class.render::scratch::Skin"*)**, %"class.math::Vec2"* (%"class.render::scratch::Skin"*)*** %7, align 8, !tbaa !37
  %9 = load %"class.math::Vec2"* (%"class.render::scratch::Skin"*)*, %"class.math::Vec2"* (%"class.render::scratch::Skin"*)** %8, align 8
  %10 = tail call dereferenceable(8) %"class.math::Vec2"* %9(%"class.render::scratch::Skin"* nonnull %3) #1
  %11 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %10, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i64 0
  %12 = load float, float* %11, align 4
  %13 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %10, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i64 1
  %14 = load float, float* %13, align 4
  %15 = fdiv float 1.000000e+00, %12
  %16 = fdiv float 1.000000e+00, %14
  %17 = fmul float %15, 5.000000e-01
  %18 = fmul float %16, 5.000000e-01
  %19 = fsub float 5.000000e-01, %17
  %20 = fadd float %18, -5.000000e-01
  %21 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i64 0, i32 0, i64 0
  %22 = load float, float* %21, align 4, !noalias !43
  %23 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i64 0, i32 0, i64 1
  %24 = load float, float* %23, align 4, !noalias !43
  %25 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i64 0, i32 0, i64 2
  %26 = load float, float* %25, align 4, !noalias !43
  %27 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i64 0, i32 0, i64 3
  %28 = load float, float* %27, align 4, !noalias !43
  %29 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i64 1, i32 0, i64 0
  %30 = load float, float* %29, align 4, !noalias !43
  %31 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i64 1, i32 0, i64 1
  %32 = load float, float* %31, align 4, !noalias !43
  %33 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i64 1, i32 0, i64 2
  %34 = load float, float* %33, align 4, !noalias !43
  %35 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i64 1, i32 0, i64 3
  %36 = load float, float* %35, align 4, !noalias !43
  %37 = insertelement <2 x float> undef, float %24, i32 0
  %38 = insertelement <2 x float> %37, float %32, i32 1
  %39 = fmul <2 x float> %38, zeroinitializer
  %40 = insertelement <2 x float> undef, float %26, i32 0
  %41 = insertelement <2 x float> %40, float %34, i32 1
  %42 = fmul <2 x float> %41, zeroinitializer
  %43 = insertelement <2 x float> undef, float %28, i32 0
  %44 = insertelement <2 x float> %43, float %36, i32 1
  %45 = fmul <2 x float> %44, zeroinitializer
  %46 = insertelement <2 x float> undef, float %22, i32 0
  %47 = insertelement <2 x float> %46, float %30, i32 1
  %48 = fadd <2 x float> %47, %39
  %49 = fadd <2 x float> %48, %42
  %50 = fadd <2 x float> %49, %45
  %51 = fmul <2 x float> %47, zeroinitializer
  %52 = fadd <2 x float> %51, %38
  %53 = fadd <2 x float> %52, %42
  %54 = fadd <2 x float> %53, %45
  %55 = load i64, i64* bitcast (%"class.std::vector"* @_ZN7scratch6render8Drawable22_transformedHullPointsE to i64*), align 8, !tbaa !2
  store i64 %55, i64* bitcast (%"class.math::Vec2"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN7scratch6render8Drawable22_transformedHullPointsE, i64 0, i32 0, i32 0, i32 1) to i64*), align 8, !tbaa !35
  %56 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 21, i32 1
  %57 = load i64, i64* %56, align 8, !tbaa !46
  %58 = icmp ugt i64 %57, 2305843009213693951
  br i1 %58, label %59, label %61

; <label>:59:                                     ; preds = %6
  invoke void @_ZSt20__throw_length_errorPKc(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.5, i64 0, i64 0)) #18
          to label %60 unwind label %91

; <label>:60:                                     ; preds = %59
  unreachable

; <label>:61:                                     ; preds = %6
  %62 = inttoptr i64 %55 to %"class.math::Vec2"*
  %63 = load i64, i64* bitcast (%"class.math::Vec2"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN7scratch6render8Drawable22_transformedHullPointsE, i64 0, i32 0, i32 0, i32 2) to i64*), align 8, !tbaa !47
  %64 = sub i64 %63, %55
  %65 = ashr exact i64 %64, 3
  %66 = icmp ult i64 %65, %57
  %67 = inttoptr i64 %63 to %"class.math::Vec2"*
  br i1 %66, label %68, label %81

; <label>:68:                                     ; preds = %61
  %69 = shl i64 %57, 3
  %70 = invoke i8* @_Znwm(i64 %69)
          to label %71 unwind label %91

; <label>:71:                                     ; preds = %68
  %72 = bitcast i8* %70 to %"class.math::Vec2"*
  %73 = load %"class.math::Vec2"*, %"class.math::Vec2"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN7scratch6render8Drawable22_transformedHullPointsE, i64 0, i32 0, i32 0, i32 0), align 8, !tbaa !2
  %74 = icmp eq %"class.math::Vec2"* %73, null
  br i1 %74, label %77, label %75

; <label>:75:                                     ; preds = %71
  %76 = bitcast %"class.math::Vec2"* %73 to i8*
  tail call void @_ZdlPv(i8* %76) #1
  br label %77

; <label>:77:                                     ; preds = %75, %71
  store i8* %70, i8** bitcast (%"class.std::vector"* @_ZN7scratch6render8Drawable22_transformedHullPointsE to i8**), align 8, !tbaa !2
  store i8* %70, i8** bitcast (%"class.math::Vec2"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN7scratch6render8Drawable22_transformedHullPointsE, i64 0, i32 0, i32 0, i32 1) to i8**), align 8, !tbaa !35
  %78 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %72, i64 %57
  store %"class.math::Vec2"* %78, %"class.math::Vec2"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN7scratch6render8Drawable22_transformedHullPointsE, i64 0, i32 0, i32 0, i32 2), align 8, !tbaa !47
  %79 = load i64, i64* %56, align 8, !tbaa !46
  %80 = ptrtoint i8* %70 to i64
  br label %81

; <label>:81:                                     ; preds = %77, %61
  %82 = phi i64 [ %80, %77 ], [ %55, %61 ]
  %83 = phi %"class.math::Vec2"* [ %78, %77 ], [ %67, %61 ]
  %84 = phi %"class.math::Vec2"* [ %72, %77 ], [ %62, %61 ]
  %85 = phi i64 [ %79, %77 ], [ %57, %61 ]
  %86 = getelementptr inbounds %"class.render::scratch::Drawable", %"class.render::scratch::Drawable"* %0, i64 0, i32 21, i32 0
  %87 = load %"class.math::Vec2"*, %"class.math::Vec2"** %86, align 8, !tbaa !48
  %88 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %87, i64 %85
  %89 = icmp eq i64 %85, 0
  br i1 %89, label %90, label %93

; <label>:90:                                     ; preds = %506, %81
  ret %"class.std::vector"* @_ZN7scratch6render8Drawable22_transformedHullPointsE

; <label>:91:                                     ; preds = %68, %59
  %92 = landingpad { i8*, i32 }
          catch i8* null
  br label %515

; <label>:93:                                     ; preds = %81, %510
  %94 = phi i64 [ %511, %510 ], [ %82, %81 ]
  %95 = phi %"class.math::Vec2"* [ %512, %510 ], [ %83, %81 ]
  %96 = phi %"class.math::Vec2"* [ %507, %510 ], [ %84, %81 ]
  %97 = phi %"class.math::Vec2"* [ %508, %510 ], [ %87, %81 ]
  %98 = ptrtoint %"class.math::Vec2"* %95 to i64
  %99 = bitcast %"class.math::Vec2"* %97 to i64*
  %100 = load i64, i64* %99, align 4
  %101 = trunc i64 %100 to i32
  %102 = lshr i64 %100, 32
  %103 = trunc i64 %102 to i32
  %104 = bitcast i32 %101 to float
  %105 = fdiv float %104, %12
  %106 = bitcast i32 %103 to float
  %107 = fdiv float %106, %14
  %108 = fadd float %19, %105
  %109 = fadd float %20, %107
  %110 = insertelement <2 x float> undef, float %108, i32 0
  %111 = shufflevector <2 x float> %110, <2 x float> undef, <2 x i32> zeroinitializer
  %112 = fmul <2 x float> %50, %111
  %113 = insertelement <2 x float> undef, float %109, i32 0
  %114 = shufflevector <2 x float> %113, <2 x float> undef, <2 x i32> zeroinitializer
  %115 = fmul <2 x float> %54, %114
  %116 = fadd <2 x float> %112, %115
  %117 = icmp eq %"class.math::Vec2"* %96, %95
  br i1 %117, label %122, label %118

; <label>:118:                                    ; preds = %93
  %119 = bitcast %"class.math::Vec2"* %96 to <2 x float>*
  store <2 x float> %116, <2 x float>* %119, align 4
  %120 = load %"class.math::Vec2"*, %"class.math::Vec2"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN7scratch6render8Drawable22_transformedHullPointsE, i64 0, i32 0, i32 0, i32 1), align 8, !tbaa !35
  %121 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %120, i64 1
  store %"class.math::Vec2"* %121, %"class.math::Vec2"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN7scratch6render8Drawable22_transformedHullPointsE, i64 0, i32 0, i32 0, i32 1), align 8, !tbaa !35
  br label %506

; <label>:122:                                    ; preds = %93
  %123 = load i64, i64* bitcast (%"class.std::vector"* @_ZN7scratch6render8Drawable22_transformedHullPointsE to i64*), align 8, !tbaa !36
  %124 = sub i64 %94, %123
  %125 = ashr exact i64 %124, 3
  %126 = icmp eq i64 %124, 0
  %127 = select i1 %126, i64 1, i64 %125
  %128 = add nsw i64 %127, %125
  %129 = icmp ult i64 %128, %125
  %130 = icmp ugt i64 %128, 2305843009213693951
  %131 = or i1 %129, %130
  %132 = select i1 %131, i64 2305843009213693951, i64 %128
  %133 = sub i64 %98, %123
  %134 = ashr exact i64 %133, 3
  %135 = icmp eq i64 %132, 0
  %136 = inttoptr i64 %123 to %"class.math::Vec2"*
  br i1 %135, label %143, label %137

; <label>:137:                                    ; preds = %122
  %138 = shl i64 %132, 3
  %139 = invoke i8* @_Znwm(i64 %138)
          to label %140 unwind label %513

; <label>:140:                                    ; preds = %137
  %141 = bitcast i8* %139 to %"class.math::Vec2"*
  %142 = load %"class.math::Vec2"*, %"class.math::Vec2"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN7scratch6render8Drawable22_transformedHullPointsE, i64 0, i32 0, i32 0, i32 0), align 8, !tbaa !2
  br label %143

; <label>:143:                                    ; preds = %140, %122
  %144 = phi %"class.math::Vec2"* [ %142, %140 ], [ %136, %122 ]
  %145 = phi i8* [ %139, %140 ], [ null, %122 ]
  %146 = phi %"class.math::Vec2"* [ %141, %140 ], [ null, %122 ]
  %147 = bitcast %"class.math::Vec2"* %144 to i8*
  %148 = ptrtoint %"class.math::Vec2"* %144 to i64
  %149 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %146, i64 %134
  %150 = bitcast %"class.math::Vec2"* %149 to <2 x float>*
  store <2 x float> %116, <2 x float>* %150, align 4
  %151 = icmp eq %"class.math::Vec2"* %144, %95
  br i1 %151, label %324, label %152

; <label>:152:                                    ; preds = %143
  %153 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %95, i64 -1
  %154 = ptrtoint %"class.math::Vec2"* %153 to i64
  %155 = sub i64 %154, %148
  %156 = lshr i64 %155, 3
  %157 = add nuw nsw i64 %156, 1
  %158 = icmp ult i64 %157, 4
  br i1 %158, label %253, label %159

; <label>:159:                                    ; preds = %152
  %160 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %146, i64 1
  %161 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %95, i64 -1
  %162 = ptrtoint %"class.math::Vec2"* %161 to i64
  %163 = sub i64 %162, %148
  %164 = lshr i64 %163, 3
  %165 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %160, i64 %164
  %166 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %144, i64 1
  %167 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %166, i64 %164
  %168 = bitcast %"class.math::Vec2"* %167 to i8*
  %169 = icmp ult i8* %145, %168
  %170 = icmp ult %"class.math::Vec2"* %144, %165
  %171 = and i1 %169, %170
  br i1 %171, label %253, label %172

; <label>:172:                                    ; preds = %159
  %173 = and i64 %157, 4611686018427387900
  %174 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %146, i64 %173
  %175 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %144, i64 %173
  %176 = add nsw i64 %173, -4
  %177 = lshr exact i64 %176, 2
  %178 = add nuw nsw i64 %177, 1
  %179 = and i64 %178, 3
  %180 = icmp ult i64 %176, 12
  br i1 %180, label %232, label %181

; <label>:181:                                    ; preds = %172
  %182 = sub nsw i64 %178, %179
  br label %183

; <label>:183:                                    ; preds = %183, %181
  %184 = phi i64 [ 0, %181 ], [ %229, %183 ]
  %185 = phi i64 [ %182, %181 ], [ %230, %183 ]
  %186 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %146, i64 %184
  %187 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %144, i64 %184
  %188 = bitcast %"class.math::Vec2"* %187 to <2 x i64>*
  %189 = load <2 x i64>, <2 x i64>* %188, align 4, !alias.scope !49
  %190 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %187, i64 2
  %191 = bitcast %"class.math::Vec2"* %190 to <2 x i64>*
  %192 = load <2 x i64>, <2 x i64>* %191, align 4, !alias.scope !49
  %193 = bitcast %"class.math::Vec2"* %186 to <2 x i64>*
  store <2 x i64> %189, <2 x i64>* %193, align 4, !alias.scope !52, !noalias !49
  %194 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %186, i64 2
  %195 = bitcast %"class.math::Vec2"* %194 to <2 x i64>*
  store <2 x i64> %192, <2 x i64>* %195, align 4, !alias.scope !52, !noalias !49
  %196 = or i64 %184, 4
  %197 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %146, i64 %196
  %198 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %144, i64 %196
  %199 = bitcast %"class.math::Vec2"* %198 to <2 x i64>*
  %200 = load <2 x i64>, <2 x i64>* %199, align 4, !alias.scope !49
  %201 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %198, i64 2
  %202 = bitcast %"class.math::Vec2"* %201 to <2 x i64>*
  %203 = load <2 x i64>, <2 x i64>* %202, align 4, !alias.scope !49
  %204 = bitcast %"class.math::Vec2"* %197 to <2 x i64>*
  store <2 x i64> %200, <2 x i64>* %204, align 4, !alias.scope !52, !noalias !49
  %205 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %197, i64 2
  %206 = bitcast %"class.math::Vec2"* %205 to <2 x i64>*
  store <2 x i64> %203, <2 x i64>* %206, align 4, !alias.scope !52, !noalias !49
  %207 = or i64 %184, 8
  %208 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %146, i64 %207
  %209 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %144, i64 %207
  %210 = bitcast %"class.math::Vec2"* %209 to <2 x i64>*
  %211 = load <2 x i64>, <2 x i64>* %210, align 4, !alias.scope !49
  %212 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %209, i64 2
  %213 = bitcast %"class.math::Vec2"* %212 to <2 x i64>*
  %214 = load <2 x i64>, <2 x i64>* %213, align 4, !alias.scope !49
  %215 = bitcast %"class.math::Vec2"* %208 to <2 x i64>*
  store <2 x i64> %211, <2 x i64>* %215, align 4, !alias.scope !52, !noalias !49
  %216 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %208, i64 2
  %217 = bitcast %"class.math::Vec2"* %216 to <2 x i64>*
  store <2 x i64> %214, <2 x i64>* %217, align 4, !alias.scope !52, !noalias !49
  %218 = or i64 %184, 12
  %219 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %146, i64 %218
  %220 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %144, i64 %218
  %221 = bitcast %"class.math::Vec2"* %220 to <2 x i64>*
  %222 = load <2 x i64>, <2 x i64>* %221, align 4, !alias.scope !49
  %223 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %220, i64 2
  %224 = bitcast %"class.math::Vec2"* %223 to <2 x i64>*
  %225 = load <2 x i64>, <2 x i64>* %224, align 4, !alias.scope !49
  %226 = bitcast %"class.math::Vec2"* %219 to <2 x i64>*
  store <2 x i64> %222, <2 x i64>* %226, align 4, !alias.scope !52, !noalias !49
  %227 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %219, i64 2
  %228 = bitcast %"class.math::Vec2"* %227 to <2 x i64>*
  store <2 x i64> %225, <2 x i64>* %228, align 4, !alias.scope !52, !noalias !49
  %229 = add i64 %184, 16
  %230 = add i64 %185, -4
  %231 = icmp eq i64 %230, 0
  br i1 %231, label %232, label %183, !llvm.loop !54

; <label>:232:                                    ; preds = %183, %172
  %233 = phi i64 [ 0, %172 ], [ %229, %183 ]
  %234 = icmp eq i64 %179, 0
  br i1 %234, label %251, label %235

; <label>:235:                                    ; preds = %232, %235
  %236 = phi i64 [ %248, %235 ], [ %233, %232 ]
  %237 = phi i64 [ %249, %235 ], [ %179, %232 ]
  %238 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %146, i64 %236
  %239 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %144, i64 %236
  %240 = bitcast %"class.math::Vec2"* %239 to <2 x i64>*
  %241 = load <2 x i64>, <2 x i64>* %240, align 4, !alias.scope !49
  %242 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %239, i64 2
  %243 = bitcast %"class.math::Vec2"* %242 to <2 x i64>*
  %244 = load <2 x i64>, <2 x i64>* %243, align 4, !alias.scope !49
  %245 = bitcast %"class.math::Vec2"* %238 to <2 x i64>*
  store <2 x i64> %241, <2 x i64>* %245, align 4, !alias.scope !52, !noalias !49
  %246 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %238, i64 2
  %247 = bitcast %"class.math::Vec2"* %246 to <2 x i64>*
  store <2 x i64> %244, <2 x i64>* %247, align 4, !alias.scope !52, !noalias !49
  %248 = add i64 %236, 4
  %249 = add i64 %237, -1
  %250 = icmp eq i64 %249, 0
  br i1 %250, label %251, label %235, !llvm.loop !56

; <label>:251:                                    ; preds = %235, %232
  %252 = icmp eq i64 %157, %173
  br i1 %252, label %324, label %253

; <label>:253:                                    ; preds = %251, %159, %152
  %254 = phi %"class.math::Vec2"* [ %146, %159 ], [ %146, %152 ], [ %174, %251 ]
  %255 = phi %"class.math::Vec2"* [ %144, %159 ], [ %144, %152 ], [ %175, %251 ]
  %256 = ptrtoint %"class.math::Vec2"* %255 to i64
  %257 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %95, i64 -1
  %258 = ptrtoint %"class.math::Vec2"* %257 to i64
  %259 = sub i64 %258, %256
  %260 = lshr i64 %259, 3
  %261 = add nuw nsw i64 %260, 1
  %262 = and i64 %261, 7
  %263 = icmp eq i64 %262, 0
  br i1 %263, label %275, label %264

; <label>:264:                                    ; preds = %253, %264
  %265 = phi %"class.math::Vec2"* [ %272, %264 ], [ %254, %253 ]
  %266 = phi %"class.math::Vec2"* [ %271, %264 ], [ %255, %253 ]
  %267 = phi i64 [ %273, %264 ], [ %262, %253 ]
  %268 = bitcast %"class.math::Vec2"* %266 to i64*
  %269 = bitcast %"class.math::Vec2"* %265 to i64*
  %270 = load i64, i64* %268, align 4
  store i64 %270, i64* %269, align 4
  %271 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %266, i64 1
  %272 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %265, i64 1
  %273 = add i64 %267, -1
  %274 = icmp eq i64 %273, 0
  br i1 %274, label %275, label %264, !llvm.loop !58

; <label>:275:                                    ; preds = %264, %253
  %276 = phi %"class.math::Vec2"* [ undef, %253 ], [ %272, %264 ]
  %277 = phi %"class.math::Vec2"* [ %254, %253 ], [ %272, %264 ]
  %278 = phi %"class.math::Vec2"* [ %255, %253 ], [ %271, %264 ]
  %279 = icmp ult i64 %259, 56
  br i1 %279, label %324, label %280

; <label>:280:                                    ; preds = %275, %280
  %281 = phi %"class.math::Vec2"* [ %322, %280 ], [ %277, %275 ]
  %282 = phi %"class.math::Vec2"* [ %321, %280 ], [ %278, %275 ]
  %283 = bitcast %"class.math::Vec2"* %282 to i64*
  %284 = bitcast %"class.math::Vec2"* %281 to i64*
  %285 = load i64, i64* %283, align 4
  store i64 %285, i64* %284, align 4
  %286 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %282, i64 1
  %287 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %281, i64 1
  %288 = bitcast %"class.math::Vec2"* %286 to i64*
  %289 = bitcast %"class.math::Vec2"* %287 to i64*
  %290 = load i64, i64* %288, align 4
  store i64 %290, i64* %289, align 4
  %291 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %282, i64 2
  %292 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %281, i64 2
  %293 = bitcast %"class.math::Vec2"* %291 to i64*
  %294 = bitcast %"class.math::Vec2"* %292 to i64*
  %295 = load i64, i64* %293, align 4
  store i64 %295, i64* %294, align 4
  %296 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %282, i64 3
  %297 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %281, i64 3
  %298 = bitcast %"class.math::Vec2"* %296 to i64*
  %299 = bitcast %"class.math::Vec2"* %297 to i64*
  %300 = load i64, i64* %298, align 4
  store i64 %300, i64* %299, align 4
  %301 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %282, i64 4
  %302 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %281, i64 4
  %303 = bitcast %"class.math::Vec2"* %301 to i64*
  %304 = bitcast %"class.math::Vec2"* %302 to i64*
  %305 = load i64, i64* %303, align 4
  store i64 %305, i64* %304, align 4
  %306 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %282, i64 5
  %307 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %281, i64 5
  %308 = bitcast %"class.math::Vec2"* %306 to i64*
  %309 = bitcast %"class.math::Vec2"* %307 to i64*
  %310 = load i64, i64* %308, align 4
  store i64 %310, i64* %309, align 4
  %311 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %282, i64 6
  %312 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %281, i64 6
  %313 = bitcast %"class.math::Vec2"* %311 to i64*
  %314 = bitcast %"class.math::Vec2"* %312 to i64*
  %315 = load i64, i64* %313, align 4
  store i64 %315, i64* %314, align 4
  %316 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %282, i64 7
  %317 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %281, i64 7
  %318 = bitcast %"class.math::Vec2"* %316 to i64*
  %319 = bitcast %"class.math::Vec2"* %317 to i64*
  %320 = load i64, i64* %318, align 4
  store i64 %320, i64* %319, align 4
  %321 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %282, i64 8
  %322 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %281, i64 8
  %323 = icmp eq %"class.math::Vec2"* %321, %95
  br i1 %323, label %324, label %280, !llvm.loop !59

; <label>:324:                                    ; preds = %275, %280, %251, %143
  %325 = phi %"class.math::Vec2"* [ %146, %143 ], [ %174, %251 ], [ %276, %275 ], [ %322, %280 ]
  %326 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %325, i64 1
  %327 = load %"class.math::Vec2"*, %"class.math::Vec2"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN7scratch6render8Drawable22_transformedHullPointsE, i64 0, i32 0, i32 0, i32 1), align 8, !tbaa !35
  %328 = icmp eq %"class.math::Vec2"* %327, %95
  br i1 %328, label %500, label %329

; <label>:329:                                    ; preds = %324
  %330 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %327, i64 -1
  %331 = ptrtoint %"class.math::Vec2"* %330 to i64
  %332 = sub i64 %331, %98
  %333 = lshr i64 %332, 3
  %334 = add nuw nsw i64 %333, 1
  %335 = icmp ult i64 %334, 4
  br i1 %335, label %429, label %336

; <label>:336:                                    ; preds = %329
  %337 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %325, i64 2
  %338 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %327, i64 -1
  %339 = ptrtoint %"class.math::Vec2"* %338 to i64
  %340 = sub i64 %339, %98
  %341 = lshr i64 %340, 3
  %342 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %337, i64 %341
  %343 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %95, i64 1
  %344 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %343, i64 %341
  %345 = icmp ult %"class.math::Vec2"* %326, %344
  %346 = icmp ult %"class.math::Vec2"* %95, %342
  %347 = and i1 %345, %346
  br i1 %347, label %429, label %348

; <label>:348:                                    ; preds = %336
  %349 = and i64 %334, 4611686018427387900
  %350 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %326, i64 %349
  %351 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %95, i64 %349
  %352 = add nsw i64 %349, -4
  %353 = lshr exact i64 %352, 2
  %354 = add nuw nsw i64 %353, 1
  %355 = and i64 %354, 3
  %356 = icmp ult i64 %352, 12
  br i1 %356, label %408, label %357

; <label>:357:                                    ; preds = %348
  %358 = sub nsw i64 %354, %355
  br label %359

; <label>:359:                                    ; preds = %359, %357
  %360 = phi i64 [ 0, %357 ], [ %405, %359 ]
  %361 = phi i64 [ %358, %357 ], [ %406, %359 ]
  %362 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %326, i64 %360
  %363 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %95, i64 %360
  %364 = bitcast %"class.math::Vec2"* %363 to <2 x i64>*
  %365 = load <2 x i64>, <2 x i64>* %364, align 4, !alias.scope !60
  %366 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %363, i64 2
  %367 = bitcast %"class.math::Vec2"* %366 to <2 x i64>*
  %368 = load <2 x i64>, <2 x i64>* %367, align 4, !alias.scope !60
  %369 = bitcast %"class.math::Vec2"* %362 to <2 x i64>*
  store <2 x i64> %365, <2 x i64>* %369, align 4, !alias.scope !63, !noalias !60
  %370 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %362, i64 2
  %371 = bitcast %"class.math::Vec2"* %370 to <2 x i64>*
  store <2 x i64> %368, <2 x i64>* %371, align 4, !alias.scope !63, !noalias !60
  %372 = or i64 %360, 4
  %373 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %326, i64 %372
  %374 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %95, i64 %372
  %375 = bitcast %"class.math::Vec2"* %374 to <2 x i64>*
  %376 = load <2 x i64>, <2 x i64>* %375, align 4, !alias.scope !60
  %377 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %374, i64 2
  %378 = bitcast %"class.math::Vec2"* %377 to <2 x i64>*
  %379 = load <2 x i64>, <2 x i64>* %378, align 4, !alias.scope !60
  %380 = bitcast %"class.math::Vec2"* %373 to <2 x i64>*
  store <2 x i64> %376, <2 x i64>* %380, align 4, !alias.scope !63, !noalias !60
  %381 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %373, i64 2
  %382 = bitcast %"class.math::Vec2"* %381 to <2 x i64>*
  store <2 x i64> %379, <2 x i64>* %382, align 4, !alias.scope !63, !noalias !60
  %383 = or i64 %360, 8
  %384 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %326, i64 %383
  %385 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %95, i64 %383
  %386 = bitcast %"class.math::Vec2"* %385 to <2 x i64>*
  %387 = load <2 x i64>, <2 x i64>* %386, align 4, !alias.scope !60
  %388 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %385, i64 2
  %389 = bitcast %"class.math::Vec2"* %388 to <2 x i64>*
  %390 = load <2 x i64>, <2 x i64>* %389, align 4, !alias.scope !60
  %391 = bitcast %"class.math::Vec2"* %384 to <2 x i64>*
  store <2 x i64> %387, <2 x i64>* %391, align 4, !alias.scope !63, !noalias !60
  %392 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %384, i64 2
  %393 = bitcast %"class.math::Vec2"* %392 to <2 x i64>*
  store <2 x i64> %390, <2 x i64>* %393, align 4, !alias.scope !63, !noalias !60
  %394 = or i64 %360, 12
  %395 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %326, i64 %394
  %396 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %95, i64 %394
  %397 = bitcast %"class.math::Vec2"* %396 to <2 x i64>*
  %398 = load <2 x i64>, <2 x i64>* %397, align 4, !alias.scope !60
  %399 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %396, i64 2
  %400 = bitcast %"class.math::Vec2"* %399 to <2 x i64>*
  %401 = load <2 x i64>, <2 x i64>* %400, align 4, !alias.scope !60
  %402 = bitcast %"class.math::Vec2"* %395 to <2 x i64>*
  store <2 x i64> %398, <2 x i64>* %402, align 4, !alias.scope !63, !noalias !60
  %403 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %395, i64 2
  %404 = bitcast %"class.math::Vec2"* %403 to <2 x i64>*
  store <2 x i64> %401, <2 x i64>* %404, align 4, !alias.scope !63, !noalias !60
  %405 = add i64 %360, 16
  %406 = add i64 %361, -4
  %407 = icmp eq i64 %406, 0
  br i1 %407, label %408, label %359, !llvm.loop !65

; <label>:408:                                    ; preds = %359, %348
  %409 = phi i64 [ 0, %348 ], [ %405, %359 ]
  %410 = icmp eq i64 %355, 0
  br i1 %410, label %427, label %411

; <label>:411:                                    ; preds = %408, %411
  %412 = phi i64 [ %424, %411 ], [ %409, %408 ]
  %413 = phi i64 [ %425, %411 ], [ %355, %408 ]
  %414 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %326, i64 %412
  %415 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %95, i64 %412
  %416 = bitcast %"class.math::Vec2"* %415 to <2 x i64>*
  %417 = load <2 x i64>, <2 x i64>* %416, align 4, !alias.scope !60
  %418 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %415, i64 2
  %419 = bitcast %"class.math::Vec2"* %418 to <2 x i64>*
  %420 = load <2 x i64>, <2 x i64>* %419, align 4, !alias.scope !60
  %421 = bitcast %"class.math::Vec2"* %414 to <2 x i64>*
  store <2 x i64> %417, <2 x i64>* %421, align 4, !alias.scope !63, !noalias !60
  %422 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %414, i64 2
  %423 = bitcast %"class.math::Vec2"* %422 to <2 x i64>*
  store <2 x i64> %420, <2 x i64>* %423, align 4, !alias.scope !63, !noalias !60
  %424 = add i64 %412, 4
  %425 = add i64 %413, -1
  %426 = icmp eq i64 %425, 0
  br i1 %426, label %427, label %411, !llvm.loop !66

; <label>:427:                                    ; preds = %411, %408
  %428 = icmp eq i64 %334, %349
  br i1 %428, label %500, label %429

; <label>:429:                                    ; preds = %427, %336, %329
  %430 = phi %"class.math::Vec2"* [ %326, %336 ], [ %326, %329 ], [ %350, %427 ]
  %431 = phi %"class.math::Vec2"* [ %95, %336 ], [ %95, %329 ], [ %351, %427 ]
  %432 = ptrtoint %"class.math::Vec2"* %431 to i64
  %433 = getelementptr %"class.math::Vec2", %"class.math::Vec2"* %327, i64 -1
  %434 = ptrtoint %"class.math::Vec2"* %433 to i64
  %435 = sub i64 %434, %432
  %436 = lshr i64 %435, 3
  %437 = add nuw nsw i64 %436, 1
  %438 = and i64 %437, 7
  %439 = icmp eq i64 %438, 0
  br i1 %439, label %451, label %440

; <label>:440:                                    ; preds = %429, %440
  %441 = phi %"class.math::Vec2"* [ %448, %440 ], [ %430, %429 ]
  %442 = phi %"class.math::Vec2"* [ %447, %440 ], [ %431, %429 ]
  %443 = phi i64 [ %449, %440 ], [ %438, %429 ]
  %444 = bitcast %"class.math::Vec2"* %442 to i64*
  %445 = bitcast %"class.math::Vec2"* %441 to i64*
  %446 = load i64, i64* %444, align 4
  store i64 %446, i64* %445, align 4
  %447 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %442, i64 1
  %448 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %441, i64 1
  %449 = add i64 %443, -1
  %450 = icmp eq i64 %449, 0
  br i1 %450, label %451, label %440, !llvm.loop !67

; <label>:451:                                    ; preds = %440, %429
  %452 = phi %"class.math::Vec2"* [ undef, %429 ], [ %448, %440 ]
  %453 = phi %"class.math::Vec2"* [ %430, %429 ], [ %448, %440 ]
  %454 = phi %"class.math::Vec2"* [ %431, %429 ], [ %447, %440 ]
  %455 = icmp ult i64 %435, 56
  br i1 %455, label %500, label %456

; <label>:456:                                    ; preds = %451, %456
  %457 = phi %"class.math::Vec2"* [ %498, %456 ], [ %453, %451 ]
  %458 = phi %"class.math::Vec2"* [ %497, %456 ], [ %454, %451 ]
  %459 = bitcast %"class.math::Vec2"* %458 to i64*
  %460 = bitcast %"class.math::Vec2"* %457 to i64*
  %461 = load i64, i64* %459, align 4
  store i64 %461, i64* %460, align 4
  %462 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %458, i64 1
  %463 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %457, i64 1
  %464 = bitcast %"class.math::Vec2"* %462 to i64*
  %465 = bitcast %"class.math::Vec2"* %463 to i64*
  %466 = load i64, i64* %464, align 4
  store i64 %466, i64* %465, align 4
  %467 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %458, i64 2
  %468 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %457, i64 2
  %469 = bitcast %"class.math::Vec2"* %467 to i64*
  %470 = bitcast %"class.math::Vec2"* %468 to i64*
  %471 = load i64, i64* %469, align 4
  store i64 %471, i64* %470, align 4
  %472 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %458, i64 3
  %473 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %457, i64 3
  %474 = bitcast %"class.math::Vec2"* %472 to i64*
  %475 = bitcast %"class.math::Vec2"* %473 to i64*
  %476 = load i64, i64* %474, align 4
  store i64 %476, i64* %475, align 4
  %477 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %458, i64 4
  %478 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %457, i64 4
  %479 = bitcast %"class.math::Vec2"* %477 to i64*
  %480 = bitcast %"class.math::Vec2"* %478 to i64*
  %481 = load i64, i64* %479, align 4
  store i64 %481, i64* %480, align 4
  %482 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %458, i64 5
  %483 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %457, i64 5
  %484 = bitcast %"class.math::Vec2"* %482 to i64*
  %485 = bitcast %"class.math::Vec2"* %483 to i64*
  %486 = load i64, i64* %484, align 4
  store i64 %486, i64* %485, align 4
  %487 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %458, i64 6
  %488 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %457, i64 6
  %489 = bitcast %"class.math::Vec2"* %487 to i64*
  %490 = bitcast %"class.math::Vec2"* %488 to i64*
  %491 = load i64, i64* %489, align 4
  store i64 %491, i64* %490, align 4
  %492 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %458, i64 7
  %493 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %457, i64 7
  %494 = bitcast %"class.math::Vec2"* %492 to i64*
  %495 = bitcast %"class.math::Vec2"* %493 to i64*
  %496 = load i64, i64* %494, align 4
  store i64 %496, i64* %495, align 4
  %497 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %458, i64 8
  %498 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %457, i64 8
  %499 = icmp eq %"class.math::Vec2"* %497, %327
  br i1 %499, label %500, label %456, !llvm.loop !68

; <label>:500:                                    ; preds = %451, %456, %427, %324
  %501 = phi %"class.math::Vec2"* [ %326, %324 ], [ %350, %427 ], [ %452, %451 ], [ %498, %456 ]
  %502 = icmp eq %"class.math::Vec2"* %144, null
  br i1 %502, label %504, label %503

; <label>:503:                                    ; preds = %500
  tail call void @_ZdlPv(i8* %147) #1
  br label %504

; <label>:504:                                    ; preds = %503, %500
  store i8* %145, i8** bitcast (%"class.std::vector"* @_ZN7scratch6render8Drawable22_transformedHullPointsE to i8**), align 8, !tbaa !2
  store %"class.math::Vec2"* %501, %"class.math::Vec2"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN7scratch6render8Drawable22_transformedHullPointsE, i64 0, i32 0, i32 0, i32 1), align 8, !tbaa !35
  %505 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %146, i64 %132
  store %"class.math::Vec2"* %505, %"class.math::Vec2"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN7scratch6render8Drawable22_transformedHullPointsE, i64 0, i32 0, i32 0, i32 2), align 8, !tbaa !47
  br label %506

; <label>:506:                                    ; preds = %504, %118
  %507 = phi %"class.math::Vec2"* [ %501, %504 ], [ %121, %118 ]
  %508 = getelementptr inbounds %"class.math::Vec2", %"class.math::Vec2"* %97, i64 1
  %509 = icmp eq %"class.math::Vec2"* %508, %88
  br i1 %509, label %90, label %510

; <label>:510:                                    ; preds = %506
  %511 = ptrtoint %"class.math::Vec2"* %507 to i64
  %512 = load %"class.math::Vec2"*, %"class.math::Vec2"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN7scratch6render8Drawable22_transformedHullPointsE, i64 0, i32 0, i32 0, i32 2), align 8, !tbaa !47
  br label %93

; <label>:513:                                    ; preds = %137
  %514 = landingpad { i8*, i32 }
          catch i8* null
  br label %515

; <label>:515:                                    ; preds = %513, %91
  %516 = phi { i8*, i32 } [ %514, %513 ], [ %92, %91 ]
  %517 = extractvalue { i8*, i32 } %516, 0
  tail call void @__clang_call_terminate(i8* %517) #17
  unreachable
}

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #11

; Function Attrs: nounwind
declare dso_local float @cosf(float) local_unnamed_addr #4

; Function Attrs: nounwind
declare dso_local float @sinf(float) local_unnamed_addr #4

; Function Attrs: noreturn
declare dso_local void @_ZSt20__throw_length_errorPKc(i8*) local_unnamed_addr #12

; Function Attrs: nobuiltin
declare dso_local noalias nonnull i8* @_Znwm(i64) local_unnamed_addr #13

; Function Attrs: nobuiltin nounwind
declare dso_local void @_ZdlPv(i8*) local_unnamed_addr #14

; Function Attrs: norecurse nounwind uwtable
define linkonce_odr dso_local dereferenceable(8) %"class.math::Vec2"* @_ZNK7scratch6render4Skin4sizeEv(%"class.render::scratch::Skin"*) unnamed_addr #15 comdat align 2 {
  ret %"class.math::Vec2"* bitcast ({ { %"struct.std::array.1" } }* @_ZN7scratch6render4Skin4zeroE to %"class.math::Vec2"*)
}

; Function Attrs: norecurse nounwind uwtable
define linkonce_odr dso_local void @_ZNK7scratch6render4Skin10getTextureEv(%"class.std::unique_ptr.31"* noalias sret, %"class.render::scratch::Skin"*) unnamed_addr #15 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
  %3 = getelementptr inbounds %"class.std::unique_ptr.31", %"class.std::unique_ptr.31"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store %"class.render::scratch::JS"* null, %"class.render::scratch::JS"** %3, align 8, !tbaa !69
  ret void
}

; Function Attrs: norecurse nounwind uwtable
define linkonce_odr dso_local void @_ZN7scratch6render4Skin7disposeEv(%"class.render::scratch::Skin"*) unnamed_addr #15 comdat align 2 {
  %2 = getelementptr inbounds %"class.render::scratch::Skin", %"class.render::scratch::Skin"* %0, i64 0, i32 1, i32 0
  store i32 -1, i32* %2, align 8
  ret void
}

; Function Attrs: norecurse nounwind uwtable
define linkonce_odr dso_local zeroext i1 @_ZNK7scratch6render4Skin8isRasterEv(%"class.render::scratch::Skin"*) unnamed_addr #15 comdat align 2 {
  ret i1 false
}

; Function Attrs: norecurse nounwind uwtable
define linkonce_odr dso_local void @_ZN7scratch6render4Skin16updateSilhouetteEv(%"class.render::scratch::Skin"*) unnamed_addr #15 comdat align 2 {
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @_GLOBAL__sub_I_Drawable.cpp() #0 section ".text.startup" personality i32 (...)* @__gxx_personality_v0 {
  tail call void @llvm.memset.p0i8.i64(i8* align 8 bitcast (%"class.std::vector"* @_ZN7scratch6render8Drawable22_transformedHullPointsE to i8*), i8 0, i64 24, i1 false) #1
  %1 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::vector"*)* @_ZNSt6vectorIN4math4Vec2IfEESaIS2_EED2Ev to void (i8*)*), i8* bitcast (%"class.std::vector"* @_ZN7scratch6render8Drawable22_transformedHullPointsE to i8*), i8* nonnull @__dso_handle) #1
  ret void
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="64" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { inlinehint nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { inlinehint norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { inlinehint nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { noinline noreturn nounwind }
attributes #9 = { nounwind readnone speculatable }
attributes #10 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="64" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #13 = { nobuiltin "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #14 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #15 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #16 = { builtin nounwind }
attributes #17 = { noreturn nounwind }
attributes #18 = { noreturn }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 8.0.0 (tags/RELEASE_800/final)"}
!2 = !{!3, !5, i64 0}
!3 = !{!"_ZTSSt12_Vector_baseIN4math4Vec2IfEESaIS2_EE", !4, i64 0}
!4 = !{!"_ZTSNSt12_Vector_baseIN4math4Vec2IfEESaIS2_EE12_Vector_implE", !5, i64 0, !5, i64 8, !5, i64 16}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{!9, !17, i64 493}
!9 = !{!"_ZTSN7scratch6render8DrawableE", !10, i64 0, !12, i64 4, !16, i64 180, !16, i64 188, !6, i64 196, !17, i64 197, !13, i64 200, !17, i64 328, !16, i64 332, !17, i64 340, !18, i64 344, !16, i64 352, !17, i64 360, !13, i64 364, !17, i64 492, !17, i64 493, !21, i64 496, !17, i64 512}
!10 = !{!"_ZTSN7scratch6render2IdE", !11, i64 0}
!11 = !{!"int", !6, i64 0}
!12 = !{!"_ZTSN7scratch6render8Drawable8UniformsE", !13, i64 0, !14, i64 128, !15, i64 144}
!13 = !{!"_ZTSN4math4Mat4IfEE"}
!14 = !{!"_ZTSN7scratch6render5ColorE", !6, i64 0}
!15 = !{!"_ZTSN7scratch6render6shader7effects7EffectsE", !11, i64 0, !6, i64 4}
!16 = !{!"_ZTSN4math4Vec2IfEE"}
!17 = !{!"bool", !6, i64 0}
!18 = !{!"_ZTSSt10unique_ptrIN7scratch6render4SkinESt14default_deleteIS2_EE", !19, i64 0}
!19 = !{!"_ZTSSt15__uniq_ptr_implIN7scratch6render4SkinESt14default_deleteIS2_EE", !20, i64 0}
!20 = !{!"_ZTSSt5tupleIJPN7scratch6render4SkinESt14default_deleteIS2_EEE"}
!21 = !{!"_ZTSN7Corrade10Containers9ArrayViewIN4math4Vec2IfEEEE", !5, i64 0, !22, i64 8}
!22 = !{!"long", !6, i64 0}
!23 = !{!9, !6, i64 196}
!24 = !{!9, !17, i64 328}
!25 = !{!9, !17, i64 340}
!26 = !{!9, !17, i64 360}
!27 = !{!9, !17, i64 197}
!28 = !{!9, !17, i64 492}
!29 = !{!30, !30, i64 0}
!30 = !{!"float", !6, i64 0}
!31 = !{!15, !11, i64 0}
!32 = !{i64 0, i64 40, !33}
!33 = !{!6, !6, i64 0}
!34 = !{!9, !17, i64 512}
!35 = !{!3, !5, i64 8}
!36 = !{!5, !5, i64 0}
!37 = !{!38, !38, i64 0}
!38 = !{!"vtable pointer", !7, i64 0}
!39 = !{i8 0, i8 2}
!40 = !{!41}
!41 = distinct !{!41, !42, !"_ZNK4math3MatILm4ELm4EfE8truncateILm2ELm2EEENS0_IXT_EXT0_EfEEv: argument 0"}
!42 = distinct !{!42, !"_ZNK4math3MatILm4ELm4EfE8truncateILm2ELm2EEENS0_IXT_EXT0_EfEEv"}
!43 = !{!44}
!44 = distinct !{!44, !45, !"_ZN4mathmlILm4ELm4ELm4EffEEDaRKNS_3MatIXT_EXT0_ET2_EERKNS1_IXT0_EXT1_ET3_EE: argument 0"}
!45 = distinct !{!45, !"_ZN4mathmlILm4ELm4ELm4EffEEDaRKNS_3MatIXT_EXT0_ET2_EERKNS1_IXT0_EXT1_ET3_EE"}
!46 = !{!21, !22, i64 8}
!47 = !{!3, !5, i64 16}
!48 = !{!21, !5, i64 0}
!49 = !{!50}
!50 = distinct !{!50, !51}
!51 = distinct !{!51, !"LVerDomain"}
!52 = !{!53}
!53 = distinct !{!53, !51}
!54 = distinct !{!54, !55}
!55 = !{!"llvm.loop.isvectorized", i32 1}
!56 = distinct !{!56, !57}
!57 = !{!"llvm.loop.unroll.disable"}
!58 = distinct !{!58, !57}
!59 = distinct !{!59, !55}
!60 = !{!61}
!61 = distinct !{!61, !62}
!62 = distinct !{!62, !"LVerDomain"}
!63 = !{!64}
!64 = distinct !{!64, !62}
!65 = distinct !{!65, !55}
!66 = distinct !{!66, !57}
!67 = distinct !{!67, !57}
!68 = distinct !{!68, !55}
!69 = !{!70, !5, i64 0}
!70 = !{!"_ZTSSt10_Head_baseILm0EPN7scratch6render2JSELb0EE", !5, i64 0}
