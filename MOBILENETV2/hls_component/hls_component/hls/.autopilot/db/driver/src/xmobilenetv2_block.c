// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
// Tool Version Limit: 2025.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xmobilenetv2_block.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XMobilenetv2_block_CfgInitialize(XMobilenetv2_block *InstancePtr, XMobilenetv2_block_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XMobilenetv2_block_Start(XMobilenetv2_block *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMobilenetv2_block_ReadReg(InstancePtr->Control_BaseAddress, XMOBILENETV2_BLOCK_CONTROL_ADDR_AP_CTRL) & 0x80;
    XMobilenetv2_block_WriteReg(InstancePtr->Control_BaseAddress, XMOBILENETV2_BLOCK_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XMobilenetv2_block_IsDone(XMobilenetv2_block *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMobilenetv2_block_ReadReg(InstancePtr->Control_BaseAddress, XMOBILENETV2_BLOCK_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XMobilenetv2_block_IsIdle(XMobilenetv2_block *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMobilenetv2_block_ReadReg(InstancePtr->Control_BaseAddress, XMOBILENETV2_BLOCK_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XMobilenetv2_block_IsReady(XMobilenetv2_block *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMobilenetv2_block_ReadReg(InstancePtr->Control_BaseAddress, XMOBILENETV2_BLOCK_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XMobilenetv2_block_EnableAutoRestart(XMobilenetv2_block *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMobilenetv2_block_WriteReg(InstancePtr->Control_BaseAddress, XMOBILENETV2_BLOCK_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XMobilenetv2_block_DisableAutoRestart(XMobilenetv2_block *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMobilenetv2_block_WriteReg(InstancePtr->Control_BaseAddress, XMOBILENETV2_BLOCK_CONTROL_ADDR_AP_CTRL, 0);
}

void XMobilenetv2_block_Set_input_tensor(XMobilenetv2_block *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMobilenetv2_block_WriteReg(InstancePtr->Control_BaseAddress, XMOBILENETV2_BLOCK_CONTROL_ADDR_INPUT_TENSOR_DATA, (u32)(Data));
    XMobilenetv2_block_WriteReg(InstancePtr->Control_BaseAddress, XMOBILENETV2_BLOCK_CONTROL_ADDR_INPUT_TENSOR_DATA + 4, (u32)(Data >> 32));
}

u64 XMobilenetv2_block_Get_input_tensor(XMobilenetv2_block *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMobilenetv2_block_ReadReg(InstancePtr->Control_BaseAddress, XMOBILENETV2_BLOCK_CONTROL_ADDR_INPUT_TENSOR_DATA);
    Data += (u64)XMobilenetv2_block_ReadReg(InstancePtr->Control_BaseAddress, XMOBILENETV2_BLOCK_CONTROL_ADDR_INPUT_TENSOR_DATA + 4) << 32;
    return Data;
}

void XMobilenetv2_block_Set_output_tensor(XMobilenetv2_block *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMobilenetv2_block_WriteReg(InstancePtr->Control_BaseAddress, XMOBILENETV2_BLOCK_CONTROL_ADDR_OUTPUT_TENSOR_DATA, (u32)(Data));
    XMobilenetv2_block_WriteReg(InstancePtr->Control_BaseAddress, XMOBILENETV2_BLOCK_CONTROL_ADDR_OUTPUT_TENSOR_DATA + 4, (u32)(Data >> 32));
}

u64 XMobilenetv2_block_Get_output_tensor(XMobilenetv2_block *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMobilenetv2_block_ReadReg(InstancePtr->Control_BaseAddress, XMOBILENETV2_BLOCK_CONTROL_ADDR_OUTPUT_TENSOR_DATA);
    Data += (u64)XMobilenetv2_block_ReadReg(InstancePtr->Control_BaseAddress, XMOBILENETV2_BLOCK_CONTROL_ADDR_OUTPUT_TENSOR_DATA + 4) << 32;
    return Data;
}

void XMobilenetv2_block_InterruptGlobalEnable(XMobilenetv2_block *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMobilenetv2_block_WriteReg(InstancePtr->Control_BaseAddress, XMOBILENETV2_BLOCK_CONTROL_ADDR_GIE, 1);
}

void XMobilenetv2_block_InterruptGlobalDisable(XMobilenetv2_block *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMobilenetv2_block_WriteReg(InstancePtr->Control_BaseAddress, XMOBILENETV2_BLOCK_CONTROL_ADDR_GIE, 0);
}

void XMobilenetv2_block_InterruptEnable(XMobilenetv2_block *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XMobilenetv2_block_ReadReg(InstancePtr->Control_BaseAddress, XMOBILENETV2_BLOCK_CONTROL_ADDR_IER);
    XMobilenetv2_block_WriteReg(InstancePtr->Control_BaseAddress, XMOBILENETV2_BLOCK_CONTROL_ADDR_IER, Register | Mask);
}

void XMobilenetv2_block_InterruptDisable(XMobilenetv2_block *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XMobilenetv2_block_ReadReg(InstancePtr->Control_BaseAddress, XMOBILENETV2_BLOCK_CONTROL_ADDR_IER);
    XMobilenetv2_block_WriteReg(InstancePtr->Control_BaseAddress, XMOBILENETV2_BLOCK_CONTROL_ADDR_IER, Register & (~Mask));
}

void XMobilenetv2_block_InterruptClear(XMobilenetv2_block *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMobilenetv2_block_WriteReg(InstancePtr->Control_BaseAddress, XMOBILENETV2_BLOCK_CONTROL_ADDR_ISR, Mask);
}

u32 XMobilenetv2_block_InterruptGetEnabled(XMobilenetv2_block *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XMobilenetv2_block_ReadReg(InstancePtr->Control_BaseAddress, XMOBILENETV2_BLOCK_CONTROL_ADDR_IER);
}

u32 XMobilenetv2_block_InterruptGetStatus(XMobilenetv2_block *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XMobilenetv2_block_ReadReg(InstancePtr->Control_BaseAddress, XMOBILENETV2_BLOCK_CONTROL_ADDR_ISR);
}

