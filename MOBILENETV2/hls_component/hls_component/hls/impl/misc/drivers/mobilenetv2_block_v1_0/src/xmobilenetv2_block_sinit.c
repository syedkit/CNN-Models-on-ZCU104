// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
// Tool Version Limit: 2025.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xmobilenetv2_block.h"

extern XMobilenetv2_block_Config XMobilenetv2_block_ConfigTable[];

#ifdef SDT
XMobilenetv2_block_Config *XMobilenetv2_block_LookupConfig(UINTPTR BaseAddress) {
	XMobilenetv2_block_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XMobilenetv2_block_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XMobilenetv2_block_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XMobilenetv2_block_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XMobilenetv2_block_Initialize(XMobilenetv2_block *InstancePtr, UINTPTR BaseAddress) {
	XMobilenetv2_block_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XMobilenetv2_block_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XMobilenetv2_block_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XMobilenetv2_block_Config *XMobilenetv2_block_LookupConfig(u16 DeviceId) {
	XMobilenetv2_block_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XMOBILENETV2_BLOCK_NUM_INSTANCES; Index++) {
		if (XMobilenetv2_block_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XMobilenetv2_block_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XMobilenetv2_block_Initialize(XMobilenetv2_block *InstancePtr, u16 DeviceId) {
	XMobilenetv2_block_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XMobilenetv2_block_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XMobilenetv2_block_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

