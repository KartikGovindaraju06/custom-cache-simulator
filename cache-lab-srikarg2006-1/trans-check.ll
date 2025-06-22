; ModuleID = 'trans.c'
source_filename = "trans.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@.str = private unnamed_addr constant [21 x i8] c"Transpose submission\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Basic transpose\00", align 1
@.str.2 = private unnamed_addr constant [36 x i8] c"Transpose using the temporary array\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"Optimized for 1024x1024 matrices\00", align 1
@.str.4 = private unnamed_addr constant [29 x i8] c"Optimized for 32x32 matrices\00", align 1
@.str.5 = private unnamed_addr constant [25 x i8] c"is_transpose(M, N, A, B)\00", align 1
@.str.6 = private unnamed_addr constant [8 x i8] c"trans.c\00", align 1
@__PRETTY_FUNCTION__.transpose_submit = private unnamed_addr constant [78 x i8] c"void transpose_submit(size_t, size_t, double (*)[M], double (*)[N], double *)\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.7 = private unnamed_addr constant [72 x i8] c"Transpose incorrect.  Fails for B[%zd][%zd] = %.3f, A[%zd][%zd] = %.3f\0A\00", align 1
@.str.8 = private unnamed_addr constant [6 x i8] c"M > 0\00", align 1
@__PRETTY_FUNCTION__.trans_basic = private unnamed_addr constant [73 x i8] c"void trans_basic(size_t, size_t, double (*)[M], double (*)[N], double *)\00", align 1
@.str.9 = private unnamed_addr constant [6 x i8] c"N > 0\00", align 1
@__PRETTY_FUNCTION__.trans_tmp = private unnamed_addr constant [71 x i8] c"void trans_tmp(size_t, size_t, double (*)[M], double (*)[N], double *)\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @transpose_1024x1024(i64 noundef %0, i64 noundef %1, double* noundef %2, double* noundef %3, double* noundef %4) #0 !dbg !10 {
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca double*, align 8
  %9 = alloca double*, align 8
  %10 = alloca double*, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  %15 = alloca i64, align 8
  store i64 %0, i64* %6, align 8
  call void @llvm.dbg.declare(metadata i64* %6, metadata !23, metadata !DIExpression()), !dbg !24
  store i64 %1, i64* %7, align 8
  call void @llvm.dbg.declare(metadata i64* %7, metadata !25, metadata !DIExpression()), !dbg !26
  store double* %2, double** %8, align 8
  call void @llvm.dbg.declare(metadata double** %8, metadata !27, metadata !DIExpression()), !dbg !28
  store double* %3, double** %9, align 8
  call void @llvm.dbg.declare(metadata double** %9, metadata !29, metadata !DIExpression()), !dbg !30
  store double* %4, double** %10, align 8
  call void @llvm.dbg.declare(metadata double** %10, metadata !31, metadata !DIExpression()), !dbg !32
  %16 = load i64, i64* %7, align 8, !dbg !33
  %17 = load i64, i64* %6, align 8, !dbg !34
  %18 = load i64, i64* %6, align 8, !dbg !35
  %19 = load i64, i64* %7, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata i64* %11, metadata !37, metadata !DIExpression()), !dbg !38
  store i64 8, i64* %11, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i64* %12, metadata !39, metadata !DIExpression()), !dbg !41
  store i64 0, i64* %12, align 8, !dbg !41
  br label %20, !dbg !42

20:                                               ; preds = %72, %5
  %21 = load i64, i64* %12, align 8, !dbg !43
  %22 = load i64, i64* %7, align 8, !dbg !45
  %23 = icmp ult i64 %21, %22, !dbg !46
  br i1 %23, label %24, label %76, !dbg !47

24:                                               ; preds = %20
  call void @llvm.dbg.declare(metadata i64* %13, metadata !48, metadata !DIExpression()), !dbg !51
  store i64 0, i64* %13, align 8, !dbg !51
  br label %25, !dbg !52

25:                                               ; preds = %67, %24
  %26 = load i64, i64* %13, align 8, !dbg !53
  %27 = load i64, i64* %6, align 8, !dbg !55
  %28 = icmp ult i64 %26, %27, !dbg !56
  br i1 %28, label %29, label %71, !dbg !57

29:                                               ; preds = %25
  call void @llvm.dbg.declare(metadata i64* %14, metadata !58, metadata !DIExpression()), !dbg !61
  %30 = load i64, i64* %12, align 8, !dbg !62
  store i64 %30, i64* %14, align 8, !dbg !61
  br label %31, !dbg !63

31:                                               ; preds = %63, %29
  %32 = load i64, i64* %14, align 8, !dbg !64
  %33 = load i64, i64* %12, align 8, !dbg !66
  %34 = load i64, i64* %11, align 8, !dbg !67
  %35 = add i64 %33, %34, !dbg !68
  %36 = icmp ult i64 %32, %35, !dbg !69
  br i1 %36, label %37, label %66, !dbg !70

37:                                               ; preds = %31
  call void @llvm.dbg.declare(metadata i64* %15, metadata !71, metadata !DIExpression()), !dbg !74
  %38 = load i64, i64* %13, align 8, !dbg !75
  store i64 %38, i64* %15, align 8, !dbg !74
  br label %39, !dbg !76

39:                                               ; preds = %59, %37
  %40 = load i64, i64* %15, align 8, !dbg !77
  %41 = load i64, i64* %13, align 8, !dbg !79
  %42 = load i64, i64* %11, align 8, !dbg !80
  %43 = add i64 %41, %42, !dbg !81
  %44 = icmp ult i64 %40, %43, !dbg !82
  br i1 %44, label %45, label %62, !dbg !83

45:                                               ; preds = %39
  %46 = load double*, double** %8, align 8, !dbg !84
  %47 = load i64, i64* %14, align 8, !dbg !86
  %48 = mul nsw i64 %47, %17, !dbg !84
  %49 = getelementptr inbounds double, double* %46, i64 %48, !dbg !84
  %50 = load i64, i64* %15, align 8, !dbg !87
  %51 = getelementptr inbounds double, double* %49, i64 %50, !dbg !84
  %52 = load double, double* %51, align 8, !dbg !84
  %53 = load double*, double** %9, align 8, !dbg !88
  %54 = load i64, i64* %15, align 8, !dbg !89
  %55 = mul nsw i64 %54, %19, !dbg !88
  %56 = getelementptr inbounds double, double* %53, i64 %55, !dbg !88
  %57 = load i64, i64* %14, align 8, !dbg !90
  %58 = getelementptr inbounds double, double* %56, i64 %57, !dbg !88
  store double %52, double* %58, align 8, !dbg !91
  br label %59, !dbg !92

59:                                               ; preds = %45
  %60 = load i64, i64* %15, align 8, !dbg !93
  %61 = add i64 %60, 1, !dbg !93
  store i64 %61, i64* %15, align 8, !dbg !93
  br label %39, !dbg !94, !llvm.loop !95

62:                                               ; preds = %39
  br label %63, !dbg !97

63:                                               ; preds = %62
  %64 = load i64, i64* %14, align 8, !dbg !98
  %65 = add i64 %64, 1, !dbg !98
  store i64 %65, i64* %14, align 8, !dbg !98
  br label %31, !dbg !99, !llvm.loop !100

66:                                               ; preds = %31
  br label %67, !dbg !102

67:                                               ; preds = %66
  %68 = load i64, i64* %11, align 8, !dbg !103
  %69 = load i64, i64* %13, align 8, !dbg !104
  %70 = add i64 %69, %68, !dbg !104
  store i64 %70, i64* %13, align 8, !dbg !104
  br label %25, !dbg !105, !llvm.loop !106

71:                                               ; preds = %25
  br label %72, !dbg !108

72:                                               ; preds = %71
  %73 = load i64, i64* %11, align 8, !dbg !109
  %74 = load i64, i64* %12, align 8, !dbg !110
  %75 = add i64 %74, %73, !dbg !110
  store i64 %75, i64* %12, align 8, !dbg !110
  br label %20, !dbg !111, !llvm.loop !112

76:                                               ; preds = %20
  ret void, !dbg !114
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @transpose_32x32(i64 noundef %0, i64 noundef %1, double* noundef %2, double* noundef %3, double* noundef %4) #0 !dbg !115 {
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca double*, align 8
  %9 = alloca double*, align 8
  %10 = alloca double*, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  store i64 %0, i64* %6, align 8
  call void @llvm.dbg.declare(metadata i64* %6, metadata !116, metadata !DIExpression()), !dbg !117
  store i64 %1, i64* %7, align 8
  call void @llvm.dbg.declare(metadata i64* %7, metadata !118, metadata !DIExpression()), !dbg !119
  store double* %2, double** %8, align 8
  call void @llvm.dbg.declare(metadata double** %8, metadata !120, metadata !DIExpression()), !dbg !121
  store double* %3, double** %9, align 8
  call void @llvm.dbg.declare(metadata double** %9, metadata !122, metadata !DIExpression()), !dbg !123
  store double* %4, double** %10, align 8
  call void @llvm.dbg.declare(metadata double** %10, metadata !124, metadata !DIExpression()), !dbg !125
  %17 = load i64, i64* %7, align 8, !dbg !126
  %18 = load i64, i64* %6, align 8, !dbg !127
  %19 = load i64, i64* %6, align 8, !dbg !128
  %20 = load i64, i64* %7, align 8, !dbg !129
  call void @llvm.dbg.declare(metadata i64* %11, metadata !130, metadata !DIExpression()), !dbg !131
  store i64 8, i64* %11, align 8, !dbg !131
  call void @llvm.dbg.declare(metadata i64* %12, metadata !132, metadata !DIExpression()), !dbg !133
  %21 = load i64, i64* %11, align 8, !dbg !134
  %22 = sub i64 %21, 1, !dbg !135
  store i64 %22, i64* %12, align 8, !dbg !133
  call void @llvm.dbg.declare(metadata i64* %13, metadata !136, metadata !DIExpression()), !dbg !138
  store i64 0, i64* %13, align 8, !dbg !138
  br label %23, !dbg !139

23:                                               ; preds = %116, %5
  %24 = load i64, i64* %13, align 8, !dbg !140
  %25 = load i64, i64* %7, align 8, !dbg !142
  %26 = icmp ult i64 %24, %25, !dbg !143
  br i1 %26, label %27, label %120, !dbg !144

27:                                               ; preds = %23
  call void @llvm.dbg.declare(metadata i64* %14, metadata !145, metadata !DIExpression()), !dbg !148
  store i64 0, i64* %14, align 8, !dbg !148
  br label %28, !dbg !149

28:                                               ; preds = %111, %27
  %29 = load i64, i64* %14, align 8, !dbg !150
  %30 = load i64, i64* %6, align 8, !dbg !152
  %31 = icmp ult i64 %29, %30, !dbg !153
  br i1 %31, label %32, label %115, !dbg !154

32:                                               ; preds = %28
  call void @llvm.dbg.declare(metadata i64* %15, metadata !155, metadata !DIExpression()), !dbg !158
  store i64 0, i64* %15, align 8, !dbg !158
  br label %33, !dbg !159

33:                                               ; preds = %107, %32
  %34 = load i64, i64* %15, align 8, !dbg !160
  %35 = load i64, i64* %11, align 8, !dbg !162
  %36 = icmp ult i64 %34, %35, !dbg !163
  br i1 %36, label %37, label %110, !dbg !164

37:                                               ; preds = %33
  call void @llvm.dbg.declare(metadata i64* %16, metadata !165, metadata !DIExpression()), !dbg !168
  store i64 0, i64* %16, align 8, !dbg !168
  br label %38, !dbg !169

38:                                               ; preds = %103, %37
  %39 = load i64, i64* %16, align 8, !dbg !170
  %40 = load i64, i64* %11, align 8, !dbg !172
  %41 = icmp ult i64 %39, %40, !dbg !173
  br i1 %41, label %42, label %106, !dbg !174

42:                                               ; preds = %38
  %43 = load i64, i64* %15, align 8, !dbg !175
  %44 = load i64, i64* %13, align 8, !dbg !178
  %45 = add i64 %43, %44, !dbg !179
  %46 = load i64, i64* %16, align 8, !dbg !180
  %47 = load i64, i64* %14, align 8, !dbg !181
  %48 = add i64 %46, %47, !dbg !182
  %49 = icmp ne i64 %45, %48, !dbg !183
  br i1 %49, label %50, label %72, !dbg !184

50:                                               ; preds = %42
  %51 = load double*, double** %8, align 8, !dbg !185
  %52 = load i64, i64* %15, align 8, !dbg !187
  %53 = load i64, i64* %13, align 8, !dbg !188
  %54 = add i64 %52, %53, !dbg !189
  %55 = mul nsw i64 %54, %18, !dbg !185
  %56 = getelementptr inbounds double, double* %51, i64 %55, !dbg !185
  %57 = load i64, i64* %16, align 8, !dbg !190
  %58 = load i64, i64* %14, align 8, !dbg !191
  %59 = add i64 %57, %58, !dbg !192
  %60 = getelementptr inbounds double, double* %56, i64 %59, !dbg !185
  %61 = load double, double* %60, align 8, !dbg !185
  %62 = load double*, double** %9, align 8, !dbg !193
  %63 = load i64, i64* %16, align 8, !dbg !194
  %64 = load i64, i64* %14, align 8, !dbg !195
  %65 = add i64 %63, %64, !dbg !196
  %66 = mul nsw i64 %65, %20, !dbg !193
  %67 = getelementptr inbounds double, double* %62, i64 %66, !dbg !193
  %68 = load i64, i64* %15, align 8, !dbg !197
  %69 = load i64, i64* %13, align 8, !dbg !198
  %70 = add i64 %68, %69, !dbg !199
  %71 = getelementptr inbounds double, double* %67, i64 %70, !dbg !193
  store double %61, double* %71, align 8, !dbg !200
  br label %72, !dbg !201

72:                                               ; preds = %50, %42
  %73 = load i64, i64* %13, align 8, !dbg !202
  %74 = load i64, i64* %14, align 8, !dbg !204
  %75 = icmp eq i64 %73, %74, !dbg !205
  br i1 %75, label %76, label %102, !dbg !206

76:                                               ; preds = %72
  %77 = load i64, i64* %16, align 8, !dbg !207
  %78 = load i64, i64* %12, align 8, !dbg !208
  %79 = icmp eq i64 %77, %78, !dbg !209
  br i1 %79, label %80, label %102, !dbg !210

80:                                               ; preds = %76
  %81 = load double*, double** %8, align 8, !dbg !211
  %82 = load i64, i64* %15, align 8, !dbg !213
  %83 = load i64, i64* %13, align 8, !dbg !214
  %84 = add i64 %82, %83, !dbg !215
  %85 = mul nsw i64 %84, %18, !dbg !211
  %86 = getelementptr inbounds double, double* %81, i64 %85, !dbg !211
  %87 = load i64, i64* %15, align 8, !dbg !216
  %88 = load i64, i64* %13, align 8, !dbg !217
  %89 = add i64 %87, %88, !dbg !218
  %90 = getelementptr inbounds double, double* %86, i64 %89, !dbg !211
  %91 = load double, double* %90, align 8, !dbg !211
  %92 = load double*, double** %9, align 8, !dbg !219
  %93 = load i64, i64* %15, align 8, !dbg !220
  %94 = load i64, i64* %13, align 8, !dbg !221
  %95 = add i64 %93, %94, !dbg !222
  %96 = mul nsw i64 %95, %20, !dbg !219
  %97 = getelementptr inbounds double, double* %92, i64 %96, !dbg !219
  %98 = load i64, i64* %15, align 8, !dbg !223
  %99 = load i64, i64* %13, align 8, !dbg !224
  %100 = add i64 %98, %99, !dbg !225
  %101 = getelementptr inbounds double, double* %97, i64 %100, !dbg !219
  store double %91, double* %101, align 8, !dbg !226
  br label %102, !dbg !227

102:                                              ; preds = %80, %76, %72
  br label %103, !dbg !228

103:                                              ; preds = %102
  %104 = load i64, i64* %16, align 8, !dbg !229
  %105 = add i64 %104, 1, !dbg !229
  store i64 %105, i64* %16, align 8, !dbg !229
  br label %38, !dbg !230, !llvm.loop !231

106:                                              ; preds = %38
  br label %107, !dbg !233

107:                                              ; preds = %106
  %108 = load i64, i64* %15, align 8, !dbg !234
  %109 = add i64 %108, 1, !dbg !234
  store i64 %109, i64* %15, align 8, !dbg !234
  br label %33, !dbg !235, !llvm.loop !236

110:                                              ; preds = %33
  br label %111, !dbg !238

111:                                              ; preds = %110
  %112 = load i64, i64* %11, align 8, !dbg !239
  %113 = load i64, i64* %14, align 8, !dbg !240
  %114 = add i64 %113, %112, !dbg !240
  store i64 %114, i64* %14, align 8, !dbg !240
  br label %28, !dbg !241, !llvm.loop !242

115:                                              ; preds = %28
  br label %116, !dbg !244

116:                                              ; preds = %115
  %117 = load i64, i64* %11, align 8, !dbg !245
  %118 = load i64, i64* %13, align 8, !dbg !246
  %119 = add i64 %118, %117, !dbg !246
  store i64 %119, i64* %13, align 8, !dbg !246
  br label %23, !dbg !247, !llvm.loop !248

120:                                              ; preds = %23
  ret void, !dbg !250
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @registerFunctions() #0 !dbg !251 {
  call void @registerTransFunction(void (i64, i64, double*, double*, double*)* noundef @transpose_submit, i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !254
  call void @registerTransFunction(void (i64, i64, double*, double*, double*)* noundef @trans_basic, i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !255
  call void @registerTransFunction(void (i64, i64, double*, double*, double*)* noundef @trans_tmp, i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !256
  call void @registerTransFunction(void (i64, i64, double*, double*, double*)* noundef @transpose_1024x1024, i8* noundef getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0)), !dbg !257
  call void @registerTransFunction(void (i64, i64, double*, double*, double*)* noundef @transpose_32x32, i8* noundef getelementptr inbounds ([29 x i8], [29 x i8]* @.str.4, i64 0, i64 0)), !dbg !258
  ret void, !dbg !259
}

declare void @registerTransFunction(void (i64, i64, double*, double*, double*)* noundef, i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal void @transpose_submit(i64 noundef %0, i64 noundef %1, double* noundef %2, double* noundef %3, double* noundef %4) #0 !dbg !260 {
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca double*, align 8
  %9 = alloca double*, align 8
  %10 = alloca double*, align 8
  store i64 %0, i64* %6, align 8
  call void @llvm.dbg.declare(metadata i64* %6, metadata !261, metadata !DIExpression()), !dbg !262
  store i64 %1, i64* %7, align 8
  call void @llvm.dbg.declare(metadata i64* %7, metadata !263, metadata !DIExpression()), !dbg !264
  store double* %2, double** %8, align 8
  call void @llvm.dbg.declare(metadata double** %8, metadata !265, metadata !DIExpression()), !dbg !266
  store double* %3, double** %9, align 8
  call void @llvm.dbg.declare(metadata double** %9, metadata !267, metadata !DIExpression()), !dbg !268
  store double* %4, double** %10, align 8
  call void @llvm.dbg.declare(metadata double** %10, metadata !269, metadata !DIExpression()), !dbg !270
  %11 = load i64, i64* %7, align 8, !dbg !271
  %12 = load i64, i64* %6, align 8, !dbg !272
  %13 = load i64, i64* %6, align 8, !dbg !273
  %14 = load i64, i64* %7, align 8, !dbg !274
  %15 = load i64, i64* %6, align 8, !dbg !275
  %16 = icmp eq i64 %15, 32, !dbg !277
  br i1 %16, label %17, label %26, !dbg !278

17:                                               ; preds = %5
  %18 = load i64, i64* %7, align 8, !dbg !279
  %19 = icmp eq i64 %18, 32, !dbg !280
  br i1 %19, label %20, label %26, !dbg !281

20:                                               ; preds = %17
  %21 = load i64, i64* %6, align 8, !dbg !282
  %22 = load i64, i64* %7, align 8, !dbg !284
  %23 = load double*, double** %8, align 8, !dbg !285
  %24 = load double*, double** %9, align 8, !dbg !286
  %25 = load double*, double** %10, align 8, !dbg !287
  call void @transpose_32x32(i64 noundef %21, i64 noundef %22, double* noundef %23, double* noundef %24, double* noundef %25), !dbg !288
  br label %63, !dbg !289

26:                                               ; preds = %17, %5
  %27 = load i64, i64* %6, align 8, !dbg !290
  %28 = icmp eq i64 %27, 1024, !dbg !292
  br i1 %28, label %29, label %38, !dbg !293

29:                                               ; preds = %26
  %30 = load i64, i64* %7, align 8, !dbg !294
  %31 = icmp eq i64 %30, 1024, !dbg !295
  br i1 %31, label %32, label %38, !dbg !296

32:                                               ; preds = %29
  %33 = load i64, i64* %6, align 8, !dbg !297
  %34 = load i64, i64* %7, align 8, !dbg !299
  %35 = load double*, double** %8, align 8, !dbg !300
  %36 = load double*, double** %9, align 8, !dbg !301
  %37 = load double*, double** %10, align 8, !dbg !302
  call void @transpose_1024x1024(i64 noundef %33, i64 noundef %34, double* noundef %35, double* noundef %36, double* noundef %37), !dbg !303
  br label %63, !dbg !304

38:                                               ; preds = %29, %26
  %39 = load i64, i64* %6, align 8, !dbg !305
  %40 = load i64, i64* %7, align 8, !dbg !307
  %41 = icmp eq i64 %39, %40, !dbg !308
  br i1 %41, label %42, label %48, !dbg !309

42:                                               ; preds = %38
  %43 = load i64, i64* %6, align 8, !dbg !310
  %44 = load i64, i64* %7, align 8, !dbg !311
  %45 = load double*, double** %8, align 8, !dbg !312
  %46 = load double*, double** %9, align 8, !dbg !313
  %47 = load double*, double** %10, align 8, !dbg !314
  call void @trans_basic(i64 noundef %43, i64 noundef %44, double* noundef %45, double* noundef %46, double* noundef %47), !dbg !315
  br label %54, !dbg !315

48:                                               ; preds = %38
  %49 = load i64, i64* %6, align 8, !dbg !316
  %50 = load i64, i64* %7, align 8, !dbg !317
  %51 = load double*, double** %8, align 8, !dbg !318
  %52 = load double*, double** %9, align 8, !dbg !319
  %53 = load double*, double** %10, align 8, !dbg !320
  call void @trans_tmp(i64 noundef %49, i64 noundef %50, double* noundef %51, double* noundef %52, double* noundef %53), !dbg !321
  br label %54

54:                                               ; preds = %48, %42
  %55 = load i64, i64* %6, align 8, !dbg !322
  %56 = load i64, i64* %7, align 8, !dbg !322
  %57 = load double*, double** %8, align 8, !dbg !322
  %58 = load double*, double** %9, align 8, !dbg !322
  %59 = call zeroext i1 @is_transpose(i64 noundef %55, i64 noundef %56, double* noundef %57, double* noundef %58), !dbg !322
  br i1 %59, label %60, label %61, !dbg !322

60:                                               ; preds = %54
  br label %63, !dbg !322

61:                                               ; preds = %54
  call void @__assert_fail(i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @.str.5, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6, i64 0, i64 0), i32 noundef 213, i8* noundef getelementptr inbounds ([78 x i8], [78 x i8]* @__PRETTY_FUNCTION__.transpose_submit, i64 0, i64 0)) #4, !dbg !322
  unreachable, !dbg !322

62:                                               ; No predecessors!
  br label %63, !dbg !322

63:                                               ; preds = %20, %32, %62, %60
  ret void, !dbg !323
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @trans_basic(i64 noundef %0, i64 noundef %1, double* noundef %2, double* noundef %3, double* noundef %4) #0 !dbg !324 {
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca double*, align 8
  %9 = alloca double*, align 8
  %10 = alloca double*, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  store i64 %0, i64* %6, align 8
  call void @llvm.dbg.declare(metadata i64* %6, metadata !325, metadata !DIExpression()), !dbg !326
  store i64 %1, i64* %7, align 8
  call void @llvm.dbg.declare(metadata i64* %7, metadata !327, metadata !DIExpression()), !dbg !328
  store double* %2, double** %8, align 8
  call void @llvm.dbg.declare(metadata double** %8, metadata !329, metadata !DIExpression()), !dbg !330
  store double* %3, double** %9, align 8
  call void @llvm.dbg.declare(metadata double** %9, metadata !331, metadata !DIExpression()), !dbg !332
  store double* %4, double** %10, align 8
  call void @llvm.dbg.declare(metadata double** %10, metadata !333, metadata !DIExpression()), !dbg !334
  %13 = load i64, i64* %7, align 8, !dbg !335
  %14 = load i64, i64* %6, align 8, !dbg !336
  %15 = load i64, i64* %6, align 8, !dbg !337
  %16 = load i64, i64* %7, align 8, !dbg !338
  %17 = load i64, i64* %6, align 8, !dbg !339
  %18 = icmp ugt i64 %17, 0, !dbg !339
  br i1 %18, label %19, label %20, !dbg !339

19:                                               ; preds = %5
  br label %22, !dbg !339

20:                                               ; preds = %5
  call void @__assert_fail(i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str.8, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6, i64 0, i64 0), i32 noundef 83, i8* noundef getelementptr inbounds ([73 x i8], [73 x i8]* @__PRETTY_FUNCTION__.trans_basic, i64 0, i64 0)) #4, !dbg !339
  unreachable, !dbg !339

21:                                               ; No predecessors!
  br label %22, !dbg !339

22:                                               ; preds = %21, %19
  %23 = load i64, i64* %7, align 8, !dbg !340
  %24 = icmp ugt i64 %23, 0, !dbg !340
  br i1 %24, label %25, label %26, !dbg !340

25:                                               ; preds = %22
  br label %28, !dbg !340

26:                                               ; preds = %22
  call void @__assert_fail(i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str.9, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6, i64 0, i64 0), i32 noundef 84, i8* noundef getelementptr inbounds ([73 x i8], [73 x i8]* @__PRETTY_FUNCTION__.trans_basic, i64 0, i64 0)) #4, !dbg !340
  unreachable, !dbg !340

27:                                               ; No predecessors!
  br label %28, !dbg !340

28:                                               ; preds = %27, %25
  call void @llvm.dbg.declare(metadata i64* %11, metadata !341, metadata !DIExpression()), !dbg !343
  store i64 0, i64* %11, align 8, !dbg !343
  br label %29, !dbg !344

29:                                               ; preds = %56, %28
  %30 = load i64, i64* %11, align 8, !dbg !345
  %31 = load i64, i64* %7, align 8, !dbg !347
  %32 = icmp ult i64 %30, %31, !dbg !348
  br i1 %32, label %33, label %59, !dbg !349

33:                                               ; preds = %29
  call void @llvm.dbg.declare(metadata i64* %12, metadata !350, metadata !DIExpression()), !dbg !353
  store i64 0, i64* %12, align 8, !dbg !353
  br label %34, !dbg !354

34:                                               ; preds = %52, %33
  %35 = load i64, i64* %12, align 8, !dbg !355
  %36 = load i64, i64* %6, align 8, !dbg !357
  %37 = icmp ult i64 %35, %36, !dbg !358
  br i1 %37, label %38, label %55, !dbg !359

38:                                               ; preds = %34
  %39 = load double*, double** %8, align 8, !dbg !360
  %40 = load i64, i64* %11, align 8, !dbg !362
  %41 = mul nsw i64 %40, %14, !dbg !360
  %42 = getelementptr inbounds double, double* %39, i64 %41, !dbg !360
  %43 = load i64, i64* %12, align 8, !dbg !363
  %44 = getelementptr inbounds double, double* %42, i64 %43, !dbg !360
  %45 = load double, double* %44, align 8, !dbg !360
  %46 = load double*, double** %9, align 8, !dbg !364
  %47 = load i64, i64* %12, align 8, !dbg !365
  %48 = mul nsw i64 %47, %16, !dbg !364
  %49 = getelementptr inbounds double, double* %46, i64 %48, !dbg !364
  %50 = load i64, i64* %11, align 8, !dbg !366
  %51 = getelementptr inbounds double, double* %49, i64 %50, !dbg !364
  store double %45, double* %51, align 8, !dbg !367
  br label %52, !dbg !368

52:                                               ; preds = %38
  %53 = load i64, i64* %12, align 8, !dbg !369
  %54 = add i64 %53, 1, !dbg !369
  store i64 %54, i64* %12, align 8, !dbg !369
  br label %34, !dbg !370, !llvm.loop !371

55:                                               ; preds = %34
  br label %56, !dbg !373

56:                                               ; preds = %55
  %57 = load i64, i64* %11, align 8, !dbg !374
  %58 = add i64 %57, 1, !dbg !374
  store i64 %58, i64* %11, align 8, !dbg !374
  br label %29, !dbg !375, !llvm.loop !376

59:                                               ; preds = %29
  %60 = load i64, i64* %6, align 8, !dbg !378
  %61 = load i64, i64* %7, align 8, !dbg !378
  %62 = load double*, double** %8, align 8, !dbg !378
  %63 = load double*, double** %9, align 8, !dbg !378
  %64 = call zeroext i1 @is_transpose(i64 noundef %60, i64 noundef %61, double* noundef %62, double* noundef %63), !dbg !378
  br i1 %64, label %65, label %66, !dbg !378

65:                                               ; preds = %59
  br label %68, !dbg !378

66:                                               ; preds = %59
  call void @__assert_fail(i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @.str.5, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6, i64 0, i64 0), i32 noundef 92, i8* noundef getelementptr inbounds ([73 x i8], [73 x i8]* @__PRETTY_FUNCTION__.trans_basic, i64 0, i64 0)) #4, !dbg !378
  unreachable, !dbg !378

67:                                               ; No predecessors!
  br label %68, !dbg !378

68:                                               ; preds = %67, %65
  ret void, !dbg !379
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @trans_tmp(i64 noundef %0, i64 noundef %1, double* noundef %2, double* noundef %3, double* noundef %4) #0 !dbg !380 {
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca double*, align 8
  %9 = alloca double*, align 8
  %10 = alloca double*, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  store i64 %0, i64* %6, align 8
  call void @llvm.dbg.declare(metadata i64* %6, metadata !381, metadata !DIExpression()), !dbg !382
  store i64 %1, i64* %7, align 8
  call void @llvm.dbg.declare(metadata i64* %7, metadata !383, metadata !DIExpression()), !dbg !384
  store double* %2, double** %8, align 8
  call void @llvm.dbg.declare(metadata double** %8, metadata !385, metadata !DIExpression()), !dbg !386
  store double* %3, double** %9, align 8
  call void @llvm.dbg.declare(metadata double** %9, metadata !387, metadata !DIExpression()), !dbg !388
  store double* %4, double** %10, align 8
  call void @llvm.dbg.declare(metadata double** %10, metadata !389, metadata !DIExpression()), !dbg !390
  %15 = load i64, i64* %7, align 8, !dbg !391
  %16 = load i64, i64* %6, align 8, !dbg !392
  %17 = load i64, i64* %6, align 8, !dbg !393
  %18 = load i64, i64* %7, align 8, !dbg !394
  %19 = load i64, i64* %6, align 8, !dbg !395
  %20 = icmp ugt i64 %19, 0, !dbg !395
  br i1 %20, label %21, label %22, !dbg !395

21:                                               ; preds = %5
  br label %24, !dbg !395

22:                                               ; preds = %5
  call void @__assert_fail(i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str.8, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6, i64 0, i64 0), i32 noundef 103, i8* noundef getelementptr inbounds ([71 x i8], [71 x i8]* @__PRETTY_FUNCTION__.trans_tmp, i64 0, i64 0)) #4, !dbg !395
  unreachable, !dbg !395

23:                                               ; No predecessors!
  br label %24, !dbg !395

24:                                               ; preds = %23, %21
  %25 = load i64, i64* %7, align 8, !dbg !396
  %26 = icmp ugt i64 %25, 0, !dbg !396
  br i1 %26, label %27, label %28, !dbg !396

27:                                               ; preds = %24
  br label %30, !dbg !396

28:                                               ; preds = %24
  call void @__assert_fail(i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str.9, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6, i64 0, i64 0), i32 noundef 104, i8* noundef getelementptr inbounds ([71 x i8], [71 x i8]* @__PRETTY_FUNCTION__.trans_tmp, i64 0, i64 0)) #4, !dbg !396
  unreachable, !dbg !396

29:                                               ; No predecessors!
  br label %30, !dbg !396

30:                                               ; preds = %29, %27
  call void @llvm.dbg.declare(metadata i64* %11, metadata !397, metadata !DIExpression()), !dbg !399
  store i64 0, i64* %11, align 8, !dbg !399
  br label %31, !dbg !400

31:                                               ; preds = %75, %30
  %32 = load i64, i64* %11, align 8, !dbg !401
  %33 = load i64, i64* %7, align 8, !dbg !403
  %34 = icmp ult i64 %32, %33, !dbg !404
  br i1 %34, label %35, label %78, !dbg !405

35:                                               ; preds = %31
  call void @llvm.dbg.declare(metadata i64* %12, metadata !406, metadata !DIExpression()), !dbg !409
  store i64 0, i64* %12, align 8, !dbg !409
  br label %36, !dbg !410

36:                                               ; preds = %71, %35
  %37 = load i64, i64* %12, align 8, !dbg !411
  %38 = load i64, i64* %6, align 8, !dbg !413
  %39 = icmp ult i64 %37, %38, !dbg !414
  br i1 %39, label %40, label %74, !dbg !415

40:                                               ; preds = %36
  call void @llvm.dbg.declare(metadata i64* %13, metadata !416, metadata !DIExpression()), !dbg !418
  %41 = load i64, i64* %11, align 8, !dbg !419
  %42 = urem i64 %41, 2, !dbg !420
  store i64 %42, i64* %13, align 8, !dbg !418
  call void @llvm.dbg.declare(metadata i64* %14, metadata !421, metadata !DIExpression()), !dbg !422
  %43 = load i64, i64* %12, align 8, !dbg !423
  %44 = urem i64 %43, 2, !dbg !424
  store i64 %44, i64* %14, align 8, !dbg !422
  %45 = load double*, double** %8, align 8, !dbg !425
  %46 = load i64, i64* %11, align 8, !dbg !426
  %47 = mul nsw i64 %46, %16, !dbg !425
  %48 = getelementptr inbounds double, double* %45, i64 %47, !dbg !425
  %49 = load i64, i64* %12, align 8, !dbg !427
  %50 = getelementptr inbounds double, double* %48, i64 %49, !dbg !425
  %51 = load double, double* %50, align 8, !dbg !425
  %52 = load double*, double** %10, align 8, !dbg !428
  %53 = load i64, i64* %13, align 8, !dbg !429
  %54 = mul i64 2, %53, !dbg !430
  %55 = load i64, i64* %14, align 8, !dbg !431
  %56 = add i64 %54, %55, !dbg !432
  %57 = getelementptr inbounds double, double* %52, i64 %56, !dbg !428
  store double %51, double* %57, align 8, !dbg !433
  %58 = load double*, double** %10, align 8, !dbg !434
  %59 = load i64, i64* %13, align 8, !dbg !435
  %60 = mul i64 2, %59, !dbg !436
  %61 = load i64, i64* %14, align 8, !dbg !437
  %62 = add i64 %60, %61, !dbg !438
  %63 = getelementptr inbounds double, double* %58, i64 %62, !dbg !434
  %64 = load double, double* %63, align 8, !dbg !434
  %65 = load double*, double** %9, align 8, !dbg !439
  %66 = load i64, i64* %12, align 8, !dbg !440
  %67 = mul nsw i64 %66, %18, !dbg !439
  %68 = getelementptr inbounds double, double* %65, i64 %67, !dbg !439
  %69 = load i64, i64* %11, align 8, !dbg !441
  %70 = getelementptr inbounds double, double* %68, i64 %69, !dbg !439
  store double %64, double* %70, align 8, !dbg !442
  br label %71, !dbg !443

71:                                               ; preds = %40
  %72 = load i64, i64* %12, align 8, !dbg !444
  %73 = add i64 %72, 1, !dbg !444
  store i64 %73, i64* %12, align 8, !dbg !444
  br label %36, !dbg !445, !llvm.loop !446

74:                                               ; preds = %36
  br label %75, !dbg !448

75:                                               ; preds = %74
  %76 = load i64, i64* %11, align 8, !dbg !449
  %77 = add i64 %76, 1, !dbg !449
  store i64 %77, i64* %11, align 8, !dbg !449
  br label %31, !dbg !450, !llvm.loop !451

78:                                               ; preds = %31
  %79 = load i64, i64* %6, align 8, !dbg !453
  %80 = load i64, i64* %7, align 8, !dbg !453
  %81 = load double*, double** %8, align 8, !dbg !453
  %82 = load double*, double** %9, align 8, !dbg !453
  %83 = call zeroext i1 @is_transpose(i64 noundef %79, i64 noundef %80, double* noundef %81, double* noundef %82), !dbg !453
  br i1 %83, label %84, label %85, !dbg !453

84:                                               ; preds = %78
  br label %87, !dbg !453

85:                                               ; preds = %78
  call void @__assert_fail(i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @.str.5, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6, i64 0, i64 0), i32 noundef 115, i8* noundef getelementptr inbounds ([71 x i8], [71 x i8]* @__PRETTY_FUNCTION__.trans_tmp, i64 0, i64 0)) #4, !dbg !453
  unreachable, !dbg !453

86:                                               ; No predecessors!
  br label %87, !dbg !453

87:                                               ; preds = %86, %84
  ret void, !dbg !454
}

; Function Attrs: noinline nounwind optnone uwtable
define internal zeroext i1 @is_transpose(i64 noundef %0, i64 noundef %1, double* noundef %2, double* noundef %3) #0 !dbg !455 {
  %5 = alloca i1, align 1
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca double*, align 8
  %9 = alloca double*, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  store i64 %0, i64* %6, align 8
  call void @llvm.dbg.declare(metadata i64* %6, metadata !459, metadata !DIExpression()), !dbg !460
  store i64 %1, i64* %7, align 8
  call void @llvm.dbg.declare(metadata i64* %7, metadata !461, metadata !DIExpression()), !dbg !462
  store double* %2, double** %8, align 8
  call void @llvm.dbg.declare(metadata double** %8, metadata !463, metadata !DIExpression()), !dbg !464
  store double* %3, double** %9, align 8
  call void @llvm.dbg.declare(metadata double** %9, metadata !465, metadata !DIExpression()), !dbg !466
  %12 = load i64, i64* %7, align 8, !dbg !467
  %13 = load i64, i64* %6, align 8, !dbg !468
  %14 = load i64, i64* %6, align 8, !dbg !469
  %15 = load i64, i64* %7, align 8, !dbg !470
  call void @llvm.dbg.declare(metadata i64* %10, metadata !471, metadata !DIExpression()), !dbg !473
  store i64 0, i64* %10, align 8, !dbg !473
  br label %16, !dbg !474

16:                                               ; preds = %67, %4
  %17 = load i64, i64* %10, align 8, !dbg !475
  %18 = load i64, i64* %7, align 8, !dbg !477
  %19 = icmp ult i64 %17, %18, !dbg !478
  br i1 %19, label %20, label %70, !dbg !479

20:                                               ; preds = %16
  call void @llvm.dbg.declare(metadata i64* %11, metadata !480, metadata !DIExpression()), !dbg !483
  store i64 0, i64* %11, align 8, !dbg !483
  br label %21, !dbg !484

21:                                               ; preds = %63, %20
  %22 = load i64, i64* %11, align 8, !dbg !485
  %23 = load i64, i64* %6, align 8, !dbg !487
  %24 = icmp ult i64 %22, %23, !dbg !488
  br i1 %24, label %25, label %66, !dbg !489

25:                                               ; preds = %21
  %26 = load double*, double** %8, align 8, !dbg !490
  %27 = load i64, i64* %10, align 8, !dbg !493
  %28 = mul nsw i64 %27, %13, !dbg !490
  %29 = getelementptr inbounds double, double* %26, i64 %28, !dbg !490
  %30 = load i64, i64* %11, align 8, !dbg !494
  %31 = getelementptr inbounds double, double* %29, i64 %30, !dbg !490
  %32 = load double, double* %31, align 8, !dbg !490
  %33 = load double*, double** %9, align 8, !dbg !495
  %34 = load i64, i64* %11, align 8, !dbg !496
  %35 = mul nsw i64 %34, %15, !dbg !495
  %36 = getelementptr inbounds double, double* %33, i64 %35, !dbg !495
  %37 = load i64, i64* %10, align 8, !dbg !497
  %38 = getelementptr inbounds double, double* %36, i64 %37, !dbg !495
  %39 = load double, double* %38, align 8, !dbg !495
  %40 = fcmp une double %32, %39, !dbg !498
  br i1 %40, label %41, label %62, !dbg !499

41:                                               ; preds = %25
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !500
  %43 = load i64, i64* %11, align 8, !dbg !502
  %44 = load i64, i64* %10, align 8, !dbg !503
  %45 = load double*, double** %9, align 8, !dbg !504
  %46 = load i64, i64* %11, align 8, !dbg !505
  %47 = mul nsw i64 %46, %15, !dbg !504
  %48 = getelementptr inbounds double, double* %45, i64 %47, !dbg !504
  %49 = load i64, i64* %10, align 8, !dbg !506
  %50 = getelementptr inbounds double, double* %48, i64 %49, !dbg !504
  %51 = load double, double* %50, align 8, !dbg !504
  %52 = load i64, i64* %10, align 8, !dbg !507
  %53 = load i64, i64* %11, align 8, !dbg !508
  %54 = load double*, double** %8, align 8, !dbg !509
  %55 = load i64, i64* %10, align 8, !dbg !510
  %56 = mul nsw i64 %55, %13, !dbg !509
  %57 = getelementptr inbounds double, double* %54, i64 %56, !dbg !509
  %58 = load i64, i64* %11, align 8, !dbg !511
  %59 = getelementptr inbounds double, double* %57, i64 %58, !dbg !509
  %60 = load double, double* %59, align 8, !dbg !509
  %61 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %42, i8* noundef getelementptr inbounds ([72 x i8], [72 x i8]* @.str.7, i64 0, i64 0), i64 noundef %43, i64 noundef %44, double noundef %51, i64 noundef %52, i64 noundef %53, double noundef %60), !dbg !512
  store i1 false, i1* %5, align 1, !dbg !513
  br label %71, !dbg !513

62:                                               ; preds = %25
  br label %63, !dbg !514

63:                                               ; preds = %62
  %64 = load i64, i64* %11, align 8, !dbg !515
  %65 = add i64 %64, 1, !dbg !515
  store i64 %65, i64* %11, align 8, !dbg !515
  br label %21, !dbg !516, !llvm.loop !517

66:                                               ; preds = %21
  br label %67, !dbg !519

67:                                               ; preds = %66
  %68 = load i64, i64* %10, align 8, !dbg !520
  %69 = add i64 %68, 1, !dbg !520
  store i64 %69, i64* %10, align 8, !dbg !520
  br label %16, !dbg !521, !llvm.loop !522

70:                                               ; preds = %16
  store i1 true, i1* %5, align 1, !dbg !524
  br label %71, !dbg !524

71:                                               ; preds = %70, %41
  %72 = load i1, i1* %5, align 1, !dbg !525
  ret i1 %72, !dbg !525
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8* noundef, i8* noundef, i32 noundef, i8* noundef) #3

declare i32 @fprintf(%struct._IO_FILE* noundef, i8* noundef, ...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "trans.c", directory: "/afs/andrew.cmu.edu/usr6/srikarg/private/18213/cache-lab-srikarg2006-1")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!10 = distinct !DISubprogram(name: "transpose_1024x1024", scope: !1, file: !1, line: 129, type: !11, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13, !13, !16, !16, !21}
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !14, line: 46, baseType: !15)
!14 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "")
!15 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, elements: !19)
!18 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!19 = !{!20}
!20 = !DISubrange(count: -1)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!22 = !{}
!23 = !DILocalVariable(name: "M", arg: 1, scope: !10, file: !1, line: 129, type: !13)
!24 = !DILocation(line: 129, column: 33, scope: !10)
!25 = !DILocalVariable(name: "N", arg: 2, scope: !10, file: !1, line: 129, type: !13)
!26 = !DILocation(line: 129, column: 43, scope: !10)
!27 = !DILocalVariable(name: "A", arg: 3, scope: !10, file: !1, line: 129, type: !16)
!28 = !DILocation(line: 129, column: 53, scope: !10)
!29 = !DILocalVariable(name: "B", arg: 4, scope: !10, file: !1, line: 129, type: !16)
!30 = !DILocation(line: 129, column: 69, scope: !10)
!31 = !DILocalVariable(name: "tmp", arg: 5, scope: !10, file: !1, line: 130, type: !21)
!32 = !DILocation(line: 130, column: 33, scope: !10)
!33 = !DILocation(line: 129, column: 55, scope: !10)
!34 = !DILocation(line: 129, column: 58, scope: !10)
!35 = !DILocation(line: 129, column: 71, scope: !10)
!36 = !DILocation(line: 129, column: 74, scope: !10)
!37 = !DILocalVariable(name: "tile_size", scope: !10, file: !1, line: 131, type: !13)
!38 = !DILocation(line: 131, column: 12, scope: !10)
!39 = !DILocalVariable(name: "i", scope: !40, file: !1, line: 133, type: !13)
!40 = distinct !DILexicalBlock(scope: !10, file: !1, line: 133, column: 5)
!41 = !DILocation(line: 133, column: 17, scope: !40)
!42 = !DILocation(line: 133, column: 10, scope: !40)
!43 = !DILocation(line: 133, column: 24, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !1, line: 133, column: 5)
!45 = !DILocation(line: 133, column: 28, scope: !44)
!46 = !DILocation(line: 133, column: 26, scope: !44)
!47 = !DILocation(line: 133, column: 5, scope: !40)
!48 = !DILocalVariable(name: "j", scope: !49, file: !1, line: 134, type: !13)
!49 = distinct !DILexicalBlock(scope: !50, file: !1, line: 134, column: 9)
!50 = distinct !DILexicalBlock(scope: !44, file: !1, line: 133, column: 47)
!51 = !DILocation(line: 134, column: 21, scope: !49)
!52 = !DILocation(line: 134, column: 14, scope: !49)
!53 = !DILocation(line: 134, column: 28, scope: !54)
!54 = distinct !DILexicalBlock(scope: !49, file: !1, line: 134, column: 9)
!55 = !DILocation(line: 134, column: 32, scope: !54)
!56 = !DILocation(line: 134, column: 30, scope: !54)
!57 = !DILocation(line: 134, column: 9, scope: !49)
!58 = !DILocalVariable(name: "x", scope: !59, file: !1, line: 135, type: !13)
!59 = distinct !DILexicalBlock(scope: !60, file: !1, line: 135, column: 13)
!60 = distinct !DILexicalBlock(scope: !54, file: !1, line: 134, column: 51)
!61 = !DILocation(line: 135, column: 25, scope: !59)
!62 = !DILocation(line: 135, column: 29, scope: !59)
!63 = !DILocation(line: 135, column: 18, scope: !59)
!64 = !DILocation(line: 135, column: 32, scope: !65)
!65 = distinct !DILexicalBlock(scope: !59, file: !1, line: 135, column: 13)
!66 = !DILocation(line: 135, column: 36, scope: !65)
!67 = !DILocation(line: 135, column: 40, scope: !65)
!68 = !DILocation(line: 135, column: 38, scope: !65)
!69 = !DILocation(line: 135, column: 34, scope: !65)
!70 = !DILocation(line: 135, column: 13, scope: !59)
!71 = !DILocalVariable(name: "y", scope: !72, file: !1, line: 136, type: !13)
!72 = distinct !DILexicalBlock(scope: !73, file: !1, line: 136, column: 17)
!73 = distinct !DILexicalBlock(scope: !65, file: !1, line: 135, column: 56)
!74 = !DILocation(line: 136, column: 29, scope: !72)
!75 = !DILocation(line: 136, column: 33, scope: !72)
!76 = !DILocation(line: 136, column: 22, scope: !72)
!77 = !DILocation(line: 136, column: 36, scope: !78)
!78 = distinct !DILexicalBlock(scope: !72, file: !1, line: 136, column: 17)
!79 = !DILocation(line: 136, column: 40, scope: !78)
!80 = !DILocation(line: 136, column: 44, scope: !78)
!81 = !DILocation(line: 136, column: 42, scope: !78)
!82 = !DILocation(line: 136, column: 38, scope: !78)
!83 = !DILocation(line: 136, column: 17, scope: !72)
!84 = !DILocation(line: 137, column: 31, scope: !85)
!85 = distinct !DILexicalBlock(scope: !78, file: !1, line: 136, column: 60)
!86 = !DILocation(line: 137, column: 33, scope: !85)
!87 = !DILocation(line: 137, column: 36, scope: !85)
!88 = !DILocation(line: 137, column: 21, scope: !85)
!89 = !DILocation(line: 137, column: 23, scope: !85)
!90 = !DILocation(line: 137, column: 26, scope: !85)
!91 = !DILocation(line: 137, column: 29, scope: !85)
!92 = !DILocation(line: 138, column: 17, scope: !85)
!93 = !DILocation(line: 136, column: 56, scope: !78)
!94 = !DILocation(line: 136, column: 17, scope: !78)
!95 = distinct !{!95, !83, !96}
!96 = !DILocation(line: 138, column: 17, scope: !72)
!97 = !DILocation(line: 139, column: 13, scope: !73)
!98 = !DILocation(line: 135, column: 52, scope: !65)
!99 = !DILocation(line: 135, column: 13, scope: !65)
!100 = distinct !{!100, !70, !101}
!101 = !DILocation(line: 139, column: 13, scope: !59)
!102 = !DILocation(line: 140, column: 9, scope: !60)
!103 = !DILocation(line: 134, column: 40, scope: !54)
!104 = !DILocation(line: 134, column: 37, scope: !54)
!105 = !DILocation(line: 134, column: 9, scope: !54)
!106 = distinct !{!106, !57, !107}
!107 = !DILocation(line: 140, column: 9, scope: !49)
!108 = !DILocation(line: 141, column: 5, scope: !50)
!109 = !DILocation(line: 133, column: 36, scope: !44)
!110 = !DILocation(line: 133, column: 33, scope: !44)
!111 = !DILocation(line: 133, column: 5, scope: !44)
!112 = distinct !{!112, !47, !113}
!113 = !DILocation(line: 141, column: 5, scope: !40)
!114 = !DILocation(line: 142, column: 1, scope: !10)
!115 = distinct !DISubprogram(name: "transpose_32x32", scope: !1, file: !1, line: 166, type: !11, scopeLine: 167, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!116 = !DILocalVariable(name: "M", arg: 1, scope: !115, file: !1, line: 166, type: !13)
!117 = !DILocation(line: 166, column: 29, scope: !115)
!118 = !DILocalVariable(name: "N", arg: 2, scope: !115, file: !1, line: 166, type: !13)
!119 = !DILocation(line: 166, column: 39, scope: !115)
!120 = !DILocalVariable(name: "A", arg: 3, scope: !115, file: !1, line: 166, type: !16)
!121 = !DILocation(line: 166, column: 49, scope: !115)
!122 = !DILocalVariable(name: "B", arg: 4, scope: !115, file: !1, line: 166, type: !16)
!123 = !DILocation(line: 166, column: 65, scope: !115)
!124 = !DILocalVariable(name: "tmp", arg: 5, scope: !115, file: !1, line: 167, type: !21)
!125 = !DILocation(line: 167, column: 29, scope: !115)
!126 = !DILocation(line: 166, column: 51, scope: !115)
!127 = !DILocation(line: 166, column: 54, scope: !115)
!128 = !DILocation(line: 166, column: 67, scope: !115)
!129 = !DILocation(line: 166, column: 70, scope: !115)
!130 = !DILocalVariable(name: "tile_size", scope: !115, file: !1, line: 169, type: !13)
!131 = !DILocation(line: 169, column: 12, scope: !115)
!132 = !DILocalVariable(name: "offset", scope: !115, file: !1, line: 170, type: !13)
!133 = !DILocation(line: 170, column: 12, scope: !115)
!134 = !DILocation(line: 170, column: 21, scope: !115)
!135 = !DILocation(line: 170, column: 31, scope: !115)
!136 = !DILocalVariable(name: "i", scope: !137, file: !1, line: 172, type: !13)
!137 = distinct !DILexicalBlock(scope: !115, file: !1, line: 172, column: 5)
!138 = !DILocation(line: 172, column: 17, scope: !137)
!139 = !DILocation(line: 172, column: 10, scope: !137)
!140 = !DILocation(line: 172, column: 24, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !1, line: 172, column: 5)
!142 = !DILocation(line: 172, column: 28, scope: !141)
!143 = !DILocation(line: 172, column: 26, scope: !141)
!144 = !DILocation(line: 172, column: 5, scope: !137)
!145 = !DILocalVariable(name: "j", scope: !146, file: !1, line: 173, type: !13)
!146 = distinct !DILexicalBlock(scope: !147, file: !1, line: 173, column: 9)
!147 = distinct !DILexicalBlock(scope: !141, file: !1, line: 172, column: 47)
!148 = !DILocation(line: 173, column: 21, scope: !146)
!149 = !DILocation(line: 173, column: 14, scope: !146)
!150 = !DILocation(line: 173, column: 28, scope: !151)
!151 = distinct !DILexicalBlock(scope: !146, file: !1, line: 173, column: 9)
!152 = !DILocation(line: 173, column: 32, scope: !151)
!153 = !DILocation(line: 173, column: 30, scope: !151)
!154 = !DILocation(line: 173, column: 9, scope: !146)
!155 = !DILocalVariable(name: "x", scope: !156, file: !1, line: 174, type: !13)
!156 = distinct !DILexicalBlock(scope: !157, file: !1, line: 174, column: 13)
!157 = distinct !DILexicalBlock(scope: !151, file: !1, line: 173, column: 51)
!158 = !DILocation(line: 174, column: 25, scope: !156)
!159 = !DILocation(line: 174, column: 18, scope: !156)
!160 = !DILocation(line: 174, column: 32, scope: !161)
!161 = distinct !DILexicalBlock(scope: !156, file: !1, line: 174, column: 13)
!162 = !DILocation(line: 174, column: 36, scope: !161)
!163 = !DILocation(line: 174, column: 34, scope: !161)
!164 = !DILocation(line: 174, column: 13, scope: !156)
!165 = !DILocalVariable(name: "y", scope: !166, file: !1, line: 175, type: !13)
!166 = distinct !DILexicalBlock(scope: !167, file: !1, line: 175, column: 17)
!167 = distinct !DILexicalBlock(scope: !161, file: !1, line: 174, column: 52)
!168 = !DILocation(line: 175, column: 29, scope: !166)
!169 = !DILocation(line: 175, column: 22, scope: !166)
!170 = !DILocation(line: 175, column: 36, scope: !171)
!171 = distinct !DILexicalBlock(scope: !166, file: !1, line: 175, column: 17)
!172 = !DILocation(line: 175, column: 40, scope: !171)
!173 = !DILocation(line: 175, column: 38, scope: !171)
!174 = !DILocation(line: 175, column: 17, scope: !166)
!175 = !DILocation(line: 176, column: 25, scope: !176)
!176 = distinct !DILexicalBlock(scope: !177, file: !1, line: 176, column: 25)
!177 = distinct !DILexicalBlock(scope: !171, file: !1, line: 175, column: 56)
!178 = !DILocation(line: 176, column: 29, scope: !176)
!179 = !DILocation(line: 176, column: 27, scope: !176)
!180 = !DILocation(line: 176, column: 34, scope: !176)
!181 = !DILocation(line: 176, column: 38, scope: !176)
!182 = !DILocation(line: 176, column: 36, scope: !176)
!183 = !DILocation(line: 176, column: 31, scope: !176)
!184 = !DILocation(line: 176, column: 25, scope: !177)
!185 = !DILocation(line: 177, column: 43, scope: !186)
!186 = distinct !DILexicalBlock(scope: !176, file: !1, line: 176, column: 41)
!187 = !DILocation(line: 177, column: 45, scope: !186)
!188 = !DILocation(line: 177, column: 49, scope: !186)
!189 = !DILocation(line: 177, column: 47, scope: !186)
!190 = !DILocation(line: 177, column: 52, scope: !186)
!191 = !DILocation(line: 177, column: 56, scope: !186)
!192 = !DILocation(line: 177, column: 54, scope: !186)
!193 = !DILocation(line: 177, column: 25, scope: !186)
!194 = !DILocation(line: 177, column: 27, scope: !186)
!195 = !DILocation(line: 177, column: 31, scope: !186)
!196 = !DILocation(line: 177, column: 29, scope: !186)
!197 = !DILocation(line: 177, column: 34, scope: !186)
!198 = !DILocation(line: 177, column: 38, scope: !186)
!199 = !DILocation(line: 177, column: 36, scope: !186)
!200 = !DILocation(line: 177, column: 41, scope: !186)
!201 = !DILocation(line: 178, column: 21, scope: !186)
!202 = !DILocation(line: 179, column: 25, scope: !203)
!203 = distinct !DILexicalBlock(scope: !177, file: !1, line: 179, column: 25)
!204 = !DILocation(line: 179, column: 30, scope: !203)
!205 = !DILocation(line: 179, column: 27, scope: !203)
!206 = !DILocation(line: 179, column: 32, scope: !203)
!207 = !DILocation(line: 179, column: 36, scope: !203)
!208 = !DILocation(line: 179, column: 41, scope: !203)
!209 = !DILocation(line: 179, column: 38, scope: !203)
!210 = !DILocation(line: 179, column: 25, scope: !177)
!211 = !DILocation(line: 180, column: 43, scope: !212)
!212 = distinct !DILexicalBlock(scope: !203, file: !1, line: 179, column: 50)
!213 = !DILocation(line: 180, column: 45, scope: !212)
!214 = !DILocation(line: 180, column: 49, scope: !212)
!215 = !DILocation(line: 180, column: 47, scope: !212)
!216 = !DILocation(line: 180, column: 52, scope: !212)
!217 = !DILocation(line: 180, column: 56, scope: !212)
!218 = !DILocation(line: 180, column: 54, scope: !212)
!219 = !DILocation(line: 180, column: 25, scope: !212)
!220 = !DILocation(line: 180, column: 27, scope: !212)
!221 = !DILocation(line: 180, column: 31, scope: !212)
!222 = !DILocation(line: 180, column: 29, scope: !212)
!223 = !DILocation(line: 180, column: 34, scope: !212)
!224 = !DILocation(line: 180, column: 38, scope: !212)
!225 = !DILocation(line: 180, column: 36, scope: !212)
!226 = !DILocation(line: 180, column: 41, scope: !212)
!227 = !DILocation(line: 181, column: 21, scope: !212)
!228 = !DILocation(line: 182, column: 17, scope: !177)
!229 = !DILocation(line: 175, column: 52, scope: !171)
!230 = !DILocation(line: 175, column: 17, scope: !171)
!231 = distinct !{!231, !174, !232}
!232 = !DILocation(line: 182, column: 17, scope: !166)
!233 = !DILocation(line: 183, column: 13, scope: !167)
!234 = !DILocation(line: 174, column: 48, scope: !161)
!235 = !DILocation(line: 174, column: 13, scope: !161)
!236 = distinct !{!236, !164, !237}
!237 = !DILocation(line: 183, column: 13, scope: !156)
!238 = !DILocation(line: 184, column: 9, scope: !157)
!239 = !DILocation(line: 173, column: 40, scope: !151)
!240 = !DILocation(line: 173, column: 37, scope: !151)
!241 = !DILocation(line: 173, column: 9, scope: !151)
!242 = distinct !{!242, !154, !243}
!243 = !DILocation(line: 184, column: 9, scope: !146)
!244 = !DILocation(line: 185, column: 5, scope: !147)
!245 = !DILocation(line: 172, column: 36, scope: !141)
!246 = !DILocation(line: 172, column: 33, scope: !141)
!247 = !DILocation(line: 172, column: 5, scope: !141)
!248 = distinct !{!248, !144, !249}
!249 = !DILocation(line: 185, column: 5, scope: !137)
!250 = !DILocation(line: 186, column: 1, scope: !115)
!251 = distinct !DISubprogram(name: "registerFunctions", scope: !1, file: !1, line: 223, type: !252, scopeLine: 223, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!252 = !DISubroutineType(types: !253)
!253 = !{null}
!254 = !DILocation(line: 225, column: 5, scope: !251)
!255 = !DILocation(line: 228, column: 5, scope: !251)
!256 = !DILocation(line: 229, column: 5, scope: !251)
!257 = !DILocation(line: 230, column: 5, scope: !251)
!258 = !DILocation(line: 232, column: 5, scope: !251)
!259 = !DILocation(line: 233, column: 1, scope: !251)
!260 = distinct !DISubprogram(name: "transpose_submit", scope: !1, file: !1, line: 195, type: !11, scopeLine: 196, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!261 = !DILocalVariable(name: "M", arg: 1, scope: !260, file: !1, line: 195, type: !13)
!262 = !DILocation(line: 195, column: 37, scope: !260)
!263 = !DILocalVariable(name: "N", arg: 2, scope: !260, file: !1, line: 195, type: !13)
!264 = !DILocation(line: 195, column: 47, scope: !260)
!265 = !DILocalVariable(name: "A", arg: 3, scope: !260, file: !1, line: 195, type: !16)
!266 = !DILocation(line: 195, column: 57, scope: !260)
!267 = !DILocalVariable(name: "B", arg: 4, scope: !260, file: !1, line: 195, type: !16)
!268 = !DILocation(line: 195, column: 73, scope: !260)
!269 = !DILocalVariable(name: "tmp", arg: 5, scope: !260, file: !1, line: 196, type: !21)
!270 = !DILocation(line: 196, column: 37, scope: !260)
!271 = !DILocation(line: 195, column: 59, scope: !260)
!272 = !DILocation(line: 195, column: 62, scope: !260)
!273 = !DILocation(line: 195, column: 75, scope: !260)
!274 = !DILocation(line: 195, column: 78, scope: !260)
!275 = !DILocation(line: 198, column: 9, scope: !276)
!276 = distinct !DILexicalBlock(scope: !260, file: !1, line: 198, column: 9)
!277 = !DILocation(line: 198, column: 11, scope: !276)
!278 = !DILocation(line: 198, column: 17, scope: !276)
!279 = !DILocation(line: 198, column: 20, scope: !276)
!280 = !DILocation(line: 198, column: 22, scope: !276)
!281 = !DILocation(line: 198, column: 9, scope: !260)
!282 = !DILocation(line: 199, column: 25, scope: !283)
!283 = distinct !DILexicalBlock(scope: !276, file: !1, line: 198, column: 29)
!284 = !DILocation(line: 199, column: 28, scope: !283)
!285 = !DILocation(line: 199, column: 31, scope: !283)
!286 = !DILocation(line: 199, column: 34, scope: !283)
!287 = !DILocation(line: 199, column: 37, scope: !283)
!288 = !DILocation(line: 199, column: 9, scope: !283)
!289 = !DILocation(line: 200, column: 9, scope: !283)
!290 = !DILocation(line: 203, column: 9, scope: !291)
!291 = distinct !DILexicalBlock(scope: !260, file: !1, line: 203, column: 9)
!292 = !DILocation(line: 203, column: 11, scope: !291)
!293 = !DILocation(line: 203, column: 19, scope: !291)
!294 = !DILocation(line: 203, column: 22, scope: !291)
!295 = !DILocation(line: 203, column: 24, scope: !291)
!296 = !DILocation(line: 203, column: 9, scope: !260)
!297 = !DILocation(line: 204, column: 29, scope: !298)
!298 = distinct !DILexicalBlock(scope: !291, file: !1, line: 203, column: 33)
!299 = !DILocation(line: 204, column: 32, scope: !298)
!300 = !DILocation(line: 204, column: 35, scope: !298)
!301 = !DILocation(line: 204, column: 38, scope: !298)
!302 = !DILocation(line: 204, column: 41, scope: !298)
!303 = !DILocation(line: 204, column: 9, scope: !298)
!304 = !DILocation(line: 205, column: 9, scope: !298)
!305 = !DILocation(line: 208, column: 9, scope: !306)
!306 = distinct !DILexicalBlock(scope: !260, file: !1, line: 208, column: 9)
!307 = !DILocation(line: 208, column: 14, scope: !306)
!308 = !DILocation(line: 208, column: 11, scope: !306)
!309 = !DILocation(line: 208, column: 9, scope: !260)
!310 = !DILocation(line: 209, column: 21, scope: !306)
!311 = !DILocation(line: 209, column: 24, scope: !306)
!312 = !DILocation(line: 209, column: 27, scope: !306)
!313 = !DILocation(line: 209, column: 30, scope: !306)
!314 = !DILocation(line: 209, column: 33, scope: !306)
!315 = !DILocation(line: 209, column: 9, scope: !306)
!316 = !DILocation(line: 211, column: 19, scope: !306)
!317 = !DILocation(line: 211, column: 22, scope: !306)
!318 = !DILocation(line: 211, column: 25, scope: !306)
!319 = !DILocation(line: 211, column: 28, scope: !306)
!320 = !DILocation(line: 211, column: 31, scope: !306)
!321 = !DILocation(line: 211, column: 9, scope: !306)
!322 = !DILocation(line: 213, column: 5, scope: !260)
!323 = !DILocation(line: 214, column: 1, scope: !260)
!324 = distinct !DISubprogram(name: "trans_basic", scope: !1, file: !1, line: 81, type: !11, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!325 = !DILocalVariable(name: "M", arg: 1, scope: !324, file: !1, line: 81, type: !13)
!326 = !DILocation(line: 81, column: 32, scope: !324)
!327 = !DILocalVariable(name: "N", arg: 2, scope: !324, file: !1, line: 81, type: !13)
!328 = !DILocation(line: 81, column: 42, scope: !324)
!329 = !DILocalVariable(name: "A", arg: 3, scope: !324, file: !1, line: 81, type: !16)
!330 = !DILocation(line: 81, column: 52, scope: !324)
!331 = !DILocalVariable(name: "B", arg: 4, scope: !324, file: !1, line: 81, type: !16)
!332 = !DILocation(line: 81, column: 68, scope: !324)
!333 = !DILocalVariable(name: "tmp", arg: 5, scope: !324, file: !1, line: 82, type: !21)
!334 = !DILocation(line: 82, column: 32, scope: !324)
!335 = !DILocation(line: 81, column: 54, scope: !324)
!336 = !DILocation(line: 81, column: 57, scope: !324)
!337 = !DILocation(line: 81, column: 70, scope: !324)
!338 = !DILocation(line: 81, column: 73, scope: !324)
!339 = !DILocation(line: 83, column: 5, scope: !324)
!340 = !DILocation(line: 84, column: 5, scope: !324)
!341 = !DILocalVariable(name: "i", scope: !342, file: !1, line: 86, type: !13)
!342 = distinct !DILexicalBlock(scope: !324, file: !1, line: 86, column: 5)
!343 = !DILocation(line: 86, column: 17, scope: !342)
!344 = !DILocation(line: 86, column: 10, scope: !342)
!345 = !DILocation(line: 86, column: 24, scope: !346)
!346 = distinct !DILexicalBlock(scope: !342, file: !1, line: 86, column: 5)
!347 = !DILocation(line: 86, column: 28, scope: !346)
!348 = !DILocation(line: 86, column: 26, scope: !346)
!349 = !DILocation(line: 86, column: 5, scope: !342)
!350 = !DILocalVariable(name: "j", scope: !351, file: !1, line: 87, type: !13)
!351 = distinct !DILexicalBlock(scope: !352, file: !1, line: 87, column: 9)
!352 = distinct !DILexicalBlock(scope: !346, file: !1, line: 86, column: 36)
!353 = !DILocation(line: 87, column: 21, scope: !351)
!354 = !DILocation(line: 87, column: 14, scope: !351)
!355 = !DILocation(line: 87, column: 28, scope: !356)
!356 = distinct !DILexicalBlock(scope: !351, file: !1, line: 87, column: 9)
!357 = !DILocation(line: 87, column: 32, scope: !356)
!358 = !DILocation(line: 87, column: 30, scope: !356)
!359 = !DILocation(line: 87, column: 9, scope: !351)
!360 = !DILocation(line: 88, column: 23, scope: !361)
!361 = distinct !DILexicalBlock(scope: !356, file: !1, line: 87, column: 40)
!362 = !DILocation(line: 88, column: 25, scope: !361)
!363 = !DILocation(line: 88, column: 28, scope: !361)
!364 = !DILocation(line: 88, column: 13, scope: !361)
!365 = !DILocation(line: 88, column: 15, scope: !361)
!366 = !DILocation(line: 88, column: 18, scope: !361)
!367 = !DILocation(line: 88, column: 21, scope: !361)
!368 = !DILocation(line: 89, column: 9, scope: !361)
!369 = !DILocation(line: 87, column: 36, scope: !356)
!370 = !DILocation(line: 87, column: 9, scope: !356)
!371 = distinct !{!371, !359, !372}
!372 = !DILocation(line: 89, column: 9, scope: !351)
!373 = !DILocation(line: 90, column: 5, scope: !352)
!374 = !DILocation(line: 86, column: 32, scope: !346)
!375 = !DILocation(line: 86, column: 5, scope: !346)
!376 = distinct !{!376, !349, !377}
!377 = !DILocation(line: 90, column: 5, scope: !342)
!378 = !DILocation(line: 92, column: 5, scope: !324)
!379 = !DILocation(line: 93, column: 1, scope: !324)
!380 = distinct !DISubprogram(name: "trans_tmp", scope: !1, file: !1, line: 101, type: !11, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!381 = !DILocalVariable(name: "M", arg: 1, scope: !380, file: !1, line: 101, type: !13)
!382 = !DILocation(line: 101, column: 30, scope: !380)
!383 = !DILocalVariable(name: "N", arg: 2, scope: !380, file: !1, line: 101, type: !13)
!384 = !DILocation(line: 101, column: 40, scope: !380)
!385 = !DILocalVariable(name: "A", arg: 3, scope: !380, file: !1, line: 101, type: !16)
!386 = !DILocation(line: 101, column: 50, scope: !380)
!387 = !DILocalVariable(name: "B", arg: 4, scope: !380, file: !1, line: 101, type: !16)
!388 = !DILocation(line: 101, column: 66, scope: !380)
!389 = !DILocalVariable(name: "tmp", arg: 5, scope: !380, file: !1, line: 102, type: !21)
!390 = !DILocation(line: 102, column: 30, scope: !380)
!391 = !DILocation(line: 101, column: 52, scope: !380)
!392 = !DILocation(line: 101, column: 55, scope: !380)
!393 = !DILocation(line: 101, column: 68, scope: !380)
!394 = !DILocation(line: 101, column: 71, scope: !380)
!395 = !DILocation(line: 103, column: 5, scope: !380)
!396 = !DILocation(line: 104, column: 5, scope: !380)
!397 = !DILocalVariable(name: "i", scope: !398, file: !1, line: 106, type: !13)
!398 = distinct !DILexicalBlock(scope: !380, file: !1, line: 106, column: 5)
!399 = !DILocation(line: 106, column: 17, scope: !398)
!400 = !DILocation(line: 106, column: 10, scope: !398)
!401 = !DILocation(line: 106, column: 24, scope: !402)
!402 = distinct !DILexicalBlock(scope: !398, file: !1, line: 106, column: 5)
!403 = !DILocation(line: 106, column: 28, scope: !402)
!404 = !DILocation(line: 106, column: 26, scope: !402)
!405 = !DILocation(line: 106, column: 5, scope: !398)
!406 = !DILocalVariable(name: "j", scope: !407, file: !1, line: 107, type: !13)
!407 = distinct !DILexicalBlock(scope: !408, file: !1, line: 107, column: 9)
!408 = distinct !DILexicalBlock(scope: !402, file: !1, line: 106, column: 36)
!409 = !DILocation(line: 107, column: 21, scope: !407)
!410 = !DILocation(line: 107, column: 14, scope: !407)
!411 = !DILocation(line: 107, column: 28, scope: !412)
!412 = distinct !DILexicalBlock(scope: !407, file: !1, line: 107, column: 9)
!413 = !DILocation(line: 107, column: 32, scope: !412)
!414 = !DILocation(line: 107, column: 30, scope: !412)
!415 = !DILocation(line: 107, column: 9, scope: !407)
!416 = !DILocalVariable(name: "di", scope: !417, file: !1, line: 108, type: !13)
!417 = distinct !DILexicalBlock(scope: !412, file: !1, line: 107, column: 40)
!418 = !DILocation(line: 108, column: 20, scope: !417)
!419 = !DILocation(line: 108, column: 25, scope: !417)
!420 = !DILocation(line: 108, column: 27, scope: !417)
!421 = !DILocalVariable(name: "dj", scope: !417, file: !1, line: 109, type: !13)
!422 = !DILocation(line: 109, column: 20, scope: !417)
!423 = !DILocation(line: 109, column: 25, scope: !417)
!424 = !DILocation(line: 109, column: 27, scope: !417)
!425 = !DILocation(line: 110, column: 32, scope: !417)
!426 = !DILocation(line: 110, column: 34, scope: !417)
!427 = !DILocation(line: 110, column: 37, scope: !417)
!428 = !DILocation(line: 110, column: 13, scope: !417)
!429 = !DILocation(line: 110, column: 21, scope: !417)
!430 = !DILocation(line: 110, column: 19, scope: !417)
!431 = !DILocation(line: 110, column: 26, scope: !417)
!432 = !DILocation(line: 110, column: 24, scope: !417)
!433 = !DILocation(line: 110, column: 30, scope: !417)
!434 = !DILocation(line: 111, column: 23, scope: !417)
!435 = !DILocation(line: 111, column: 31, scope: !417)
!436 = !DILocation(line: 111, column: 29, scope: !417)
!437 = !DILocation(line: 111, column: 36, scope: !417)
!438 = !DILocation(line: 111, column: 34, scope: !417)
!439 = !DILocation(line: 111, column: 13, scope: !417)
!440 = !DILocation(line: 111, column: 15, scope: !417)
!441 = !DILocation(line: 111, column: 18, scope: !417)
!442 = !DILocation(line: 111, column: 21, scope: !417)
!443 = !DILocation(line: 112, column: 9, scope: !417)
!444 = !DILocation(line: 107, column: 36, scope: !412)
!445 = !DILocation(line: 107, column: 9, scope: !412)
!446 = distinct !{!446, !415, !447}
!447 = !DILocation(line: 112, column: 9, scope: !407)
!448 = !DILocation(line: 113, column: 5, scope: !408)
!449 = !DILocation(line: 106, column: 32, scope: !402)
!450 = !DILocation(line: 106, column: 5, scope: !402)
!451 = distinct !{!451, !405, !452}
!452 = !DILocation(line: 113, column: 5, scope: !398)
!453 = !DILocation(line: 115, column: 5, scope: !380)
!454 = !DILocation(line: 116, column: 1, scope: !380)
!455 = distinct !DISubprogram(name: "is_transpose", scope: !1, file: !1, line: 52, type: !456, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!456 = !DISubroutineType(types: !457)
!457 = !{!458, !13, !13, !16, !16}
!458 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!459 = !DILocalVariable(name: "M", arg: 1, scope: !455, file: !1, line: 52, type: !13)
!460 = !DILocation(line: 52, column: 33, scope: !455)
!461 = !DILocalVariable(name: "N", arg: 2, scope: !455, file: !1, line: 52, type: !13)
!462 = !DILocation(line: 52, column: 43, scope: !455)
!463 = !DILocalVariable(name: "A", arg: 3, scope: !455, file: !1, line: 52, type: !16)
!464 = !DILocation(line: 52, column: 53, scope: !455)
!465 = !DILocalVariable(name: "B", arg: 4, scope: !455, file: !1, line: 52, type: !16)
!466 = !DILocation(line: 52, column: 69, scope: !455)
!467 = !DILocation(line: 52, column: 55, scope: !455)
!468 = !DILocation(line: 52, column: 58, scope: !455)
!469 = !DILocation(line: 52, column: 71, scope: !455)
!470 = !DILocation(line: 52, column: 74, scope: !455)
!471 = !DILocalVariable(name: "i", scope: !472, file: !1, line: 53, type: !13)
!472 = distinct !DILexicalBlock(scope: !455, file: !1, line: 53, column: 5)
!473 = !DILocation(line: 53, column: 17, scope: !472)
!474 = !DILocation(line: 53, column: 10, scope: !472)
!475 = !DILocation(line: 53, column: 24, scope: !476)
!476 = distinct !DILexicalBlock(scope: !472, file: !1, line: 53, column: 5)
!477 = !DILocation(line: 53, column: 28, scope: !476)
!478 = !DILocation(line: 53, column: 26, scope: !476)
!479 = !DILocation(line: 53, column: 5, scope: !472)
!480 = !DILocalVariable(name: "j", scope: !481, file: !1, line: 54, type: !13)
!481 = distinct !DILexicalBlock(scope: !482, file: !1, line: 54, column: 9)
!482 = distinct !DILexicalBlock(scope: !476, file: !1, line: 53, column: 36)
!483 = !DILocation(line: 54, column: 21, scope: !481)
!484 = !DILocation(line: 54, column: 14, scope: !481)
!485 = !DILocation(line: 54, column: 28, scope: !486)
!486 = distinct !DILexicalBlock(scope: !481, file: !1, line: 54, column: 9)
!487 = !DILocation(line: 54, column: 32, scope: !486)
!488 = !DILocation(line: 54, column: 30, scope: !486)
!489 = !DILocation(line: 54, column: 9, scope: !481)
!490 = !DILocation(line: 55, column: 17, scope: !491)
!491 = distinct !DILexicalBlock(scope: !492, file: !1, line: 55, column: 17)
!492 = distinct !DILexicalBlock(scope: !486, file: !1, line: 54, column: 40)
!493 = !DILocation(line: 55, column: 19, scope: !491)
!494 = !DILocation(line: 55, column: 22, scope: !491)
!495 = !DILocation(line: 55, column: 28, scope: !491)
!496 = !DILocation(line: 55, column: 30, scope: !491)
!497 = !DILocation(line: 55, column: 33, scope: !491)
!498 = !DILocation(line: 55, column: 25, scope: !491)
!499 = !DILocation(line: 55, column: 17, scope: !492)
!500 = !DILocation(line: 56, column: 25, scope: !501)
!501 = distinct !DILexicalBlock(scope: !491, file: !1, line: 55, column: 37)
!502 = !DILocation(line: 59, column: 25, scope: !501)
!503 = !DILocation(line: 59, column: 28, scope: !501)
!504 = !DILocation(line: 59, column: 31, scope: !501)
!505 = !DILocation(line: 59, column: 33, scope: !501)
!506 = !DILocation(line: 59, column: 36, scope: !501)
!507 = !DILocation(line: 59, column: 40, scope: !501)
!508 = !DILocation(line: 59, column: 43, scope: !501)
!509 = !DILocation(line: 59, column: 46, scope: !501)
!510 = !DILocation(line: 59, column: 48, scope: !501)
!511 = !DILocation(line: 59, column: 51, scope: !501)
!512 = !DILocation(line: 56, column: 17, scope: !501)
!513 = !DILocation(line: 60, column: 17, scope: !501)
!514 = !DILocation(line: 62, column: 9, scope: !492)
!515 = !DILocation(line: 54, column: 35, scope: !486)
!516 = !DILocation(line: 54, column: 9, scope: !486)
!517 = distinct !{!517, !489, !518}
!518 = !DILocation(line: 62, column: 9, scope: !481)
!519 = !DILocation(line: 63, column: 5, scope: !482)
!520 = !DILocation(line: 53, column: 32, scope: !476)
!521 = !DILocation(line: 53, column: 5, scope: !476)
!522 = distinct !{!522, !479, !523}
!523 = !DILocation(line: 63, column: 5, scope: !472)
!524 = !DILocation(line: 64, column: 5, scope: !455)
!525 = !DILocation(line: 65, column: 1, scope: !455)
