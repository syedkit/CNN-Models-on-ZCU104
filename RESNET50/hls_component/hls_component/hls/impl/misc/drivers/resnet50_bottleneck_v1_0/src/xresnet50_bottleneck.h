// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
// Tool Version Limit: 2025.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XRESNET50_BOTTLENECK_H
#define XRESNET50_BOTTLENECK_H

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
#include "xresnet50_bottleneck_hw.h"

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
} XResnet50_bottleneck_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XResnet50_bottleneck;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XResnet50_bottleneck_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XResnet50_bottleneck_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XResnet50_bottleneck_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XResnet50_bottleneck_ReadReg(BaseAddress, RegOffset) \
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
int XResnet50_bottleneck_Initialize(XResnet50_bottleneck *InstancePtr, UINTPTR BaseAddress);
XResnet50_bottleneck_Config* XResnet50_bottleneck_LookupConfig(UINTPTR BaseAddress);
#else
int XResnet50_bottleneck_Initialize(XResnet50_bottleneck *InstancePtr, u16 DeviceId);
XResnet50_bottleneck_Config* XResnet50_bottleneck_LookupConfig(u16 DeviceId);
#endif
int XResnet50_bottleneck_CfgInitialize(XResnet50_bottleneck *InstancePtr, XResnet50_bottleneck_Config *ConfigPtr);
#else
int XResnet50_bottleneck_Initialize(XResnet50_bottleneck *InstancePtr, const char* InstanceName);
int XResnet50_bottleneck_Release(XResnet50_bottleneck *InstancePtr);
#endif

void XResnet50_bottleneck_Start(XResnet50_bottleneck *InstancePtr);
u32 XResnet50_bottleneck_IsDone(XResnet50_bottleneck *InstancePtr);
u32 XResnet50_bottleneck_IsIdle(XResnet50_bottleneck *InstancePtr);
u32 XResnet50_bottleneck_IsReady(XResnet50_bottleneck *InstancePtr);
void XResnet50_bottleneck_EnableAutoRestart(XResnet50_bottleneck *InstancePtr);
void XResnet50_bottleneck_DisableAutoRestart(XResnet50_bottleneck *InstancePtr);

void XResnet50_bottleneck_Set_input_tensor(XResnet50_bottleneck *InstancePtr, u64 Data);
u64 XResnet50_bottleneck_Get_input_tensor(XResnet50_bottleneck *InstancePtr);
void XResnet50_bottleneck_Set_output_tensor(XResnet50_bottleneck *InstancePtr, u64 Data);
u64 XResnet50_bottleneck_Get_output_tensor(XResnet50_bottleneck *InstancePtr);
void XResnet50_bottleneck_Set_w_1x1_a(XResnet50_bottleneck *InstancePtr, u64 Data);
u64 XResnet50_bottleneck_Get_w_1x1_a(XResnet50_bottleneck *InstancePtr);
void XResnet50_bottleneck_Set_w_3x3(XResnet50_bottleneck *InstancePtr, u64 Data);
u64 XResnet50_bottleneck_Get_w_3x3(XResnet50_bottleneck *InstancePtr);
void XResnet50_bottleneck_Set_w_1x1_b(XResnet50_bottleneck *InstancePtr, u64 Data);
u64 XResnet50_bottleneck_Get_w_1x1_b(XResnet50_bottleneck *InstancePtr);

void XResnet50_bottleneck_InterruptGlobalEnable(XResnet50_bottleneck *InstancePtr);
void XResnet50_bottleneck_InterruptGlobalDisable(XResnet50_bottleneck *InstancePtr);
void XResnet50_bottleneck_InterruptEnable(XResnet50_bottleneck *InstancePtr, u32 Mask);
void XResnet50_bottleneck_InterruptDisable(XResnet50_bottleneck *InstancePtr, u32 Mask);
void XResnet50_bottleneck_InterruptClear(XResnet50_bottleneck *InstancePtr, u32 Mask);
u32 XResnet50_bottleneck_InterruptGetEnabled(XResnet50_bottleneck *InstancePtr);
u32 XResnet50_bottleneck_InterruptGetStatus(XResnet50_bottleneck *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
