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
#include "xlenet_kernel.h"

extern XLenet_kernel_Config XLenet_kernel_ConfigTable[];

#ifdef SDT
XLenet_kernel_Config *XLenet_kernel_LookupConfig(UINTPTR BaseAddress) {
	XLenet_kernel_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XLenet_kernel_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XLenet_kernel_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XLenet_kernel_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XLenet_kernel_Initialize(XLenet_kernel *InstancePtr, UINTPTR BaseAddress) {
	XLenet_kernel_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XLenet_kernel_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XLenet_kernel_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XLenet_kernel_Config *XLenet_kernel_LookupConfig(u16 DeviceId) {
	XLenet_kernel_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XLENET_KERNEL_NUM_INSTANCES; Index++) {
		if (XLenet_kernel_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XLenet_kernel_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XLenet_kernel_Initialize(XLenet_kernel *InstancePtr, u16 DeviceId) {
	XLenet_kernel_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XLenet_kernel_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XLenet_kernel_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

