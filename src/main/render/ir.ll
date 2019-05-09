; ModuleID = 'ir.cpp'
source_filename = "ir.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind readnone uwtable
define dso_local i32 @f1() local_unnamed_addr #0 personality i32 (...)* @__gxx_personality_v0 {
  ret i32 13056
}

; Function Attrs: norecurse nounwind readnone uwtable
define dso_local i32 @f2() local_unnamed_addr #1 {
  ret i32 13056
}

; Function Attrs: nounwind readnone uwtable
define dso_local i32 @f3() local_unnamed_addr #2 personality i32 (...)* @__gxx_personality_v0 {
  ret i32 656700
}

; Function Attrs: norecurse nounwind readnone uwtable
define dso_local i32 @f4(i32) local_unnamed_addr #1 {
  %2 = icmp sgt i32 %0, 0
  br i1 %2, label %3, label %56

; <label>:3:                                      ; preds = %1
  %4 = add i32 %0, -1
  %5 = zext i32 %4 to i36
  %6 = add i32 %0, -2
  %7 = zext i32 %6 to i36
  %8 = mul i36 %5, %7
  %9 = add i32 %0, -3
  %10 = zext i32 %9 to i36
  %11 = mul i36 %8, %10
  %12 = add i32 %0, -4
  %13 = zext i32 %12 to i36
  %14 = mul i36 %11, %13
  %15 = add i32 %0, -5
  %16 = zext i32 %15 to i36
  %17 = mul i36 %14, %16
  %18 = add i32 %0, -6
  %19 = zext i32 %18 to i36
  %20 = mul i36 %17, %19
  %21 = lshr i36 %20, 4
  %22 = trunc i36 %21 to i32
  %23 = mul i32 %22, 1431655768
  %24 = add i32 %23, %0
  %25 = zext i32 %4 to i35
  %26 = zext i32 %6 to i35
  %27 = mul i35 %25, %26
  %28 = zext i32 %9 to i35
  %29 = mul i35 %27, %28
  %30 = zext i32 %12 to i35
  %31 = mul i35 %29, %30
  %32 = lshr i35 %31, 3
  %33 = trunc i35 %32 to i32
  %34 = mul i32 %33, 130
  %35 = add i32 %24, %34
  %36 = zext i32 %4 to i33
  %37 = zext i32 %6 to i33
  %38 = mul i33 %36, %37
  %39 = zext i32 %9 to i33
  %40 = mul i33 %38, %39
  %41 = lshr i33 %40, 1
  %42 = trunc i33 %41 to i32
  %43 = mul i32 %42, 60
  %44 = add i32 %35, %43
  %45 = lshr i33 %38, 1
  %46 = trunc i33 %45 to i32
  %47 = mul i32 %46, 31
  %48 = add i32 %44, %47
  %49 = zext i32 %15 to i35
  %50 = mul i35 %31, %49
  %51 = lshr i35 %50, 3
  %52 = trunc i35 %51 to i32
  %53 = mul i32 %52, 24
  %54 = add i32 %48, %53
  %55 = add i32 %54, -1
  br label %56

; <label>:56:                                     ; preds = %3, %1
  %57 = phi i32 [ 0, %1 ], [ %55, %3 ]
  ret i32 %57
}

; Function Attrs: nounwind uwtable
define dso_local i32 @f5() local_unnamed_addr #3 personality i32 (...)* @__gxx_personality_v0 {
  %1 = tail call i64 @random() #6
  %2 = sitofp i64 %1 to float
  %3 = tail call i64 @random() #6
  %4 = sitofp i64 %3 to float
  %5 = fmul float %4, 4.000000e+00
  %6 = fdiv float 5.000000e-01, %5
  %7 = insertelement <2 x float> undef, float %2, i32 0
  %8 = insertelement <2 x float> %7, float %5, i32 1
  %9 = fdiv <2 x float> <float 1.000000e+00, float 0.000000e+00>, %8
  %10 = extractelement <2 x float> %9, i32 0
  %11 = fsub float %10, %6
  %12 = shufflevector <2 x float> %9, <2 x float> undef, <2 x i32> zeroinitializer
  %13 = insertelement <2 x float> %9, float %6, i32 0
  %14 = fadd <2 x float> %12, %13
  %15 = fmul float %11, %11
  %16 = fmul <2 x float> %14, %14
  %17 = extractelement <2 x float> %16, i32 0
  %18 = fadd float %17, %15
  %19 = extractelement <2 x float> %16, i32 1
  %20 = fadd float %18, %19
  %21 = fadd float %20, %19
  %22 = call float @sqrtf(float %21) #4
  %23 = call float @sqrtf(float 0x7FF8000000000000) #4
  %24 = fptosi float %23 to i32
  ret i32 %24
}

; Function Attrs: nounwind
declare dso_local i64 @random() local_unnamed_addr #4

; Function Attrs: norecurse nounwind uwtable
define dso_local i32 @main(i32, i8** nocapture readnone) local_unnamed_addr #5 personality i32 (...)* @__gxx_personality_v0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %4, label %57

; <label>:4:                                      ; preds = %2
  %5 = add i32 %0, -1
  %6 = zext i32 %5 to i36
  %7 = add i32 %0, -2
  %8 = zext i32 %7 to i36
  %9 = mul i36 %6, %8
  %10 = add i32 %0, -3
  %11 = zext i32 %10 to i36
  %12 = mul i36 %9, %11
  %13 = add i32 %0, -4
  %14 = zext i32 %13 to i36
  %15 = mul i36 %12, %14
  %16 = add i32 %0, -5
  %17 = zext i32 %16 to i36
  %18 = mul i36 %15, %17
  %19 = add i32 %0, -6
  %20 = zext i32 %19 to i36
  %21 = mul i36 %18, %20
  %22 = lshr i36 %21, 4
  %23 = trunc i36 %22 to i32
  %24 = mul i32 %23, 1431655768
  %25 = zext i32 %5 to i35
  %26 = zext i32 %7 to i35
  %27 = mul i35 %25, %26
  %28 = zext i32 %10 to i35
  %29 = mul i35 %27, %28
  %30 = zext i32 %13 to i35
  %31 = mul i35 %29, %30
  %32 = lshr i35 %31, 3
  %33 = trunc i35 %32 to i32
  %34 = mul i32 %33, 130
  %35 = zext i32 %5 to i33
  %36 = zext i32 %7 to i33
  %37 = mul i33 %35, %36
  %38 = zext i32 %10 to i33
  %39 = mul i33 %37, %38
  %40 = lshr i33 %39, 1
  %41 = trunc i33 %40 to i32
  %42 = mul i32 %41, 60
  %43 = lshr i33 %37, 1
  %44 = trunc i33 %43 to i32
  %45 = mul i32 %44, 31
  %46 = zext i32 %16 to i35
  %47 = mul i35 %31, %46
  %48 = lshr i35 %47, 3
  %49 = trunc i35 %48 to i32
  %50 = mul i32 %49, 24
  %51 = add i32 %0, 682811
  %52 = add i32 %51, %45
  %53 = add i32 %52, %42
  %54 = add i32 %53, %34
  %55 = add i32 %54, %50
  %56 = add i32 %55, %24
  br label %57

; <label>:57:                                     ; preds = %4, %2
  %58 = phi i32 [ 682812, %2 ], [ %56, %4 ]
  %59 = tail call i64 @random() #6
  %60 = tail call i64 @random() #6
  %61 = tail call float @sqrtf(float 0x7FF8000000000000) #4
  %62 = fptosi float %61 to i32
  %63 = add nsw i32 %58, %62
  ret i32 %63
}

declare dso_local i32 @__gxx_personality_v0(...)

declare float @sqrtf(float) local_unnamed_addr

attributes #0 = { nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="64" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="64" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="64" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 8.0.0 (tags/RELEASE_800/final)"}
