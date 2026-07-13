// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
// Tool Version Limit: 2025.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XALEXNET_LAYER1_H
#define XALEXNET_LAYER1_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xalexnet_layer1_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
#ifdef SDT
    char *Name;
#else
    u16 DeviceId;
#endif
    u64 Control_BaseAddress;
} XAlexnet_layer1_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XAlexnet_layer1;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XAlexnet_layer1_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XAlexnet_layer1_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XAlexnet_layer1_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XAlexnet_layer1_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
#ifdef SDT
int XAlexnet_layer1_Initialize(XAlexnet_layer1 *InstancePtr, UINTPTR BaseAddress);
XAlexnet_layer1_Config* XAlexnet_layer1_LookupConfig(UINTPTR BaseAddress);
#else
int XAlexnet_layer1_Initialize(XAlexnet_layer1 *InstancePtr, u16 DeviceId);
XAlexnet_layer1_Config* XAlexnet_layer1_LookupConfig(u16 DeviceId);
#endif
int XAlexnet_layer1_CfgInitialize(XAlexnet_layer1 *InstancePtr, XAlexnet_layer1_Config *ConfigPtr);
#else
int XAlexnet_layer1_Initialize(XAlexnet_layer1 *InstancePtr, const char* InstanceName);
int XAlexnet_layer1_Release(XAlexnet_layer1 *InstancePtr);
#endif

void XAlexnet_layer1_Start(XAlexnet_layer1 *InstancePtr);
u32 XAlexnet_layer1_IsDone(XAlexnet_layer1 *InstancePtr);
u32 XAlexnet_layer1_IsIdle(XAlexnet_layer1 *InstancePtr);
u32 XAlexnet_layer1_IsReady(XAlexnet_layer1 *InstancePtr);
void XAlexnet_layer1_EnableAutoRestart(XAlexnet_layer1 *InstancePtr);
void XAlexnet_layer1_DisableAutoRestart(XAlexnet_layer1 *InstancePtr);

void XAlexnet_layer1_Set_input_img(XAlexnet_layer1 *InstancePtr, u64 Data);
u64 XAlexnet_layer1_Get_input_img(XAlexnet_layer1 *InstancePtr);
void XAlexnet_layer1_Set_output_feat(XAlexnet_layer1 *InstancePtr, u64 Data);
u64 XAlexnet_layer1_Get_output_feat(XAlexnet_layer1 *InstancePtr);
void XAlexnet_layer1_Set_weights(XAlexnet_layer1 *InstancePtr, u64 Data);
u64 XAlexnet_layer1_Get_weights(XAlexnet_layer1 *InstancePtr);
void XAlexnet_layer1_Set_bias(XAlexnet_layer1 *InstancePtr, u64 Data);
u64 XAlexnet_layer1_Get_bias(XAlexnet_layer1 *InstancePtr);

void XAlexnet_layer1_InterruptGlobalEnable(XAlexnet_layer1 *InstancePtr);
void XAlexnet_layer1_InterruptGlobalDisable(XAlexnet_layer1 *InstancePtr);
void XAlexnet_layer1_InterruptEnable(XAlexnet_layer1 *InstancePtr, u32 Mask);
void XAlexnet_layer1_InterruptDisable(XAlexnet_layer1 *InstancePtr, u32 Mask);
void XAlexnet_layer1_InterruptClear(XAlexnet_layer1 *InstancePtr, u32 Mask);
u32 XAlexnet_layer1_InterruptGetEnabled(XAlexnet_layer1 *InstancePtr);
u32 XAlexnet_layer1_InterruptGetStatus(XAlexnet_layer1 *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
