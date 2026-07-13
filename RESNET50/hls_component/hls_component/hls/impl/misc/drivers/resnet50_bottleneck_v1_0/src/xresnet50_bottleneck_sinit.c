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
#include "xresnet50_bottleneck.h"

extern XResnet50_bottleneck_Config XResnet50_bottleneck_ConfigTable[];

#ifdef SDT
XResnet50_bottleneck_Config *XResnet50_bottleneck_LookupConfig(UINTPTR BaseAddress) {
	XResnet50_bottleneck_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XResnet50_bottleneck_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XResnet50_bottleneck_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XResnet50_bottleneck_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XResnet50_bottleneck_Initialize(XResnet50_bottleneck *InstancePtr, UINTPTR BaseAddress) {
	XResnet50_bottleneck_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XResnet50_bottleneck_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XResnet50_bottleneck_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XResnet50_bottleneck_Config *XResnet50_bottleneck_LookupConfig(u16 DeviceId) {
	XResnet50_bottleneck_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XRESNET50_BOTTLENECK_NUM_INSTANCES; Index++) {
		if (XResnet50_bottleneck_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XResnet50_bottleneck_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XResnet50_bottleneck_Initialize(XResnet50_bottleneck *InstancePtr, u16 DeviceId) {
	XResnet50_bottleneck_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XResnet50_bottleneck_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XResnet50_bottleneck_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

