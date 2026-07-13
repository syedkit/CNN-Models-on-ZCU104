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
#include "xalexnet_layer1.h"

extern XAlexnet_layer1_Config XAlexnet_layer1_ConfigTable[];

#ifdef SDT
XAlexnet_layer1_Config *XAlexnet_layer1_LookupConfig(UINTPTR BaseAddress) {
	XAlexnet_layer1_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XAlexnet_layer1_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XAlexnet_layer1_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XAlexnet_layer1_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XAlexnet_layer1_Initialize(XAlexnet_layer1 *InstancePtr, UINTPTR BaseAddress) {
	XAlexnet_layer1_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XAlexnet_layer1_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XAlexnet_layer1_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XAlexnet_layer1_Config *XAlexnet_layer1_LookupConfig(u16 DeviceId) {
	XAlexnet_layer1_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XALEXNET_LAYER1_NUM_INSTANCES; Index++) {
		if (XAlexnet_layer1_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XAlexnet_layer1_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XAlexnet_layer1_Initialize(XAlexnet_layer1 *InstancePtr, u16 DeviceId) {
	XAlexnet_layer1_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XAlexnet_layer1_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XAlexnet_layer1_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

