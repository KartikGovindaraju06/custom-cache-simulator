; ModuleID = 'trans.c'
source_filename = "trans.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [21 x i8] c"Transpose submission\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Basic transpose\00", align 1
@.str.2 = private unnamed_addr constant [36 x i8] c"Transpose using the temporary array\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"Optimized for 1024x1024 matrices\00", align 1
@.str.4 = private unnamed_addr constant [29 x i8] c"Optimized for 32x32 matrices\00", align 1

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local void @transpose_1024x1024(i64 noundef %0, i64 noundef %1, double* nocapture noundef readonly %2, double* nocapture noundef writeonly %3, double* nocapture readnone %4) #0 !dbg !9 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !22, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.value(metadata i64 %1, metadata !23, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.value(metadata double* %2, metadata !24, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.value(metadata double* %3, metadata !25, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.value(metadata double* undef, metadata !26, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.value(metadata i64 8, metadata !27, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.value(metadata i64 0, metadata !28, metadata !DIExpression()), !dbg !43
  %6 = icmp eq i64 %1, 0, !dbg !44
  br i1 %6, label %45, label %7, !dbg !45

7:                                                ; preds = %5
  %8 = icmp eq i64 %0, 0
  br i1 %8, label %41, label %9, !dbg !46

9:                                                ; preds = %7, %17
  %10 = phi i64 [ %11, %17 ], [ 0, %7 ]
  call void @llvm.dbg.value(metadata i64 %10, metadata !28, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.value(metadata i64 0, metadata !30, metadata !DIExpression()), !dbg !47
  %11 = add i64 %10, 8
  %12 = icmp eq i64 %10, -8
  br i1 %12, label %13, label %19, !dbg !48

13:                                               ; preds = %9, %13
  %14 = phi i64 [ %15, %13 ], [ 0, %9 ]
  call void @llvm.dbg.value(metadata i64 %14, metadata !30, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.value(metadata i64 %10, metadata !34, metadata !DIExpression()), !dbg !49
  %15 = add i64 %14, 8, !dbg !50
  call void @llvm.dbg.value(metadata i64 %15, metadata !30, metadata !DIExpression()), !dbg !47
  %16 = icmp ult i64 %15, %0, !dbg !51
  br i1 %16, label %13, label %17, !dbg !46, !llvm.loop !52

17:                                               ; preds = %23, %13
  call void @llvm.dbg.value(metadata i64 %11, metadata !28, metadata !DIExpression()), !dbg !43
  %18 = icmp ult i64 %11, %1, !dbg !44
  br i1 %18, label %9, label %45, !dbg !45, !llvm.loop !55

19:                                               ; preds = %9, %23
  %20 = phi i64 [ %21, %23 ], [ 0, %9 ]
  call void @llvm.dbg.value(metadata i64 %20, metadata !30, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.value(metadata i64 %10, metadata !34, metadata !DIExpression()), !dbg !49
  %21 = add i64 %20, 8
  %22 = icmp eq i64 %20, -8
  br i1 %22, label %23, label %25, !dbg !57

23:                                               ; preds = %38, %19
  call void @llvm.dbg.value(metadata i64 %21, metadata !30, metadata !DIExpression()), !dbg !47
  %24 = icmp ult i64 %21, %0, !dbg !51
  br i1 %24, label %19, label %17, !dbg !46, !llvm.loop !52

25:                                               ; preds = %19, %38
  %26 = phi i64 [ %39, %38 ], [ %10, %19 ]
  call void @llvm.dbg.value(metadata i64 %26, metadata !34, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.value(metadata i64 %20, metadata !38, metadata !DIExpression()), !dbg !58
  %27 = mul nsw i64 %26, %0
  %28 = getelementptr inbounds double, double* %2, i64 %27
  %29 = getelementptr inbounds double, double* %3, i64 %26
  br label %30, !dbg !57

30:                                               ; preds = %30, %25
  %31 = phi i64 [ %20, %25 ], [ %36, %30 ]
  call void @llvm.dbg.value(metadata i64 %31, metadata !38, metadata !DIExpression()), !dbg !58
  %32 = getelementptr inbounds double, double* %28, i64 %31, !dbg !59
  %33 = load double, double* %32, align 8, !dbg !59, !tbaa !62
  %34 = mul nsw i64 %31, %1, !dbg !66
  %35 = getelementptr inbounds double, double* %29, i64 %34, !dbg !66
  store double %33, double* %35, align 8, !dbg !67, !tbaa !62
  %36 = add nuw i64 %31, 1, !dbg !68
  call void @llvm.dbg.value(metadata i64 %36, metadata !38, metadata !DIExpression()), !dbg !58
  %37 = icmp ult i64 %36, %21, !dbg !69
  br i1 %37, label %30, label %38, !dbg !57, !llvm.loop !70

38:                                               ; preds = %30
  %39 = add nuw i64 %26, 1, !dbg !72
  call void @llvm.dbg.value(metadata i64 %39, metadata !34, metadata !DIExpression()), !dbg !49
  %40 = icmp ult i64 %39, %11, !dbg !73
  br i1 %40, label %25, label %23, !dbg !48, !llvm.loop !74

41:                                               ; preds = %7, %41
  %42 = phi i64 [ %43, %41 ], [ 0, %7 ]
  call void @llvm.dbg.value(metadata i64 %42, metadata !28, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.value(metadata i64 0, metadata !30, metadata !DIExpression()), !dbg !47
  %43 = add i64 %42, 8, !dbg !76
  call void @llvm.dbg.value(metadata i64 %43, metadata !28, metadata !DIExpression()), !dbg !43
  %44 = icmp ult i64 %43, %1, !dbg !44
  br i1 %44, label %41, label %45, !dbg !45, !llvm.loop !55

45:                                               ; preds = %17, %41, %5
  ret void, !dbg !77
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local void @transpose_32x32(i64 noundef %0, i64 noundef %1, double* nocapture noundef readonly %2, double* nocapture noundef writeonly %3, double* nocapture readnone %4) #0 !dbg !78 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !80, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.value(metadata i64 %1, metadata !81, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.value(metadata double* %2, metadata !82, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.value(metadata double* %3, metadata !83, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.value(metadata double* undef, metadata !84, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.value(metadata i64 8, metadata !85, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.value(metadata i64 7, metadata !86, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.value(metadata i64 0, metadata !87, metadata !DIExpression()), !dbg !102
  %6 = icmp eq i64 %1, 0, !dbg !103
  br i1 %6, label %71, label %7, !dbg !104

7:                                                ; preds = %5
  %8 = icmp eq i64 %0, 0
  br i1 %8, label %67, label %9, !dbg !105

9:                                                ; preds = %7, %64
  %10 = phi i64 [ %65, %64 ], [ 0, %7 ]
  call void @llvm.dbg.value(metadata i64 %10, metadata !87, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.value(metadata i64 0, metadata !89, metadata !DIExpression()), !dbg !106
  br label %17, !dbg !105

11:                                               ; preds = %17, %32
  %12 = phi i64 [ %33, %32 ], [ 0, %17 ]
  call void @llvm.dbg.value(metadata i64 %12, metadata !93, metadata !DIExpression()), !dbg !107
  %13 = add nuw nsw i64 %12, %10
  call void @llvm.dbg.value(metadata i64 0, metadata !97, metadata !DIExpression()), !dbg !108
  %14 = mul nsw i64 %13, %0
  %15 = getelementptr inbounds double, double* %2, i64 %14
  %16 = getelementptr inbounds double, double* %3, i64 %13
  br label %20, !dbg !109

17:                                               ; preds = %9, %35
  %18 = phi i64 [ 0, %9 ], [ %36, %35 ]
  call void @llvm.dbg.value(metadata i64 %18, metadata !89, metadata !DIExpression()), !dbg !106
  %19 = icmp eq i64 %10, %18
  call void @llvm.dbg.value(metadata i64 0, metadata !93, metadata !DIExpression()), !dbg !107
  br i1 %19, label %38, label %11

20:                                               ; preds = %29, %11
  %21 = phi i64 [ 0, %11 ], [ %30, %29 ]
  call void @llvm.dbg.value(metadata i64 %21, metadata !97, metadata !DIExpression()), !dbg !108
  %22 = add nuw nsw i64 %21, %18, !dbg !110
  %23 = icmp eq i64 %13, %22, !dbg !114
  br i1 %23, label %29, label %24, !dbg !115

24:                                               ; preds = %20
  %25 = getelementptr inbounds double, double* %15, i64 %22, !dbg !116
  %26 = load double, double* %25, align 8, !dbg !116, !tbaa !62
  %27 = mul nsw i64 %22, %1, !dbg !118
  %28 = getelementptr inbounds double, double* %16, i64 %27, !dbg !118
  store double %26, double* %28, align 8, !dbg !119, !tbaa !62
  br label %29, !dbg !120

29:                                               ; preds = %24, %20
  %30 = add nuw nsw i64 %21, 1, !dbg !121
  call void @llvm.dbg.value(metadata i64 %30, metadata !97, metadata !DIExpression()), !dbg !108
  %31 = icmp eq i64 %30, 8, !dbg !122
  br i1 %31, label %32, label %20, !dbg !109, !llvm.loop !123

32:                                               ; preds = %29
  %33 = add nuw nsw i64 %12, 1, !dbg !125
  call void @llvm.dbg.value(metadata i64 %33, metadata !93, metadata !DIExpression()), !dbg !107
  %34 = icmp eq i64 %33, 8, !dbg !126
  br i1 %34, label %35, label %11, !dbg !127, !llvm.loop !128

35:                                               ; preds = %32, %48
  %36 = add i64 %18, 8, !dbg !130
  call void @llvm.dbg.value(metadata i64 %36, metadata !89, metadata !DIExpression()), !dbg !106
  %37 = icmp ult i64 %36, %0, !dbg !131
  br i1 %37, label %17, label %64, !dbg !105, !llvm.loop !132

38:                                               ; preds = %17, %48
  %39 = phi i64 [ %50, %48 ], [ 0, %17 ]
  call void @llvm.dbg.value(metadata i64 %39, metadata !93, metadata !DIExpression()), !dbg !107
  %40 = add nuw nsw i64 %39, %10
  call void @llvm.dbg.value(metadata i64 0, metadata !97, metadata !DIExpression()), !dbg !108
  %41 = mul nsw i64 %40, %0
  %42 = getelementptr inbounds double, double* %2, i64 %41
  %43 = getelementptr inbounds double, double* %42, i64 %40
  %44 = mul nsw i64 %40, %1
  %45 = getelementptr inbounds double, double* %3, i64 %44
  %46 = getelementptr inbounds double, double* %45, i64 %40
  %47 = getelementptr inbounds double, double* %3, i64 %40
  br label %52, !dbg !109

48:                                               ; preds = %61
  %49 = load double, double* %43, align 8, !dbg !134, !tbaa !62
  store double %49, double* %46, align 8, !dbg !137, !tbaa !62
  call void @llvm.dbg.value(metadata i64 %63, metadata !97, metadata !DIExpression()), !dbg !108
  %50 = add nuw nsw i64 %39, 1, !dbg !125
  call void @llvm.dbg.value(metadata i64 %50, metadata !93, metadata !DIExpression()), !dbg !107
  %51 = icmp eq i64 %50, 8, !dbg !126
  br i1 %51, label %35, label %38, !dbg !127, !llvm.loop !128

52:                                               ; preds = %61, %38
  %53 = phi i64 [ 0, %38 ], [ %63, %61 ]
  call void @llvm.dbg.value(metadata i64 %53, metadata !97, metadata !DIExpression()), !dbg !108
  %54 = add nuw nsw i64 %53, %10, !dbg !110
  %55 = icmp eq i64 %39, %53, !dbg !114
  br i1 %55, label %61, label %56, !dbg !115

56:                                               ; preds = %52
  %57 = getelementptr inbounds double, double* %42, i64 %54, !dbg !116
  %58 = load double, double* %57, align 8, !dbg !116, !tbaa !62
  %59 = mul nsw i64 %54, %1, !dbg !118
  %60 = getelementptr inbounds double, double* %47, i64 %59, !dbg !118
  store double %58, double* %60, align 8, !dbg !119, !tbaa !62
  br label %61, !dbg !120

61:                                               ; preds = %56, %52
  %62 = icmp eq i64 %53, 7
  %63 = add nuw nsw i64 %53, 1, !dbg !121
  call void @llvm.dbg.value(metadata i64 %63, metadata !97, metadata !DIExpression()), !dbg !108
  br i1 %62, label %48, label %52, !dbg !138

64:                                               ; preds = %35
  %65 = add i64 %10, 8, !dbg !139
  call void @llvm.dbg.value(metadata i64 %65, metadata !87, metadata !DIExpression()), !dbg !102
  %66 = icmp ult i64 %65, %1, !dbg !103
  br i1 %66, label %9, label %71, !dbg !104, !llvm.loop !140

67:                                               ; preds = %7, %67
  %68 = phi i64 [ %69, %67 ], [ 0, %7 ]
  call void @llvm.dbg.value(metadata i64 %68, metadata !87, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.value(metadata i64 0, metadata !89, metadata !DIExpression()), !dbg !106
  %69 = add i64 %68, 8, !dbg !139
  call void @llvm.dbg.value(metadata i64 %69, metadata !87, metadata !DIExpression()), !dbg !102
  %70 = icmp ult i64 %69, %1, !dbg !103
  br i1 %70, label %67, label %71, !dbg !104, !llvm.loop !140

71:                                               ; preds = %64, %67, %5
  ret void, !dbg !142
}

; Function Attrs: nounwind uwtable
define dso_local void @registerFunctions() local_unnamed_addr #1 !dbg !143 {
  tail call void @registerTransFunction(void (i64, i64, double*, double*, double*)* noundef nonnull @transpose_submit, i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)) #4, !dbg !147
  tail call void @registerTransFunction(void (i64, i64, double*, double*, double*)* noundef nonnull @trans_basic, i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)) #4, !dbg !148
  tail call void @registerTransFunction(void (i64, i64, double*, double*, double*)* noundef nonnull @trans_tmp, i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)) #4, !dbg !149
  tail call void @registerTransFunction(void (i64, i64, double*, double*, double*)* noundef nonnull @transpose_1024x1024, i8* noundef getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0)) #4, !dbg !150
  tail call void @registerTransFunction(void (i64, i64, double*, double*, double*)* noundef nonnull @transpose_32x32, i8* noundef getelementptr inbounds ([29 x i8], [29 x i8]* @.str.4, i64 0, i64 0)) #4, !dbg !151
  ret void, !dbg !152
}

declare !dbg !153 void @registerTransFunction(void (i64, i64, double*, double*, double*)* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: nofree norecurse nosync nounwind uwtable
define internal void @transpose_submit(i64 noundef %0, i64 noundef %1, double* nocapture noundef readonly %2, double* nocapture noundef writeonly %3, double* nocapture noundef writeonly %4) #0 !dbg !161 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !163, metadata !DIExpression()), !dbg !168
  call void @llvm.dbg.value(metadata i64 %1, metadata !164, metadata !DIExpression()), !dbg !168
  call void @llvm.dbg.value(metadata double* %2, metadata !165, metadata !DIExpression()), !dbg !168
  call void @llvm.dbg.value(metadata double* %3, metadata !166, metadata !DIExpression()), !dbg !168
  call void @llvm.dbg.value(metadata double* %4, metadata !167, metadata !DIExpression()), !dbg !168
  %6 = icmp eq i64 %0, 32, !dbg !169
  %7 = icmp eq i64 %1, 32
  %8 = and i1 %6, %7, !dbg !171
  br i1 %8, label %9, label %66, !dbg !171

9:                                                ; preds = %5, %63
  %10 = phi i64 [ %64, %63 ], [ 0, %5 ]
  call void @llvm.dbg.value(metadata i64 %10, metadata !87, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.value(metadata i64 0, metadata !89, metadata !DIExpression()), !dbg !175
  br label %17, !dbg !176

11:                                               ; preds = %17, %32
  %12 = phi i64 [ %33, %32 ], [ 0, %17 ]
  call void @llvm.dbg.value(metadata i64 %12, metadata !93, metadata !DIExpression()), !dbg !177
  %13 = add nuw nsw i64 %12, %10
  call void @llvm.dbg.value(metadata i64 0, metadata !97, metadata !DIExpression()), !dbg !178
  %14 = shl nsw i64 %13, 5
  %15 = getelementptr inbounds double, double* %2, i64 %14
  %16 = getelementptr inbounds double, double* %3, i64 %13
  br label %20, !dbg !179

17:                                               ; preds = %35, %9
  %18 = phi i64 [ 0, %9 ], [ %36, %35 ]
  call void @llvm.dbg.value(metadata i64 %18, metadata !89, metadata !DIExpression()), !dbg !175
  %19 = icmp eq i64 %10, %18
  call void @llvm.dbg.value(metadata i64 0, metadata !93, metadata !DIExpression()), !dbg !177
  br i1 %19, label %38, label %11

20:                                               ; preds = %29, %11
  %21 = phi i64 [ 0, %11 ], [ %30, %29 ]
  call void @llvm.dbg.value(metadata i64 %21, metadata !97, metadata !DIExpression()), !dbg !178
  %22 = add nuw nsw i64 %21, %18, !dbg !180
  %23 = icmp eq i64 %13, %22, !dbg !181
  br i1 %23, label %29, label %24, !dbg !182

24:                                               ; preds = %20
  %25 = getelementptr inbounds double, double* %15, i64 %22, !dbg !183
  %26 = load double, double* %25, align 8, !dbg !183, !tbaa !62
  %27 = shl nsw i64 %22, 5, !dbg !184
  %28 = getelementptr inbounds double, double* %16, i64 %27, !dbg !184
  store double %26, double* %28, align 8, !dbg !185, !tbaa !62
  br label %29, !dbg !186

29:                                               ; preds = %24, %20
  %30 = add nuw nsw i64 %21, 1, !dbg !187
  call void @llvm.dbg.value(metadata i64 %30, metadata !97, metadata !DIExpression()), !dbg !178
  %31 = icmp eq i64 %30, 8, !dbg !188
  br i1 %31, label %32, label %20, !dbg !179, !llvm.loop !189

32:                                               ; preds = %29
  %33 = add nuw nsw i64 %12, 1, !dbg !191
  call void @llvm.dbg.value(metadata i64 %33, metadata !93, metadata !DIExpression()), !dbg !177
  %34 = icmp eq i64 %33, 8, !dbg !192
  br i1 %34, label %35, label %11, !dbg !193, !llvm.loop !194

35:                                               ; preds = %32, %45
  %36 = add nuw nsw i64 %18, 8, !dbg !196
  call void @llvm.dbg.value(metadata i64 %36, metadata !89, metadata !DIExpression()), !dbg !175
  %37 = icmp ult i64 %18, 24, !dbg !197
  br i1 %37, label %17, label %63, !dbg !176, !llvm.loop !198

38:                                               ; preds = %17, %45
  %39 = phi i64 [ %49, %45 ], [ 0, %17 ]
  call void @llvm.dbg.value(metadata i64 %39, metadata !93, metadata !DIExpression()), !dbg !177
  %40 = add nuw nsw i64 %39, %10
  call void @llvm.dbg.value(metadata i64 0, metadata !97, metadata !DIExpression()), !dbg !178
  %41 = shl nsw i64 %40, 5
  %42 = getelementptr inbounds double, double* %2, i64 %41
  %43 = getelementptr inbounds double, double* %3, i64 %41
  %44 = getelementptr inbounds double, double* %3, i64 %40
  br label %51, !dbg !179

45:                                               ; preds = %60
  %46 = getelementptr inbounds double, double* %42, i64 %40
  %47 = getelementptr inbounds double, double* %43, i64 %40
  %48 = load double, double* %46, align 8, !dbg !200, !tbaa !62
  store double %48, double* %47, align 8, !dbg !201, !tbaa !62
  call void @llvm.dbg.value(metadata i64 %62, metadata !97, metadata !DIExpression()), !dbg !178
  %49 = add nuw nsw i64 %39, 1, !dbg !191
  call void @llvm.dbg.value(metadata i64 %49, metadata !93, metadata !DIExpression()), !dbg !177
  %50 = icmp eq i64 %49, 8, !dbg !192
  br i1 %50, label %35, label %38, !dbg !193, !llvm.loop !202

51:                                               ; preds = %60, %38
  %52 = phi i64 [ 0, %38 ], [ %62, %60 ]
  call void @llvm.dbg.value(metadata i64 %52, metadata !97, metadata !DIExpression()), !dbg !178
  %53 = add nuw nsw i64 %52, %10, !dbg !180
  %54 = icmp eq i64 %39, %52, !dbg !181
  br i1 %54, label %60, label %55, !dbg !182

55:                                               ; preds = %51
  %56 = getelementptr inbounds double, double* %42, i64 %53, !dbg !183
  %57 = load double, double* %56, align 8, !dbg !183, !tbaa !62
  %58 = shl nsw i64 %53, 5, !dbg !184
  %59 = getelementptr inbounds double, double* %44, i64 %58, !dbg !184
  store double %57, double* %59, align 8, !dbg !185, !tbaa !62
  br label %60, !dbg !186

60:                                               ; preds = %55, %51
  %61 = icmp eq i64 %52, 7
  %62 = add nuw nsw i64 %52, 1, !dbg !187
  call void @llvm.dbg.value(metadata i64 %62, metadata !97, metadata !DIExpression()), !dbg !178
  br i1 %61, label %45, label %51, !dbg !203

63:                                               ; preds = %35
  %64 = add nuw nsw i64 %10, 8, !dbg !204
  call void @llvm.dbg.value(metadata i64 %64, metadata !87, metadata !DIExpression()), !dbg !172
  %65 = icmp ult i64 %10, 24, !dbg !205
  br i1 %65, label %9, label %145, !dbg !206, !llvm.loop !207

66:                                               ; preds = %5
  %67 = icmp eq i64 %0, 1024, !dbg !209
  %68 = icmp eq i64 %1, 1024
  %69 = and i1 %67, %68, !dbg !211
  br i1 %69, label %70, label %100, !dbg !211

70:                                               ; preds = %66, %73
  %71 = phi i64 [ %76, %73 ], [ 8, %66 ]
  %72 = phi i64 [ %74, %73 ], [ 0, %66 ]
  call void @llvm.dbg.value(metadata i64 %72, metadata !28, metadata !DIExpression()), !dbg !212
  call void @llvm.dbg.value(metadata i64 0, metadata !30, metadata !DIExpression()), !dbg !215
  br label %77, !dbg !216

73:                                               ; preds = %80
  %74 = add nuw nsw i64 %72, 8
  call void @llvm.dbg.value(metadata i64 %74, metadata !28, metadata !DIExpression()), !dbg !212
  %75 = icmp ult i64 %72, 1016, !dbg !217
  %76 = add nuw nsw i64 %71, 8, !dbg !218
  br i1 %75, label %70, label %145, !dbg !218, !llvm.loop !219

77:                                               ; preds = %70, %80
  %78 = phi i64 [ 8, %70 ], [ %83, %80 ]
  %79 = phi i64 [ 0, %70 ], [ %81, %80 ]
  call void @llvm.dbg.value(metadata i64 %79, metadata !30, metadata !DIExpression()), !dbg !215
  call void @llvm.dbg.value(metadata i64 %72, metadata !34, metadata !DIExpression()), !dbg !221
  br label %84, !dbg !222

80:                                               ; preds = %97
  %81 = add nuw nsw i64 %79, 8
  call void @llvm.dbg.value(metadata i64 %81, metadata !30, metadata !DIExpression()), !dbg !215
  %82 = icmp ult i64 %79, 1016, !dbg !223
  %83 = add nuw nsw i64 %78, 8, !dbg !224
  br i1 %82, label %77, label %73, !dbg !224, !llvm.loop !225

84:                                               ; preds = %77, %97
  %85 = phi i64 [ %98, %97 ], [ %72, %77 ]
  call void @llvm.dbg.value(metadata i64 %85, metadata !34, metadata !DIExpression()), !dbg !221
  call void @llvm.dbg.value(metadata i64 %79, metadata !38, metadata !DIExpression()), !dbg !227
  %86 = shl nsw i64 %85, 10
  %87 = getelementptr inbounds double, double* %2, i64 %86
  %88 = getelementptr inbounds double, double* %3, i64 %85
  br label %89, !dbg !222

89:                                               ; preds = %89, %84
  %90 = phi i64 [ %79, %84 ], [ %95, %89 ]
  call void @llvm.dbg.value(metadata i64 %90, metadata !38, metadata !DIExpression()), !dbg !227
  %91 = getelementptr inbounds double, double* %87, i64 %90, !dbg !228
  %92 = load double, double* %91, align 8, !dbg !228, !tbaa !62
  %93 = shl nsw i64 %90, 10, !dbg !229
  %94 = getelementptr inbounds double, double* %88, i64 %93, !dbg !229
  store double %92, double* %94, align 8, !dbg !230, !tbaa !62
  %95 = add nuw nsw i64 %90, 1, !dbg !231
  call void @llvm.dbg.value(metadata i64 %95, metadata !38, metadata !DIExpression()), !dbg !227
  %96 = icmp eq i64 %95, %78, !dbg !232
  br i1 %96, label %97, label %89, !dbg !222, !llvm.loop !233

97:                                               ; preds = %89
  %98 = add nuw nsw i64 %85, 1, !dbg !235
  call void @llvm.dbg.value(metadata i64 %98, metadata !34, metadata !DIExpression()), !dbg !221
  %99 = icmp eq i64 %98, %71, !dbg !236
  br i1 %99, label %80, label %84, !dbg !216, !llvm.loop !237

100:                                              ; preds = %66
  %101 = icmp eq i64 %0, %1, !dbg !239
  br i1 %101, label %102, label %120, !dbg !241

102:                                              ; preds = %100
  call void @llvm.dbg.value(metadata i64 %0, metadata !242, metadata !DIExpression()), !dbg !255
  call void @llvm.dbg.value(metadata i64 %1, metadata !245, metadata !DIExpression()), !dbg !255
  call void @llvm.dbg.value(metadata double* %2, metadata !246, metadata !DIExpression()), !dbg !255
  call void @llvm.dbg.value(metadata double* %3, metadata !247, metadata !DIExpression()), !dbg !255
  call void @llvm.dbg.value(metadata double* %4, metadata !248, metadata !DIExpression()), !dbg !255
  call void @llvm.dbg.value(metadata i64 0, metadata !249, metadata !DIExpression()), !dbg !257
  %103 = icmp eq i64 %0, 0, !dbg !258
  br i1 %103, label %145, label %104, !dbg !259

104:                                              ; preds = %102, %117
  %105 = phi i64 [ %118, %117 ], [ 0, %102 ]
  call void @llvm.dbg.value(metadata i64 %105, metadata !249, metadata !DIExpression()), !dbg !257
  call void @llvm.dbg.value(metadata i64 0, metadata !251, metadata !DIExpression()), !dbg !260
  %106 = mul nsw i64 %105, %0
  %107 = getelementptr inbounds double, double* %2, i64 %106
  %108 = getelementptr inbounds double, double* %3, i64 %105
  br label %109, !dbg !261

109:                                              ; preds = %109, %104
  %110 = phi i64 [ 0, %104 ], [ %115, %109 ]
  call void @llvm.dbg.value(metadata i64 %110, metadata !251, metadata !DIExpression()), !dbg !260
  %111 = getelementptr inbounds double, double* %107, i64 %110, !dbg !262
  %112 = load double, double* %111, align 8, !dbg !262, !tbaa !62
  %113 = mul nsw i64 %110, %0, !dbg !265
  %114 = getelementptr inbounds double, double* %108, i64 %113, !dbg !265
  store double %112, double* %114, align 8, !dbg !266, !tbaa !62
  %115 = add nuw i64 %110, 1, !dbg !267
  call void @llvm.dbg.value(metadata i64 %115, metadata !251, metadata !DIExpression()), !dbg !260
  %116 = icmp eq i64 %115, %0, !dbg !268
  br i1 %116, label %117, label %109, !dbg !261, !llvm.loop !269

117:                                              ; preds = %109
  %118 = add nuw i64 %105, 1, !dbg !271
  call void @llvm.dbg.value(metadata i64 %118, metadata !249, metadata !DIExpression()), !dbg !257
  %119 = icmp eq i64 %118, %0, !dbg !258
  br i1 %119, label %145, label %104, !dbg !259, !llvm.loop !272

120:                                              ; preds = %100
  call void @llvm.dbg.value(metadata i64 %0, metadata !274, metadata !DIExpression()), !dbg !291
  call void @llvm.dbg.value(metadata i64 %1, metadata !277, metadata !DIExpression()), !dbg !291
  call void @llvm.dbg.value(metadata double* %2, metadata !278, metadata !DIExpression()), !dbg !291
  call void @llvm.dbg.value(metadata double* %3, metadata !279, metadata !DIExpression()), !dbg !291
  call void @llvm.dbg.value(metadata double* %4, metadata !280, metadata !DIExpression()), !dbg !291
  call void @llvm.dbg.value(metadata i64 0, metadata !281, metadata !DIExpression()), !dbg !293
  %121 = icmp eq i64 %1, 0, !dbg !294
  %122 = icmp eq i64 %0, 0
  %123 = or i1 %122, %121, !dbg !295
  br i1 %123, label %145, label %124, !dbg !295

124:                                              ; preds = %120, %142
  %125 = phi i64 [ %143, %142 ], [ 0, %120 ]
  call void @llvm.dbg.value(metadata i64 %125, metadata !281, metadata !DIExpression()), !dbg !293
  call void @llvm.dbg.value(metadata i64 0, metadata !283, metadata !DIExpression()), !dbg !296
  %126 = mul nsw i64 %125, %0
  %127 = getelementptr inbounds double, double* %2, i64 %126
  %128 = shl i64 %125, 1
  %129 = and i64 %128, 2
  %130 = getelementptr inbounds double, double* %3, i64 %125
  br label %131, !dbg !297

131:                                              ; preds = %131, %124
  %132 = phi i64 [ 0, %124 ], [ %140, %131 ]
  call void @llvm.dbg.value(metadata i64 %132, metadata !283, metadata !DIExpression()), !dbg !296
  call void @llvm.dbg.value(metadata i64 %125, metadata !287, metadata !DIExpression(DW_OP_constu, 1, DW_OP_and, DW_OP_stack_value)), !dbg !298
  %133 = and i64 %132, 1, !dbg !299
  call void @llvm.dbg.value(metadata i64 %133, metadata !290, metadata !DIExpression()), !dbg !298
  %134 = getelementptr inbounds double, double* %127, i64 %132, !dbg !300
  %135 = load double, double* %134, align 8, !dbg !300, !tbaa !62
  %136 = or i64 %133, %129, !dbg !301
  %137 = getelementptr inbounds double, double* %4, i64 %136, !dbg !302
  store double %135, double* %137, align 8, !dbg !303, !tbaa !62
  %138 = mul nsw i64 %132, %1, !dbg !304
  %139 = getelementptr inbounds double, double* %130, i64 %138, !dbg !304
  store double %135, double* %139, align 8, !dbg !305, !tbaa !62
  %140 = add nuw i64 %132, 1, !dbg !306
  call void @llvm.dbg.value(metadata i64 %140, metadata !283, metadata !DIExpression()), !dbg !296
  %141 = icmp eq i64 %140, %0, !dbg !307
  br i1 %141, label %142, label %131, !dbg !297, !llvm.loop !308

142:                                              ; preds = %131
  %143 = add nuw i64 %125, 1, !dbg !310
  call void @llvm.dbg.value(metadata i64 %143, metadata !281, metadata !DIExpression()), !dbg !293
  %144 = icmp eq i64 %143, %1, !dbg !294
  br i1 %144, label %145, label %124, !dbg !295, !llvm.loop !311

145:                                              ; preds = %142, %117, %73, %63, %120, %102
  ret void, !dbg !313
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define internal void @trans_basic(i64 noundef %0, i64 noundef %1, double* nocapture noundef readonly %2, double* nocapture noundef writeonly %3, double* nocapture noundef readnone %4) #0 !dbg !243 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !242, metadata !DIExpression()), !dbg !314
  call void @llvm.dbg.value(metadata i64 %1, metadata !245, metadata !DIExpression()), !dbg !314
  call void @llvm.dbg.value(metadata double* %2, metadata !246, metadata !DIExpression()), !dbg !314
  call void @llvm.dbg.value(metadata double* %3, metadata !247, metadata !DIExpression()), !dbg !314
  call void @llvm.dbg.value(metadata double* %4, metadata !248, metadata !DIExpression()), !dbg !314
  call void @llvm.dbg.value(metadata i64 0, metadata !249, metadata !DIExpression()), !dbg !315
  %6 = icmp eq i64 %1, 0, !dbg !316
  %7 = icmp eq i64 %0, 0
  %8 = or i1 %6, %7, !dbg !317
  br i1 %8, label %55, label %9, !dbg !317

9:                                                ; preds = %5
  %10 = icmp ugt i64 %0, 1
  %11 = icmp eq i64 %1, 1
  %12 = and i1 %10, %11
  %13 = and i64 %0, -2
  %14 = icmp eq i64 %13, %0
  br label %15, !dbg !317

15:                                               ; preds = %9, %52
  %16 = phi i64 [ %53, %52 ], [ 0, %9 ]
  call void @llvm.dbg.value(metadata i64 %16, metadata !249, metadata !DIExpression()), !dbg !315
  call void @llvm.dbg.value(metadata i64 0, metadata !251, metadata !DIExpression()), !dbg !318
  %17 = mul i64 %16, %0
  %18 = mul nsw i64 %16, %0
  %19 = getelementptr inbounds double, double* %2, i64 %18
  %20 = getelementptr inbounds double, double* %3, i64 %16
  br i1 %12, label %21, label %42, !dbg !319

21:                                               ; preds = %15
  %22 = add i64 %17, %0
  %23 = getelementptr double, double* %2, i64 %22
  %24 = getelementptr double, double* %2, i64 %17
  %25 = add i64 %16, %0
  %26 = getelementptr double, double* %3, i64 %25
  %27 = getelementptr double, double* %3, i64 %16
  %28 = icmp ult double* %27, %23, !dbg !319
  %29 = icmp ult double* %24, %26, !dbg !319
  %30 = and i1 %28, %29, !dbg !319
  br i1 %30, label %42, label %31

31:                                               ; preds = %21, %31
  %32 = phi i64 [ %39, %31 ], [ 0, %21 ], !dbg !320
  %33 = getelementptr inbounds double, double* %19, i64 %32, !dbg !320
  %34 = bitcast double* %33 to <2 x double>*, !dbg !321
  %35 = load <2 x double>, <2 x double>* %34, align 8, !dbg !321, !tbaa !62, !alias.scope !322
  %36 = mul nsw i64 %32, %1, !dbg !320
  %37 = getelementptr inbounds double, double* %20, i64 %36, !dbg !320
  %38 = bitcast double* %37 to <2 x double>*, !dbg !325
  store <2 x double> %35, <2 x double>* %38, align 8, !dbg !325, !tbaa !62, !alias.scope !326, !noalias !322
  %39 = add nuw i64 %32, 2, !dbg !320
  %40 = icmp eq i64 %39, %13, !dbg !320
  br i1 %40, label %41, label %31, !dbg !320, !llvm.loop !328

41:                                               ; preds = %31
  br i1 %14, label %52, label %42, !dbg !319

42:                                               ; preds = %21, %15, %41
  %43 = phi i64 [ 0, %21 ], [ 0, %15 ], [ %13, %41 ]
  br label %44, !dbg !319

44:                                               ; preds = %42, %44
  %45 = phi i64 [ %50, %44 ], [ %43, %42 ]
  call void @llvm.dbg.value(metadata i64 %45, metadata !251, metadata !DIExpression()), !dbg !318
  %46 = getelementptr inbounds double, double* %19, i64 %45, !dbg !321
  %47 = load double, double* %46, align 8, !dbg !321, !tbaa !62
  %48 = mul nsw i64 %45, %1, !dbg !331
  %49 = getelementptr inbounds double, double* %20, i64 %48, !dbg !331
  store double %47, double* %49, align 8, !dbg !325, !tbaa !62
  %50 = add nuw i64 %45, 1, !dbg !320
  call void @llvm.dbg.value(metadata i64 %50, metadata !251, metadata !DIExpression()), !dbg !318
  %51 = icmp eq i64 %50, %0, !dbg !332
  br i1 %51, label %52, label %44, !dbg !319, !llvm.loop !333

52:                                               ; preds = %44, %41
  %53 = add nuw i64 %16, 1, !dbg !334
  call void @llvm.dbg.value(metadata i64 %53, metadata !249, metadata !DIExpression()), !dbg !315
  %54 = icmp eq i64 %53, %1, !dbg !316
  br i1 %54, label %55, label %15, !dbg !317, !llvm.loop !335

55:                                               ; preds = %52, %5
  ret void, !dbg !337
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define internal void @trans_tmp(i64 noundef %0, i64 noundef %1, double* nocapture noundef readonly %2, double* nocapture noundef writeonly %3, double* nocapture noundef writeonly %4) #0 !dbg !275 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !274, metadata !DIExpression()), !dbg !338
  call void @llvm.dbg.value(metadata i64 %1, metadata !277, metadata !DIExpression()), !dbg !338
  call void @llvm.dbg.value(metadata double* %2, metadata !278, metadata !DIExpression()), !dbg !338
  call void @llvm.dbg.value(metadata double* %3, metadata !279, metadata !DIExpression()), !dbg !338
  call void @llvm.dbg.value(metadata double* %4, metadata !280, metadata !DIExpression()), !dbg !338
  call void @llvm.dbg.value(metadata i64 0, metadata !281, metadata !DIExpression()), !dbg !339
  %6 = icmp eq i64 %1, 0, !dbg !340
  %7 = icmp eq i64 %0, 0
  %8 = or i1 %6, %7, !dbg !341
  br i1 %8, label %30, label %9, !dbg !341

9:                                                ; preds = %5, %27
  %10 = phi i64 [ %28, %27 ], [ 0, %5 ]
  call void @llvm.dbg.value(metadata i64 %10, metadata !281, metadata !DIExpression()), !dbg !339
  call void @llvm.dbg.value(metadata i64 0, metadata !283, metadata !DIExpression()), !dbg !342
  %11 = mul nsw i64 %10, %0
  %12 = getelementptr inbounds double, double* %2, i64 %11
  %13 = shl i64 %10, 1
  %14 = and i64 %13, 2
  %15 = getelementptr inbounds double, double* %3, i64 %10
  br label %16, !dbg !343

16:                                               ; preds = %9, %16
  %17 = phi i64 [ 0, %9 ], [ %25, %16 ]
  call void @llvm.dbg.value(metadata i64 %17, metadata !283, metadata !DIExpression()), !dbg !342
  call void @llvm.dbg.value(metadata i64 %10, metadata !287, metadata !DIExpression(DW_OP_constu, 1, DW_OP_and, DW_OP_stack_value)), !dbg !344
  %18 = and i64 %17, 1, !dbg !345
  call void @llvm.dbg.value(metadata i64 %18, metadata !290, metadata !DIExpression()), !dbg !344
  %19 = getelementptr inbounds double, double* %12, i64 %17, !dbg !346
  %20 = load double, double* %19, align 8, !dbg !346, !tbaa !62
  %21 = or i64 %18, %14, !dbg !347
  %22 = getelementptr inbounds double, double* %4, i64 %21, !dbg !348
  store double %20, double* %22, align 8, !dbg !349, !tbaa !62
  %23 = mul nsw i64 %17, %1, !dbg !350
  %24 = getelementptr inbounds double, double* %15, i64 %23, !dbg !350
  store double %20, double* %24, align 8, !dbg !351, !tbaa !62
  %25 = add nuw i64 %17, 1, !dbg !352
  call void @llvm.dbg.value(metadata i64 %25, metadata !283, metadata !DIExpression()), !dbg !342
  %26 = icmp eq i64 %25, %0, !dbg !353
  br i1 %26, label %27, label %16, !dbg !343, !llvm.loop !354

27:                                               ; preds = %16
  %28 = add nuw i64 %10, 1, !dbg !356
  call void @llvm.dbg.value(metadata i64 %28, metadata !281, metadata !DIExpression()), !dbg !339
  %29 = icmp eq i64 %28, %1, !dbg !340
  br i1 %29, label %30, label %9, !dbg !341, !llvm.loop !357

30:                                               ; preds = %27, %5
  ret void, !dbg !359
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #3

attributes #0 = { nofree norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "trans.c", directory: "/afs/andrew.cmu.edu/usr6/srikarg/private/18213/cache-lab-srikarg2006-1")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!9 = distinct !DISubprogram(name: "transpose_1024x1024", scope: !1, file: !1, line: 129, type: !10, scopeLine: 130, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !21)
!10 = !DISubroutineType(types: !11)
!11 = !{null, !12, !12, !15, !15, !20}
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !13, line: 46, baseType: !14)
!13 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "")
!14 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, elements: !18)
!17 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!18 = !{!19}
!19 = !DISubrange(count: -1)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!21 = !{!22, !23, !24, !25, !26, !27, !28, !30, !34, !38}
!22 = !DILocalVariable(name: "M", arg: 1, scope: !9, file: !1, line: 129, type: !12)
!23 = !DILocalVariable(name: "N", arg: 2, scope: !9, file: !1, line: 129, type: !12)
!24 = !DILocalVariable(name: "A", arg: 3, scope: !9, file: !1, line: 129, type: !15)
!25 = !DILocalVariable(name: "B", arg: 4, scope: !9, file: !1, line: 129, type: !15)
!26 = !DILocalVariable(name: "tmp", arg: 5, scope: !9, file: !1, line: 130, type: !20)
!27 = !DILocalVariable(name: "tile_size", scope: !9, file: !1, line: 131, type: !12)
!28 = !DILocalVariable(name: "i", scope: !29, file: !1, line: 133, type: !12)
!29 = distinct !DILexicalBlock(scope: !9, file: !1, line: 133, column: 5)
!30 = !DILocalVariable(name: "j", scope: !31, file: !1, line: 134, type: !12)
!31 = distinct !DILexicalBlock(scope: !32, file: !1, line: 134, column: 9)
!32 = distinct !DILexicalBlock(scope: !33, file: !1, line: 133, column: 47)
!33 = distinct !DILexicalBlock(scope: !29, file: !1, line: 133, column: 5)
!34 = !DILocalVariable(name: "x", scope: !35, file: !1, line: 135, type: !12)
!35 = distinct !DILexicalBlock(scope: !36, file: !1, line: 135, column: 13)
!36 = distinct !DILexicalBlock(scope: !37, file: !1, line: 134, column: 51)
!37 = distinct !DILexicalBlock(scope: !31, file: !1, line: 134, column: 9)
!38 = !DILocalVariable(name: "y", scope: !39, file: !1, line: 136, type: !12)
!39 = distinct !DILexicalBlock(scope: !40, file: !1, line: 136, column: 17)
!40 = distinct !DILexicalBlock(scope: !41, file: !1, line: 135, column: 56)
!41 = distinct !DILexicalBlock(scope: !35, file: !1, line: 135, column: 13)
!42 = !DILocation(line: 0, scope: !9)
!43 = !DILocation(line: 0, scope: !29)
!44 = !DILocation(line: 133, column: 26, scope: !33)
!45 = !DILocation(line: 133, column: 5, scope: !29)
!46 = !DILocation(line: 134, column: 9, scope: !31)
!47 = !DILocation(line: 0, scope: !31)
!48 = !DILocation(line: 135, column: 13, scope: !35)
!49 = !DILocation(line: 0, scope: !35)
!50 = !DILocation(line: 134, column: 37, scope: !37)
!51 = !DILocation(line: 134, column: 30, scope: !37)
!52 = distinct !{!52, !46, !53, !54}
!53 = !DILocation(line: 140, column: 9, scope: !31)
!54 = !{!"llvm.loop.unroll.disable"}
!55 = distinct !{!55, !45, !56, !54}
!56 = !DILocation(line: 141, column: 5, scope: !29)
!57 = !DILocation(line: 136, column: 17, scope: !39)
!58 = !DILocation(line: 0, scope: !39)
!59 = !DILocation(line: 137, column: 31, scope: !60)
!60 = distinct !DILexicalBlock(scope: !61, file: !1, line: 136, column: 60)
!61 = distinct !DILexicalBlock(scope: !39, file: !1, line: 136, column: 17)
!62 = !{!63, !63, i64 0}
!63 = !{!"double", !64, i64 0}
!64 = !{!"omnipotent char", !65, i64 0}
!65 = !{!"Simple C/C++ TBAA"}
!66 = !DILocation(line: 137, column: 21, scope: !60)
!67 = !DILocation(line: 137, column: 29, scope: !60)
!68 = !DILocation(line: 136, column: 56, scope: !61)
!69 = !DILocation(line: 136, column: 38, scope: !61)
!70 = distinct !{!70, !57, !71, !54}
!71 = !DILocation(line: 138, column: 17, scope: !39)
!72 = !DILocation(line: 135, column: 52, scope: !41)
!73 = !DILocation(line: 135, column: 34, scope: !41)
!74 = distinct !{!74, !48, !75, !54}
!75 = !DILocation(line: 139, column: 13, scope: !35)
!76 = !DILocation(line: 133, column: 33, scope: !33)
!77 = !DILocation(line: 142, column: 1, scope: !9)
!78 = distinct !DISubprogram(name: "transpose_32x32", scope: !1, file: !1, line: 166, type: !10, scopeLine: 167, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !79)
!79 = !{!80, !81, !82, !83, !84, !85, !86, !87, !89, !93, !97}
!80 = !DILocalVariable(name: "M", arg: 1, scope: !78, file: !1, line: 166, type: !12)
!81 = !DILocalVariable(name: "N", arg: 2, scope: !78, file: !1, line: 166, type: !12)
!82 = !DILocalVariable(name: "A", arg: 3, scope: !78, file: !1, line: 166, type: !15)
!83 = !DILocalVariable(name: "B", arg: 4, scope: !78, file: !1, line: 166, type: !15)
!84 = !DILocalVariable(name: "tmp", arg: 5, scope: !78, file: !1, line: 167, type: !20)
!85 = !DILocalVariable(name: "tile_size", scope: !78, file: !1, line: 169, type: !12)
!86 = !DILocalVariable(name: "offset", scope: !78, file: !1, line: 170, type: !12)
!87 = !DILocalVariable(name: "i", scope: !88, file: !1, line: 172, type: !12)
!88 = distinct !DILexicalBlock(scope: !78, file: !1, line: 172, column: 5)
!89 = !DILocalVariable(name: "j", scope: !90, file: !1, line: 173, type: !12)
!90 = distinct !DILexicalBlock(scope: !91, file: !1, line: 173, column: 9)
!91 = distinct !DILexicalBlock(scope: !92, file: !1, line: 172, column: 47)
!92 = distinct !DILexicalBlock(scope: !88, file: !1, line: 172, column: 5)
!93 = !DILocalVariable(name: "x", scope: !94, file: !1, line: 174, type: !12)
!94 = distinct !DILexicalBlock(scope: !95, file: !1, line: 174, column: 13)
!95 = distinct !DILexicalBlock(scope: !96, file: !1, line: 173, column: 51)
!96 = distinct !DILexicalBlock(scope: !90, file: !1, line: 173, column: 9)
!97 = !DILocalVariable(name: "y", scope: !98, file: !1, line: 175, type: !12)
!98 = distinct !DILexicalBlock(scope: !99, file: !1, line: 175, column: 17)
!99 = distinct !DILexicalBlock(scope: !100, file: !1, line: 174, column: 52)
!100 = distinct !DILexicalBlock(scope: !94, file: !1, line: 174, column: 13)
!101 = !DILocation(line: 0, scope: !78)
!102 = !DILocation(line: 0, scope: !88)
!103 = !DILocation(line: 172, column: 26, scope: !92)
!104 = !DILocation(line: 172, column: 5, scope: !88)
!105 = !DILocation(line: 173, column: 9, scope: !90)
!106 = !DILocation(line: 0, scope: !90)
!107 = !DILocation(line: 0, scope: !94)
!108 = !DILocation(line: 0, scope: !98)
!109 = !DILocation(line: 175, column: 17, scope: !98)
!110 = !DILocation(line: 176, column: 36, scope: !111)
!111 = distinct !DILexicalBlock(scope: !112, file: !1, line: 176, column: 25)
!112 = distinct !DILexicalBlock(scope: !113, file: !1, line: 175, column: 56)
!113 = distinct !DILexicalBlock(scope: !98, file: !1, line: 175, column: 17)
!114 = !DILocation(line: 176, column: 31, scope: !111)
!115 = !DILocation(line: 176, column: 25, scope: !112)
!116 = !DILocation(line: 177, column: 43, scope: !117)
!117 = distinct !DILexicalBlock(scope: !111, file: !1, line: 176, column: 41)
!118 = !DILocation(line: 177, column: 25, scope: !117)
!119 = !DILocation(line: 177, column: 41, scope: !117)
!120 = !DILocation(line: 178, column: 21, scope: !117)
!121 = !DILocation(line: 175, column: 52, scope: !113)
!122 = !DILocation(line: 175, column: 38, scope: !113)
!123 = distinct !{!123, !109, !124, !54}
!124 = !DILocation(line: 182, column: 17, scope: !98)
!125 = !DILocation(line: 174, column: 48, scope: !100)
!126 = !DILocation(line: 174, column: 34, scope: !100)
!127 = !DILocation(line: 174, column: 13, scope: !94)
!128 = distinct !{!128, !127, !129, !54}
!129 = !DILocation(line: 183, column: 13, scope: !94)
!130 = !DILocation(line: 173, column: 37, scope: !96)
!131 = !DILocation(line: 173, column: 30, scope: !96)
!132 = distinct !{!132, !105, !133, !54}
!133 = !DILocation(line: 184, column: 9, scope: !90)
!134 = !DILocation(line: 180, column: 43, scope: !135)
!135 = distinct !DILexicalBlock(scope: !136, file: !1, line: 179, column: 50)
!136 = distinct !DILexicalBlock(scope: !112, file: !1, line: 179, column: 25)
!137 = !DILocation(line: 180, column: 41, scope: !135)
!138 = !DILocation(line: 179, column: 32, scope: !136)
!139 = !DILocation(line: 172, column: 33, scope: !92)
!140 = distinct !{!140, !104, !141, !54}
!141 = !DILocation(line: 185, column: 5, scope: !88)
!142 = !DILocation(line: 186, column: 1, scope: !78)
!143 = distinct !DISubprogram(name: "registerFunctions", scope: !1, file: !1, line: 223, type: !144, scopeLine: 223, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !146)
!144 = !DISubroutineType(types: !145)
!145 = !{null}
!146 = !{}
!147 = !DILocation(line: 225, column: 5, scope: !143)
!148 = !DILocation(line: 228, column: 5, scope: !143)
!149 = !DILocation(line: 229, column: 5, scope: !143)
!150 = !DILocation(line: 230, column: 5, scope: !143)
!151 = !DILocation(line: 232, column: 5, scope: !143)
!152 = !DILocation(line: 233, column: 1, scope: !143)
!153 = !DISubprogram(name: "registerTransFunction", scope: !154, file: !154, line: 99, type: !155, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !146)
!154 = !DIFile(filename: "./cachelab.h", directory: "/afs/andrew.cmu.edu/usr6/srikarg/private/18213/cache-lab-srikarg2006-1")
!155 = !DISubroutineType(types: !156)
!156 = !{null, !157, !158}
!157 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!158 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !159, size: 64)
!159 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !160)
!160 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!161 = distinct !DISubprogram(name: "transpose_submit", scope: !1, file: !1, line: 195, type: !10, scopeLine: 196, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !162)
!162 = !{!163, !164, !165, !166, !167}
!163 = !DILocalVariable(name: "M", arg: 1, scope: !161, file: !1, line: 195, type: !12)
!164 = !DILocalVariable(name: "N", arg: 2, scope: !161, file: !1, line: 195, type: !12)
!165 = !DILocalVariable(name: "A", arg: 3, scope: !161, file: !1, line: 195, type: !15)
!166 = !DILocalVariable(name: "B", arg: 4, scope: !161, file: !1, line: 195, type: !15)
!167 = !DILocalVariable(name: "tmp", arg: 5, scope: !161, file: !1, line: 196, type: !20)
!168 = !DILocation(line: 0, scope: !161)
!169 = !DILocation(line: 198, column: 11, scope: !170)
!170 = distinct !DILexicalBlock(scope: !161, file: !1, line: 198, column: 9)
!171 = !DILocation(line: 198, column: 17, scope: !170)
!172 = !DILocation(line: 0, scope: !88, inlinedAt: !173)
!173 = distinct !DILocation(line: 199, column: 9, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !1, line: 198, column: 29)
!175 = !DILocation(line: 0, scope: !90, inlinedAt: !173)
!176 = !DILocation(line: 173, column: 9, scope: !90, inlinedAt: !173)
!177 = !DILocation(line: 0, scope: !94, inlinedAt: !173)
!178 = !DILocation(line: 0, scope: !98, inlinedAt: !173)
!179 = !DILocation(line: 175, column: 17, scope: !98, inlinedAt: !173)
!180 = !DILocation(line: 176, column: 36, scope: !111, inlinedAt: !173)
!181 = !DILocation(line: 176, column: 31, scope: !111, inlinedAt: !173)
!182 = !DILocation(line: 176, column: 25, scope: !112, inlinedAt: !173)
!183 = !DILocation(line: 177, column: 43, scope: !117, inlinedAt: !173)
!184 = !DILocation(line: 177, column: 25, scope: !117, inlinedAt: !173)
!185 = !DILocation(line: 177, column: 41, scope: !117, inlinedAt: !173)
!186 = !DILocation(line: 178, column: 21, scope: !117, inlinedAt: !173)
!187 = !DILocation(line: 175, column: 52, scope: !113, inlinedAt: !173)
!188 = !DILocation(line: 175, column: 38, scope: !113, inlinedAt: !173)
!189 = distinct !{!189, !179, !190, !54}
!190 = !DILocation(line: 182, column: 17, scope: !98, inlinedAt: !173)
!191 = !DILocation(line: 174, column: 48, scope: !100, inlinedAt: !173)
!192 = !DILocation(line: 174, column: 34, scope: !100, inlinedAt: !173)
!193 = !DILocation(line: 174, column: 13, scope: !94, inlinedAt: !173)
!194 = distinct !{!194, !193, !195, !54}
!195 = !DILocation(line: 183, column: 13, scope: !94, inlinedAt: !173)
!196 = !DILocation(line: 173, column: 37, scope: !96, inlinedAt: !173)
!197 = !DILocation(line: 173, column: 30, scope: !96, inlinedAt: !173)
!198 = distinct !{!198, !176, !199, !54}
!199 = !DILocation(line: 184, column: 9, scope: !90, inlinedAt: !173)
!200 = !DILocation(line: 180, column: 43, scope: !135, inlinedAt: !173)
!201 = !DILocation(line: 180, column: 41, scope: !135, inlinedAt: !173)
!202 = distinct !{!202, !193, !195, !54}
!203 = !DILocation(line: 179, column: 32, scope: !136, inlinedAt: !173)
!204 = !DILocation(line: 172, column: 33, scope: !92, inlinedAt: !173)
!205 = !DILocation(line: 172, column: 26, scope: !92, inlinedAt: !173)
!206 = !DILocation(line: 172, column: 5, scope: !88, inlinedAt: !173)
!207 = distinct !{!207, !206, !208, !54}
!208 = !DILocation(line: 185, column: 5, scope: !88, inlinedAt: !173)
!209 = !DILocation(line: 203, column: 11, scope: !210)
!210 = distinct !DILexicalBlock(scope: !161, file: !1, line: 203, column: 9)
!211 = !DILocation(line: 203, column: 19, scope: !210)
!212 = !DILocation(line: 0, scope: !29, inlinedAt: !213)
!213 = distinct !DILocation(line: 204, column: 9, scope: !214)
!214 = distinct !DILexicalBlock(scope: !210, file: !1, line: 203, column: 33)
!215 = !DILocation(line: 0, scope: !31, inlinedAt: !213)
!216 = !DILocation(line: 135, column: 13, scope: !35, inlinedAt: !213)
!217 = !DILocation(line: 133, column: 26, scope: !33, inlinedAt: !213)
!218 = !DILocation(line: 133, column: 5, scope: !29, inlinedAt: !213)
!219 = distinct !{!219, !218, !220, !54}
!220 = !DILocation(line: 141, column: 5, scope: !29, inlinedAt: !213)
!221 = !DILocation(line: 0, scope: !35, inlinedAt: !213)
!222 = !DILocation(line: 136, column: 17, scope: !39, inlinedAt: !213)
!223 = !DILocation(line: 134, column: 30, scope: !37, inlinedAt: !213)
!224 = !DILocation(line: 134, column: 9, scope: !31, inlinedAt: !213)
!225 = distinct !{!225, !224, !226, !54}
!226 = !DILocation(line: 140, column: 9, scope: !31, inlinedAt: !213)
!227 = !DILocation(line: 0, scope: !39, inlinedAt: !213)
!228 = !DILocation(line: 137, column: 31, scope: !60, inlinedAt: !213)
!229 = !DILocation(line: 137, column: 21, scope: !60, inlinedAt: !213)
!230 = !DILocation(line: 137, column: 29, scope: !60, inlinedAt: !213)
!231 = !DILocation(line: 136, column: 56, scope: !61, inlinedAt: !213)
!232 = !DILocation(line: 136, column: 38, scope: !61, inlinedAt: !213)
!233 = distinct !{!233, !222, !234, !54}
!234 = !DILocation(line: 138, column: 17, scope: !39, inlinedAt: !213)
!235 = !DILocation(line: 135, column: 52, scope: !41, inlinedAt: !213)
!236 = !DILocation(line: 135, column: 34, scope: !41, inlinedAt: !213)
!237 = distinct !{!237, !216, !238, !54}
!238 = !DILocation(line: 139, column: 13, scope: !35, inlinedAt: !213)
!239 = !DILocation(line: 208, column: 11, scope: !240)
!240 = distinct !DILexicalBlock(scope: !161, file: !1, line: 208, column: 9)
!241 = !DILocation(line: 208, column: 9, scope: !161)
!242 = !DILocalVariable(name: "M", arg: 1, scope: !243, file: !1, line: 81, type: !12)
!243 = distinct !DISubprogram(name: "trans_basic", scope: !1, file: !1, line: 81, type: !10, scopeLine: 82, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !244)
!244 = !{!242, !245, !246, !247, !248, !249, !251}
!245 = !DILocalVariable(name: "N", arg: 2, scope: !243, file: !1, line: 81, type: !12)
!246 = !DILocalVariable(name: "A", arg: 3, scope: !243, file: !1, line: 81, type: !15)
!247 = !DILocalVariable(name: "B", arg: 4, scope: !243, file: !1, line: 81, type: !15)
!248 = !DILocalVariable(name: "tmp", arg: 5, scope: !243, file: !1, line: 82, type: !20)
!249 = !DILocalVariable(name: "i", scope: !250, file: !1, line: 86, type: !12)
!250 = distinct !DILexicalBlock(scope: !243, file: !1, line: 86, column: 5)
!251 = !DILocalVariable(name: "j", scope: !252, file: !1, line: 87, type: !12)
!252 = distinct !DILexicalBlock(scope: !253, file: !1, line: 87, column: 9)
!253 = distinct !DILexicalBlock(scope: !254, file: !1, line: 86, column: 36)
!254 = distinct !DILexicalBlock(scope: !250, file: !1, line: 86, column: 5)
!255 = !DILocation(line: 0, scope: !243, inlinedAt: !256)
!256 = distinct !DILocation(line: 209, column: 9, scope: !240)
!257 = !DILocation(line: 0, scope: !250, inlinedAt: !256)
!258 = !DILocation(line: 86, column: 26, scope: !254, inlinedAt: !256)
!259 = !DILocation(line: 86, column: 5, scope: !250, inlinedAt: !256)
!260 = !DILocation(line: 0, scope: !252, inlinedAt: !256)
!261 = !DILocation(line: 87, column: 9, scope: !252, inlinedAt: !256)
!262 = !DILocation(line: 88, column: 23, scope: !263, inlinedAt: !256)
!263 = distinct !DILexicalBlock(scope: !264, file: !1, line: 87, column: 40)
!264 = distinct !DILexicalBlock(scope: !252, file: !1, line: 87, column: 9)
!265 = !DILocation(line: 88, column: 13, scope: !263, inlinedAt: !256)
!266 = !DILocation(line: 88, column: 21, scope: !263, inlinedAt: !256)
!267 = !DILocation(line: 87, column: 36, scope: !264, inlinedAt: !256)
!268 = !DILocation(line: 87, column: 30, scope: !264, inlinedAt: !256)
!269 = distinct !{!269, !261, !270, !54}
!270 = !DILocation(line: 89, column: 9, scope: !252, inlinedAt: !256)
!271 = !DILocation(line: 86, column: 32, scope: !254, inlinedAt: !256)
!272 = distinct !{!272, !259, !273, !54}
!273 = !DILocation(line: 90, column: 5, scope: !250, inlinedAt: !256)
!274 = !DILocalVariable(name: "M", arg: 1, scope: !275, file: !1, line: 101, type: !12)
!275 = distinct !DISubprogram(name: "trans_tmp", scope: !1, file: !1, line: 101, type: !10, scopeLine: 102, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !276)
!276 = !{!274, !277, !278, !279, !280, !281, !283, !287, !290}
!277 = !DILocalVariable(name: "N", arg: 2, scope: !275, file: !1, line: 101, type: !12)
!278 = !DILocalVariable(name: "A", arg: 3, scope: !275, file: !1, line: 101, type: !15)
!279 = !DILocalVariable(name: "B", arg: 4, scope: !275, file: !1, line: 101, type: !15)
!280 = !DILocalVariable(name: "tmp", arg: 5, scope: !275, file: !1, line: 102, type: !20)
!281 = !DILocalVariable(name: "i", scope: !282, file: !1, line: 106, type: !12)
!282 = distinct !DILexicalBlock(scope: !275, file: !1, line: 106, column: 5)
!283 = !DILocalVariable(name: "j", scope: !284, file: !1, line: 107, type: !12)
!284 = distinct !DILexicalBlock(scope: !285, file: !1, line: 107, column: 9)
!285 = distinct !DILexicalBlock(scope: !286, file: !1, line: 106, column: 36)
!286 = distinct !DILexicalBlock(scope: !282, file: !1, line: 106, column: 5)
!287 = !DILocalVariable(name: "di", scope: !288, file: !1, line: 108, type: !12)
!288 = distinct !DILexicalBlock(scope: !289, file: !1, line: 107, column: 40)
!289 = distinct !DILexicalBlock(scope: !284, file: !1, line: 107, column: 9)
!290 = !DILocalVariable(name: "dj", scope: !288, file: !1, line: 109, type: !12)
!291 = !DILocation(line: 0, scope: !275, inlinedAt: !292)
!292 = distinct !DILocation(line: 211, column: 9, scope: !240)
!293 = !DILocation(line: 0, scope: !282, inlinedAt: !292)
!294 = !DILocation(line: 106, column: 26, scope: !286, inlinedAt: !292)
!295 = !DILocation(line: 106, column: 5, scope: !282, inlinedAt: !292)
!296 = !DILocation(line: 0, scope: !284, inlinedAt: !292)
!297 = !DILocation(line: 107, column: 9, scope: !284, inlinedAt: !292)
!298 = !DILocation(line: 0, scope: !288, inlinedAt: !292)
!299 = !DILocation(line: 109, column: 27, scope: !288, inlinedAt: !292)
!300 = !DILocation(line: 110, column: 32, scope: !288, inlinedAt: !292)
!301 = !DILocation(line: 110, column: 24, scope: !288, inlinedAt: !292)
!302 = !DILocation(line: 110, column: 13, scope: !288, inlinedAt: !292)
!303 = !DILocation(line: 110, column: 30, scope: !288, inlinedAt: !292)
!304 = !DILocation(line: 111, column: 13, scope: !288, inlinedAt: !292)
!305 = !DILocation(line: 111, column: 21, scope: !288, inlinedAt: !292)
!306 = !DILocation(line: 107, column: 36, scope: !289, inlinedAt: !292)
!307 = !DILocation(line: 107, column: 30, scope: !289, inlinedAt: !292)
!308 = distinct !{!308, !297, !309, !54}
!309 = !DILocation(line: 112, column: 9, scope: !284, inlinedAt: !292)
!310 = !DILocation(line: 106, column: 32, scope: !286, inlinedAt: !292)
!311 = distinct !{!311, !295, !312, !54}
!312 = !DILocation(line: 113, column: 5, scope: !282, inlinedAt: !292)
!313 = !DILocation(line: 214, column: 1, scope: !161)
!314 = !DILocation(line: 0, scope: !243)
!315 = !DILocation(line: 0, scope: !250)
!316 = !DILocation(line: 86, column: 26, scope: !254)
!317 = !DILocation(line: 86, column: 5, scope: !250)
!318 = !DILocation(line: 0, scope: !252)
!319 = !DILocation(line: 87, column: 9, scope: !252)
!320 = !DILocation(line: 87, column: 36, scope: !264)
!321 = !DILocation(line: 88, column: 23, scope: !263)
!322 = !{!323}
!323 = distinct !{!323, !324}
!324 = distinct !{!324, !"LVerDomain"}
!325 = !DILocation(line: 88, column: 21, scope: !263)
!326 = !{!327}
!327 = distinct !{!327, !324}
!328 = distinct !{!328, !319, !329, !54, !330}
!329 = !DILocation(line: 89, column: 9, scope: !252)
!330 = !{!"llvm.loop.isvectorized", i32 1}
!331 = !DILocation(line: 88, column: 13, scope: !263)
!332 = !DILocation(line: 87, column: 30, scope: !264)
!333 = distinct !{!333, !319, !329, !54, !330}
!334 = !DILocation(line: 86, column: 32, scope: !254)
!335 = distinct !{!335, !317, !336, !54}
!336 = !DILocation(line: 90, column: 5, scope: !250)
!337 = !DILocation(line: 93, column: 1, scope: !243)
!338 = !DILocation(line: 0, scope: !275)
!339 = !DILocation(line: 0, scope: !282)
!340 = !DILocation(line: 106, column: 26, scope: !286)
!341 = !DILocation(line: 106, column: 5, scope: !282)
!342 = !DILocation(line: 0, scope: !284)
!343 = !DILocation(line: 107, column: 9, scope: !284)
!344 = !DILocation(line: 0, scope: !288)
!345 = !DILocation(line: 109, column: 27, scope: !288)
!346 = !DILocation(line: 110, column: 32, scope: !288)
!347 = !DILocation(line: 110, column: 24, scope: !288)
!348 = !DILocation(line: 110, column: 13, scope: !288)
!349 = !DILocation(line: 110, column: 30, scope: !288)
!350 = !DILocation(line: 111, column: 13, scope: !288)
!351 = !DILocation(line: 111, column: 21, scope: !288)
!352 = !DILocation(line: 107, column: 36, scope: !289)
!353 = !DILocation(line: 107, column: 30, scope: !289)
!354 = distinct !{!354, !343, !355, !54}
!355 = !DILocation(line: 112, column: 9, scope: !284)
!356 = !DILocation(line: 106, column: 32, scope: !286)
!357 = distinct !{!357, !341, !358, !54}
!358 = !DILocation(line: 113, column: 5, scope: !282)
!359 = !DILocation(line: 116, column: 1, scope: !275)
