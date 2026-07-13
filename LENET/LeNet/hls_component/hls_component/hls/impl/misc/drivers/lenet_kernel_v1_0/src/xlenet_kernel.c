// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
// Tool Version Limit: 2025.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xlenet_kernel.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XLenet_kernel_CfgInitialize(XLenet_kernel *InstancePtr, XLenet_kernel_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->Control_r_BaseAddress = ConfigPtr->Control_r_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XLenet_kernel_Start(XLenet_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLenet_kernel_ReadReg(InstancePtr->Control_BaseAddress, XLENET_KERNEL_CONTROL_ADDR_AP_CTRL) & 0x80;
    XLenet_kernel_WriteReg(InstancePtr->Control_BaseAddress, XLENET_KERNEL_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XLenet_kernel_IsDone(XLenet_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLenet_kernel_ReadReg(InstancePtr->Control_BaseAddress, XLENET_KERNEL_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XLenet_kernel_IsIdle(XLenet_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLenet_kernel_ReadReg(InstancePtr->Control_BaseAddress, XLENET_KERNEL_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XLenet_kernel_IsReady(XLenet_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLenet_kernel_ReadReg(InstancePtr->Control_BaseAddress, XLENET_KERNEL_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XLenet_kernel_EnableAutoRestart(XLenet_kernel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLenet_kernel_WriteReg(InstancePtr->Control_BaseAddress, XLENET_KERNEL_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XLenet_kernel_DisableAutoRestart(XLenet_kernel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLenet_kernel_WriteReg(InstancePtr->Control_BaseAddress, XLENET_KERNEL_CONTROL_ADDR_AP_CTRL, 0);
}

void XLenet_kernel_Set_input_data(XLenet_kernel *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLenet_kernel_WriteReg(InstancePtr->Control_r_BaseAddress, XLENET_KERNEL_CONTROL_R_ADDR_INPUT_DATA_DATA, (u32)(Data));
    XLenet_kernel_WriteReg(InstancePtr->Control_r_BaseAddress, XLENET_KERNEL_CONTROL_R_ADDR_INPUT_DATA_DATA + 4, (u32)(Data >> 32));
}

u64 XLenet_kernel_Get_input_data(XLenet_kernel *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLenet_kernel_ReadReg(InstancePtr->Control_r_BaseAddress, XLENET_KERNEL_CONTROL_R_ADDR_INPUT_DATA_DATA);
    Data += (u64)XLenet_kernel_ReadReg(InstancePtr->Control_r_BaseAddress, XLENET_KERNEL_CONTROL_R_ADDR_INPUT_DATA_DATA + 4) << 32;
    return Data;
}

void XLenet_kernel_Set_output_data(XLenet_kernel *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLenet_kernel_WriteReg(InstancePtr->Control_r_BaseAddress, XLENET_KERNEL_CONTROL_R_ADDR_OUTPUT_DATA_DATA, (u32)(Data));
    XLenet_kernel_WriteReg(InstancePtr->Control_r_BaseAddress, XLENET_KERNEL_CONTROL_R_ADDR_OUTPUT_DATA_DATA + 4, (u32)(Data >> 32));
}

u64 XLenet_kernel_Get_output_data(XLenet_kernel *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLenet_kernel_ReadReg(InstancePtr->Control_r_BaseAddress, XLENET_KERNEL_CONTROL_R_ADDR_OUTPUT_DATA_DATA);
    Data += (u64)XLenet_kernel_ReadReg(InstancePtr->Control_r_BaseAddress, XLENET_KERNEL_CONTROL_R_ADDR_OUTPUT_DATA_DATA + 4) << 32;
    return Data;
}

void XLenet_kernel_InterruptGlobalEnable(XLenet_kernel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLenet_kernel_WriteReg(InstancePtr->Control_BaseAddress, XLENET_KERNEL_CONTROL_ADDR_GIE, 1);
}

void XLenet_kernel_InterruptGlobalDisable(XLenet_kernel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLenet_kernel_WriteReg(InstancePtr->Control_BaseAddress, XLENET_KERNEL_CONTROL_ADDR_GIE, 0);
}

void XLenet_kernel_InterruptEnable(XLenet_kernel *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XLenet_kernel_ReadReg(InstancePtr->Control_BaseAddress, XLENET_KERNEL_CONTROL_ADDR_IER);
    XLenet_kernel_WriteReg(InstancePtr->Control_BaseAddress, XLENET_KERNEL_CONTROL_ADDR_IER, Register | Mask);
}

void XLenet_kernel_InterruptDisable(XLenet_kernel *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XLenet_kernel_ReadReg(InstancePtr->Control_BaseAddress, XLENET_KERNEL_CONTROL_ADDR_IER);
    XLenet_kernel_WriteReg(InstancePtr->Control_BaseAddress, XLENET_KERNEL_CONTROL_ADDR_IER, Register & (~Mask));
}

void XLenet_kernel_InterruptClear(XLenet_kernel *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLenet_kernel_WriteReg(InstancePtr->Control_BaseAddress, XLENET_KERNEL_CONTROL_ADDR_ISR, Mask);
}

u32 XLenet_kernel_InterruptGetEnabled(XLenet_kernel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XLenet_kernel_ReadReg(InstancePtr->Control_BaseAddress, XLENET_KERNEL_CONTROL_ADDR_IER);
}

u32 XLenet_kernel_InterruptGetStatus(XLenet_kernel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XLenet_kernel_ReadReg(InstancePtr->Control_BaseAddress, XLENET_KERNEL_CONTROL_ADDR_ISR);
}

