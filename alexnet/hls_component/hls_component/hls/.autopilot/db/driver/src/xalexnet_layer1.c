// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
// Tool Version Limit: 2025.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xalexnet_layer1.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XAlexnet_layer1_CfgInitialize(XAlexnet_layer1 *InstancePtr, XAlexnet_layer1_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XAlexnet_layer1_Start(XAlexnet_layer1 *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlexnet_layer1_ReadReg(InstancePtr->Control_BaseAddress, XALEXNET_LAYER1_CONTROL_ADDR_AP_CTRL) & 0x80;
    XAlexnet_layer1_WriteReg(InstancePtr->Control_BaseAddress, XALEXNET_LAYER1_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XAlexnet_layer1_IsDone(XAlexnet_layer1 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlexnet_layer1_ReadReg(InstancePtr->Control_BaseAddress, XALEXNET_LAYER1_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XAlexnet_layer1_IsIdle(XAlexnet_layer1 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlexnet_layer1_ReadReg(InstancePtr->Control_BaseAddress, XALEXNET_LAYER1_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XAlexnet_layer1_IsReady(XAlexnet_layer1 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlexnet_layer1_ReadReg(InstancePtr->Control_BaseAddress, XALEXNET_LAYER1_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XAlexnet_layer1_EnableAutoRestart(XAlexnet_layer1 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlexnet_layer1_WriteReg(InstancePtr->Control_BaseAddress, XALEXNET_LAYER1_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XAlexnet_layer1_DisableAutoRestart(XAlexnet_layer1 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlexnet_layer1_WriteReg(InstancePtr->Control_BaseAddress, XALEXNET_LAYER1_CONTROL_ADDR_AP_CTRL, 0);
}

void XAlexnet_layer1_Set_input_img(XAlexnet_layer1 *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlexnet_layer1_WriteReg(InstancePtr->Control_BaseAddress, XALEXNET_LAYER1_CONTROL_ADDR_INPUT_IMG_DATA, (u32)(Data));
    XAlexnet_layer1_WriteReg(InstancePtr->Control_BaseAddress, XALEXNET_LAYER1_CONTROL_ADDR_INPUT_IMG_DATA + 4, (u32)(Data >> 32));
}

u64 XAlexnet_layer1_Get_input_img(XAlexnet_layer1 *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlexnet_layer1_ReadReg(InstancePtr->Control_BaseAddress, XALEXNET_LAYER1_CONTROL_ADDR_INPUT_IMG_DATA);
    Data += (u64)XAlexnet_layer1_ReadReg(InstancePtr->Control_BaseAddress, XALEXNET_LAYER1_CONTROL_ADDR_INPUT_IMG_DATA + 4) << 32;
    return Data;
}

void XAlexnet_layer1_Set_output_feat(XAlexnet_layer1 *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlexnet_layer1_WriteReg(InstancePtr->Control_BaseAddress, XALEXNET_LAYER1_CONTROL_ADDR_OUTPUT_FEAT_DATA, (u32)(Data));
    XAlexnet_layer1_WriteReg(InstancePtr->Control_BaseAddress, XALEXNET_LAYER1_CONTROL_ADDR_OUTPUT_FEAT_DATA + 4, (u32)(Data >> 32));
}

u64 XAlexnet_layer1_Get_output_feat(XAlexnet_layer1 *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlexnet_layer1_ReadReg(InstancePtr->Control_BaseAddress, XALEXNET_LAYER1_CONTROL_ADDR_OUTPUT_FEAT_DATA);
    Data += (u64)XAlexnet_layer1_ReadReg(InstancePtr->Control_BaseAddress, XALEXNET_LAYER1_CONTROL_ADDR_OUTPUT_FEAT_DATA + 4) << 32;
    return Data;
}

void XAlexnet_layer1_Set_weights(XAlexnet_layer1 *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlexnet_layer1_WriteReg(InstancePtr->Control_BaseAddress, XALEXNET_LAYER1_CONTROL_ADDR_WEIGHTS_DATA, (u32)(Data));
    XAlexnet_layer1_WriteReg(InstancePtr->Control_BaseAddress, XALEXNET_LAYER1_CONTROL_ADDR_WEIGHTS_DATA + 4, (u32)(Data >> 32));
}

u64 XAlexnet_layer1_Get_weights(XAlexnet_layer1 *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlexnet_layer1_ReadReg(InstancePtr->Control_BaseAddress, XALEXNET_LAYER1_CONTROL_ADDR_WEIGHTS_DATA);
    Data += (u64)XAlexnet_layer1_ReadReg(InstancePtr->Control_BaseAddress, XALEXNET_LAYER1_CONTROL_ADDR_WEIGHTS_DATA + 4) << 32;
    return Data;
}

void XAlexnet_layer1_Set_bias(XAlexnet_layer1 *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlexnet_layer1_WriteReg(InstancePtr->Control_BaseAddress, XALEXNET_LAYER1_CONTROL_ADDR_BIAS_DATA, (u32)(Data));
    XAlexnet_layer1_WriteReg(InstancePtr->Control_BaseAddress, XALEXNET_LAYER1_CONTROL_ADDR_BIAS_DATA + 4, (u32)(Data >> 32));
}

u64 XAlexnet_layer1_Get_bias(XAlexnet_layer1 *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlexnet_layer1_ReadReg(InstancePtr->Control_BaseAddress, XALEXNET_LAYER1_CONTROL_ADDR_BIAS_DATA);
    Data += (u64)XAlexnet_layer1_ReadReg(InstancePtr->Control_BaseAddress, XALEXNET_LAYER1_CONTROL_ADDR_BIAS_DATA + 4) << 32;
    return Data;
}

void XAlexnet_layer1_InterruptGlobalEnable(XAlexnet_layer1 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlexnet_layer1_WriteReg(InstancePtr->Control_BaseAddress, XALEXNET_LAYER1_CONTROL_ADDR_GIE, 1);
}

void XAlexnet_layer1_InterruptGlobalDisable(XAlexnet_layer1 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlexnet_layer1_WriteReg(InstancePtr->Control_BaseAddress, XALEXNET_LAYER1_CONTROL_ADDR_GIE, 0);
}

void XAlexnet_layer1_InterruptEnable(XAlexnet_layer1 *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XAlexnet_layer1_ReadReg(InstancePtr->Control_BaseAddress, XALEXNET_LAYER1_CONTROL_ADDR_IER);
    XAlexnet_layer1_WriteReg(InstancePtr->Control_BaseAddress, XALEXNET_LAYER1_CONTROL_ADDR_IER, Register | Mask);
}

void XAlexnet_layer1_InterruptDisable(XAlexnet_layer1 *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XAlexnet_layer1_ReadReg(InstancePtr->Control_BaseAddress, XALEXNET_LAYER1_CONTROL_ADDR_IER);
    XAlexnet_layer1_WriteReg(InstancePtr->Control_BaseAddress, XALEXNET_LAYER1_CONTROL_ADDR_IER, Register & (~Mask));
}

void XAlexnet_layer1_InterruptClear(XAlexnet_layer1 *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlexnet_layer1_WriteReg(InstancePtr->Control_BaseAddress, XALEXNET_LAYER1_CONTROL_ADDR_ISR, Mask);
}

u32 XAlexnet_layer1_InterruptGetEnabled(XAlexnet_layer1 *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XAlexnet_layer1_ReadReg(InstancePtr->Control_BaseAddress, XALEXNET_LAYER1_CONTROL_ADDR_IER);
}

u32 XAlexnet_layer1_InterruptGetStatus(XAlexnet_layer1 *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XAlexnet_layer1_ReadReg(InstancePtr->Control_BaseAddress, XALEXNET_LAYER1_CONTROL_ADDR_ISR);
}

