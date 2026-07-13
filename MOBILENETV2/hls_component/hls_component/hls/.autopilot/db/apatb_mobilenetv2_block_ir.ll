; ModuleID = 'D:/vitis_research_project/MobileNetV2/hls_component/hls_component/hls/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>" = type { %"struct.ap_fixed_base<16, 8, true, AP_TRN, AP_WRAP, 0>" }
%"struct.ap_fixed_base<16, 8, true, AP_TRN, AP_WRAP, 0>" = type { %"struct.ssdm_int<16, true>" }
%"struct.ssdm_int<16, true>" = type { i16 }

; Function Attrs: inaccessiblemem_or_argmemonly noinline willreturn
define void @apatb_mobilenetv2_block_ir(%"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* noalias nocapture nonnull readonly "maxi" %input_tensor, %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* noalias nocapture nonnull "maxi" %output_tensor, [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="32" %dw_weights, [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="32" %pw_weights) local_unnamed_addr #0 {
entry:
  %input_tensor_copy = alloca i16, align 512
  %output_tensor_copy = alloca i16, align 512
  %0 = bitcast [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]* %dw_weights to [32 x [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]]*
  %dw_weights_copy = alloca [32 x [3 x [3 x i16]]], align 512
  %1 = bitcast [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %pw_weights to [32 x [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]*
  %pw_weights_copy = alloca [32 x [32 x i16]], align 512
  call fastcc void @copy_in(%"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* nonnull %input_tensor, i16* nonnull align 512 %input_tensor_copy, %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* nonnull %output_tensor, i16* nonnull align 512 %output_tensor_copy, [32 x [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]]* nonnull %0, [32 x [3 x [3 x i16]]]* nonnull align 512 %dw_weights_copy, [32 x [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]* nonnull %1, [32 x [32 x i16]]* nonnull align 512 %pw_weights_copy)
  call void @apatb_mobilenetv2_block_hw(i16* %input_tensor_copy, i16* %output_tensor_copy, [32 x [3 x [3 x i16]]]* %dw_weights_copy, [32 x [32 x i16]]* %pw_weights_copy)
  call void @copy_back(%"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* %input_tensor, i16* %input_tensor_copy, %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* %output_tensor, i16* %output_tensor_copy, [32 x [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]]* %0, [32 x [3 x [3 x i16]]]* %dw_weights_copy, [32 x [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]* %1, [32 x [32 x i16]]* %pw_weights_copy)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in(%"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* noalias readonly "unpacked"="0", i16* noalias nocapture align 512 "unpacked"="1.0", %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* noalias readonly "unpacked"="2", i16* noalias nocapture align 512 "unpacked"="3.0", [32 x [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]]* noalias readonly "unpacked"="4", [32 x [3 x [3 x i16]]]* noalias align 512 "unpacked"="5", [32 x [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]* noalias readonly "unpacked"="6", [32 x [32 x i16]]* noalias align 512 "unpacked"="7") unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>.16"(i16* align 512 %1, %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* %0)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>.16"(i16* align 512 %3, %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* %2)
  call fastcc void @"onebyonecpy_hls.p0a32a3a3struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>.43"([32 x [3 x [3 x i16]]]* align 512 %5, [32 x [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]]* %4)
  call fastcc void @"onebyonecpy_hls.p0a32a32struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"([32 x [32 x i16]]* align 512 %7, [32 x [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]* %6)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a32a3a3struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"([32 x [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]]* noalias %dst, [32 x [3 x [3 x i16]]]* noalias readonly align 512 %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [32 x [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]]* %dst, null
  %1 = icmp eq [32 x [3 x [3 x i16]]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a32a3a3struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"([32 x [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]]* nonnull %dst, [32 x [3 x [3 x i16]]]* nonnull %src, i64 32)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a32a3a3struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"([32 x [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]]* %dst, [32 x [3 x [3 x i16]]]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [32 x [3 x [3 x i16]]]* %src, null
  %1 = icmp eq [32 x [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [32 x [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]], [32 x [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]]* %dst, i64 0, i64 %for.loop.idx2
  %3 = getelementptr [32 x [3 x [3 x i16]]], [32 x [3 x [3 x i16]]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a3a3struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"([3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]* %dst.addr, [3 x [3 x i16]]* %3, i64 3)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a3a3struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"([3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]* %dst, [3 x [3 x i16]]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [3 x [3 x i16]]* %src, null
  %1 = icmp eq [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]], [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]* %dst, i64 0, i64 %for.loop.idx2
  %3 = getelementptr [3 x [3 x i16]], [3 x [3 x i16]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a3struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"([3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %dst.addr, [3 x i16]* %3, i64 3)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a3struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"([3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %dst, [3 x i16]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [3 x i16]* %src, null
  %1 = icmp eq [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %3 = getelementptr [3 x i16], [3 x i16]* %src, i64 0, i64 %for.loop.idx8
  %dst.addr.0.0.06 = getelementptr [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"], [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %dst, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %4 = load i16, i16* %3, align 2
  store i16 %4, i16* %dst.addr.0.0.06, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a32a32struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"([32 x [32 x i16]]* noalias align 512 %dst, [32 x [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [32 x [32 x i16]]* %dst, null
  %1 = icmp eq [32 x [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a32a32struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"([32 x [32 x i16]]* nonnull %dst, [32 x [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]* nonnull %src, i64 32)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a32a32struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"([32 x [32 x i16]]* %dst, [32 x [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [32 x [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]* %src, null
  %1 = icmp eq [32 x [32 x i16]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %3 = getelementptr [32 x [32 x i16]], [32 x [32 x i16]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [32 x [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]], [32 x [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a32struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"([32 x i16]* %3, [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %src.addr, i64 32)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a32struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"([32 x i16]* %dst, [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %src, null
  %1 = icmp eq [32 x i16]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"], [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %src, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %3 = getelementptr [32 x i16], [32 x i16]* %dst, i64 0, i64 %for.loop.idx8
  %4 = load i16, i16* %src.addr.0.0.05, align 2
  store i16 %4, i16* %3, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_out(%"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* noalias "unpacked"="0", i16* noalias nocapture readonly align 512 "unpacked"="1.0", %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* noalias "unpacked"="2", i16* noalias nocapture readonly align 512 "unpacked"="3.0", [32 x [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]]* noalias "unpacked"="4", [32 x [3 x [3 x i16]]]* noalias readonly align 512 "unpacked"="5", [32 x [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]* noalias "unpacked"="6", [32 x [32 x i16]]* noalias readonly align 512 "unpacked"="7") unnamed_addr #4 {
entry:
  call fastcc void @"onebyonecpy_hls.p0struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"(%"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* %0, i16* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"(%"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* %2, i16* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0a32a3a3struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"([32 x [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]]* %4, [32 x [3 x [3 x i16]]]* align 512 %5)
  call fastcc void @"onebyonecpy_hls.p0a32a32struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>.29"([32 x [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]* %6, [32 x [32 x i16]]* align 512 %7)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"(%"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* noalias "unpacked"="0" %dst, i16* noalias nocapture readonly align 512 "unpacked"="1.0" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %dst.0.0.04 = getelementptr %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>", %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* %dst, i64 0, i32 0, i32 0, i32 0
  %1 = load i16, i16* %src, align 512
  store i16 %1, i16* %dst.0.0.04, align 2
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>.16"(i16* noalias nocapture align 512 "unpacked"="0.0" %dst, %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* noalias readonly "unpacked"="1" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %src.0.0.03 = getelementptr %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>", %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* %src, i64 0, i32 0, i32 0, i32 0
  %1 = load i16, i16* %src.0.0.03, align 2
  store i16 %1, i16* %dst, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a32a32struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>.29"([32 x [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]* noalias %dst, [32 x [32 x i16]]* noalias readonly align 512 %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [32 x [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]* %dst, null
  %1 = icmp eq [32 x [32 x i16]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a32a32struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>.32"([32 x [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]* nonnull %dst, [32 x [32 x i16]]* nonnull %src, i64 32)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a32a32struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>.32"([32 x [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]* %dst, [32 x [32 x i16]]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [32 x [32 x i16]]* %src, null
  %1 = icmp eq [32 x [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [32 x [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]], [32 x [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]* %dst, i64 0, i64 %for.loop.idx2
  %3 = getelementptr [32 x [32 x i16]], [32 x [32 x i16]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a32struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>.35"([32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %dst.addr, [32 x i16]* %3, i64 32)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a32struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>.35"([32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %dst, [32 x i16]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [32 x i16]* %src, null
  %1 = icmp eq [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %3 = getelementptr [32 x i16], [32 x i16]* %src, i64 0, i64 %for.loop.idx8
  %dst.addr.0.0.06 = getelementptr [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"], [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %dst, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %4 = load i16, i16* %3, align 2
  store i16 %4, i16* %dst.addr.0.0.06, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a32a3a3struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>.43"([32 x [3 x [3 x i16]]]* noalias align 512 %dst, [32 x [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [32 x [3 x [3 x i16]]]* %dst, null
  %1 = icmp eq [32 x [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a32a3a3struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>.46"([32 x [3 x [3 x i16]]]* nonnull %dst, [32 x [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]]* nonnull %src, i64 32)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a32a3a3struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>.46"([32 x [3 x [3 x i16]]]* %dst, [32 x [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [32 x [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]]* %src, null
  %1 = icmp eq [32 x [3 x [3 x i16]]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %3 = getelementptr [32 x [3 x [3 x i16]]], [32 x [3 x [3 x i16]]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [32 x [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]], [32 x [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a3a3struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>.49"([3 x [3 x i16]]* %3, [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]* %src.addr, i64 3)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a3a3struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>.49"([3 x [3 x i16]]* %dst, [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]* %src, null
  %1 = icmp eq [3 x [3 x i16]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %3 = getelementptr [3 x [3 x i16]], [3 x [3 x i16]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]], [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a3struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>.52"([3 x i16]* %3, [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %src.addr, i64 3)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a3struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>.52"([3 x i16]* %dst, [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %src, null
  %1 = icmp eq [3 x i16]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"], [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %src, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %3 = getelementptr [3 x i16], [3 x i16]* %dst, i64 0, i64 %for.loop.idx8
  %4 = load i16, i16* %src.addr.0.0.05, align 2
  store i16 %4, i16* %3, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

declare i8* @malloc(i64)

declare void @free(i8*)

declare void @apatb_mobilenetv2_block_hw(i16*, i16*, [32 x [3 x [3 x i16]]]*, [32 x [32 x i16]]*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back(%"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* noalias "unpacked"="0", i16* noalias nocapture readonly align 512 "unpacked"="1.0", %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* noalias "unpacked"="2", i16* noalias nocapture readonly align 512 "unpacked"="3.0", [32 x [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]]* noalias "unpacked"="4", [32 x [3 x [3 x i16]]]* noalias readonly align 512 "unpacked"="5", [32 x [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]* noalias "unpacked"="6", [32 x [32 x i16]]* noalias readonly align 512 "unpacked"="7") unnamed_addr #4 {
entry:
  call fastcc void @"onebyonecpy_hls.p0struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"(%"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* %2, i16* align 512 %3)
  ret void
}

declare void @mobilenetv2_block_hw_stub(%"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* noalias nocapture nonnull readonly, %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* noalias nocapture nonnull, [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]* noalias nocapture nonnull readonly, [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* noalias nocapture nonnull readonly)

define void @mobilenetv2_block_hw_stub_wrapper(i16*, i16*, [32 x [3 x [3 x i16]]]*, [32 x [32 x i16]]*) #5 {
entry:
  %4 = call i8* @malloc(i64 2)
  %5 = bitcast i8* %4 to %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"*
  %6 = call i8* @malloc(i64 2)
  %7 = bitcast i8* %6 to %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"*
  %8 = call i8* @malloc(i64 576)
  %9 = bitcast i8* %8 to [32 x [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]]*
  %10 = call i8* @malloc(i64 2048)
  %11 = bitcast i8* %10 to [32 x [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]*
  call void @copy_out(%"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* %5, i16* %0, %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* %7, i16* %1, [32 x [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]]* %9, [32 x [3 x [3 x i16]]]* %2, [32 x [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]* %11, [32 x [32 x i16]]* %3)
  %12 = bitcast [32 x [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]]* %9 to [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]*
  %13 = bitcast [32 x [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]* %11 to [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]*
  call void @mobilenetv2_block_hw_stub(%"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* %5, %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* %7, [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]* %12, [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %13)
  call void @copy_in(%"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* %5, i16* %0, %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* %7, i16* %1, [32 x [3 x [3 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]]* %9, [32 x [3 x [3 x i16]]]* %2, [32 x [32 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]]* %11, [32 x [32 x i16]]* %3)
  call void @free(i8* %4)
  call void @free(i8* %6)
  call void @free(i8* %8)
  call void @free(i8* %10)
  ret void
}

attributes #0 = { inaccessiblemem_or_argmemonly noinline willreturn "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="arraycpy_hls" }
attributes #4 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyout" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
