// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
// Tool Version Limit: 2025.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xresnet50_bottleneck.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XResnet50_bottleneck_CfgInitialize(XResnet50_bottleneck *InstancePtr, XResnet50_bottleneck_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XResnet50_bottleneck_Start(XResnet50_bottleneck *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XResnet50_bottleneck_ReadReg(InstancePtr->Control_BaseAddress, XRESNET50_BOTTLENECK_CONTROL_ADDR_AP_CTRL) & 0x80;
    XResnet50_bottleneck_WriteReg(InstancePtr->Control_BaseAddress, XRESNET50_BOTTLENECK_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XResnet50_bottleneck_IsDone(XResnet50_bottleneck *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XResnet50_bottleneck_ReadReg(InstancePtr->Control_BaseAddress, XRESNET50_BOTTLENECK_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XResnet50_bottleneck_IsIdle(XResnet50_bottleneck *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XResnet50_bottleneck_ReadReg(InstancePtr->Control_BaseAddress, XRESNET50_BOTTLENECK_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XResnet50_bottleneck_IsReady(XResnet50_bottleneck *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XResnet50_bottleneck_ReadReg(InstancePtr->Control_BaseAddress, XRESNET50_BOTTLENECK_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XResnet50_bottleneck_EnableAutoRestart(XResnet50_bottleneck *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XResnet50_bottleneck_WriteReg(InstancePtr->Control_BaseAddress, XRESNET50_BOTTLENECK_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XResnet50_bottleneck_DisableAutoRestart(XResnet50_bottleneck *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XResnet50_bottleneck_WriteReg(InstancePtr->Control_BaseAddress, XRESNET50_BOTTLENECK_CONTROL_ADDR_AP_CTRL, 0);
}

void XResnet50_bottleneck_Set_input_tensor(XResnet50_bottleneck *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XResnet50_bottleneck_WriteReg(InstancePtr->Control_BaseAddress, XRESNET50_BOTTLENECK_CONTROL_ADDR_INPUT_TENSOR_DATA, (u32)(Data));
    XResnet50_bottleneck_WriteReg(InstancePtr->Control_BaseAddress, XRESNET50_BOTTLENECK_CONTROL_ADDR_INPUT_TENSOR_DATA + 4, (u32)(Data >> 32));
}

u64 XResnet50_bottleneck_Get_input_tensor(XResnet50_bottleneck *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XResnet50_bottleneck_ReadReg(InstancePtr->Control_BaseAddress, XRESNET50_BOTTLENECK_CONTROL_ADDR_INPUT_TENSOR_DATA);
    Data += (u64)XResnet50_bottleneck_ReadReg(InstancePtr->Control_BaseAddress, XRESNET50_BOTTLENECK_CONTROL_ADDR_INPUT_TENSOR_DATA + 4) << 32;
    return Data;
}

void XResnet50_bottleneck_Set_output_tensor(XResnet50_bottleneck *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XResnet50_bottleneck_WriteReg(InstancePtr->Control_BaseAddress, XRESNET50_BOTTLENECK_CONTROL_ADDR_OUTPUT_TENSOR_DATA, (u32)(Data));
    XResnet50_bottleneck_WriteReg(InstancePtr->Control_BaseAddress, XRESNET50_BOTTLENECK_CONTROL_ADDR_OUTPUT_TENSOR_DATA + 4, (u32)(Data >> 32));
}

u64 XResnet50_bottleneck_Get_output_tensor(XResnet50_bottleneck *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XResnet50_bottleneck_ReadReg(InstancePtr->Control_BaseAddress, XRESNET50_BOTTLENECK_CONTROL_ADDR_OUTPUT_TENSOR_DATA);
    Data += (u64)XResnet50_bottleneck_ReadReg(InstancePtr->Control_BaseAddress, XRESNET50_BOTTLENECK_CONTROL_ADDR_OUTPUT_TENSOR_DATA + 4) << 32;
    return Data;
}

void XResnet50_bottleneck_Set_w_1x1_a(XResnet50_bottleneck *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XResnet50_bottleneck_WriteReg(InstancePtr->Control_BaseAddress, XRESNET50_BOTTLENECK_CONTROL_ADDR_W_1X1_A_DATA, (u32)(Data));
    XResnet50_bottleneck_WriteReg(InstancePtr->Control_BaseAddress, XRESNET50_BOTTLENECK_CONTROL_ADDR_W_1X1_A_DATA + 4, (u32)(Data >> 32));
}

u64 XResnet50_bottleneck_Get_w_1x1_a(XResnet50_bottleneck *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XResnet50_bottleneck_ReadReg(InstancePtr->Control_BaseAddress, XRESNET50_BOTTLENECK_CONTROL_ADDR_W_1X1_A_DATA);
    Data += (u64)XResnet50_bottleneck_ReadReg(InstancePtr->Control_BaseAddress, XRESNET50_BOTTLENECK_CONTROL_ADDR_W_1X1_A_DATA + 4) << 32;
    return Data;
}

void XResnet50_bottleneck_Set_w_3x3(XResnet50_bottleneck *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XResnet50_bottleneck_WriteReg(InstancePtr->Control_BaseAddress, XRESNET50_BOTTLENECK_CONTROL_ADDR_W_3X3_DATA, (u32)(Data));
    XResnet50_bottleneck_WriteReg(InstancePtr->Control_BaseAddress, XRESNET50_BOTTLENECK_CONTROL_ADDR_W_3X3_DATA + 4, (u32)(Data >> 32));
}

u64 XResnet50_bottleneck_Get_w_3x3(XResnet50_bottleneck *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XResnet50_bottleneck_ReadReg(InstancePtr->Control_BaseAddress, XRESNET50_BOTTLENECK_CONTROL_ADDR_W_3X3_DATA);
    Data += (u64)XResnet50_bottleneck_ReadReg(InstancePtr->Control_BaseAddress, XRESNET50_BOTTLENECK_CONTROL_ADDR_W_3X3_DATA + 4) << 32;
    return Data;
}

void XResnet50_bottleneck_Set_w_1x1_b(XResnet50_bottleneck *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XResnet50_bottleneck_WriteReg(InstancePtr->Control_BaseAddress, XRESNET50_BOTTLENECK_CONTROL_ADDR_W_1X1_B_DATA, (u32)(Data));
    XResnet50_bottleneck_WriteReg(InstancePtr->Control_BaseAddress, XRESNET50_BOTTLENECK_CONTROL_ADDR_W_1X1_B_DATA + 4, (u32)(Data >> 32));
}

u64 XResnet50_bottleneck_Get_w_1x1_b(XResnet50_bottleneck *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XResnet50_bottleneck_ReadReg(InstancePtr->Control_BaseAddress, XRESNET50_BOTTLENECK_CONTROL_ADDR_W_1X1_B_DATA);
    Data += (u64)XResnet50_bottleneck_ReadReg(InstancePtr->Control_BaseAddress, XRESNET50_BOTTLENECK_CONTROL_ADDR_W_1X1_B_DATA + 4) << 32;
    return Data;
}

void XResnet50_bottleneck_InterruptGlobalEnable(XResnet50_bottleneck *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XResnet50_bottleneck_WriteReg(InstancePtr->Control_BaseAddress, XRESNET50_BOTTLENECK_CONTROL_ADDR_GIE, 1);
}

void XResnet50_bottleneck_InterruptGlobalDisable(XResnet50_bottleneck *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XResnet50_bottleneck_WriteReg(InstancePtr->Control_BaseAddress, XRESNET50_BOTTLENECK_CONTROL_ADDR_GIE, 0);
}

void XResnet50_bottleneck_InterruptEnable(XResnet50_bottleneck *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XResnet50_bottleneck_ReadReg(InstancePtr->Control_BaseAddress, XRESNET50_BOTTLENECK_CONTROL_ADDR_IER);
    XResnet50_bottleneck_WriteReg(InstancePtr->Control_BaseAddress, XRESNET50_BOTTLENECK_CONTROL_ADDR_IER, Register | Mask);
}

void XResnet50_bottleneck_InterruptDisable(XResnet50_bottleneck *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XResnet50_bottleneck_ReadReg(InstancePtr->Control_BaseAddress, XRESNET50_BOTTLENECK_CONTROL_ADDR_IER);
    XResnet50_bottleneck_WriteReg(InstancePtr->Control_BaseAddress, XRESNET50_BOTTLENECK_CONTROL_ADDR_IER, Register & (~Mask));
}

void XResnet50_bottleneck_InterruptClear(XResnet50_bottleneck *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XResnet50_bottleneck_WriteReg(InstancePtr->Control_BaseAddress, XRESNET50_BOTTLENECK_CONTROL_ADDR_ISR, Mask);
}

u32 XResnet50_bottleneck_InterruptGetEnabled(XResnet50_bottleneck *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XResnet50_bottleneck_ReadReg(InstancePtr->Control_BaseAddress, XRESNET50_BOTTLENECK_CONTROL_ADDR_IER);
}

u32 XResnet50_bottleneck_InterruptGetStatus(XResnet50_bottleneck *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XResnet50_bottleneck_ReadReg(InstancePtr->Control_BaseAddress, XRESNET50_BOTTLENECK_CONTROL_ADDR_ISR);
}

