// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
// Tool Version Limit: 2025.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XMOBILENETV2_BLOCK_H
#define XMOBILENETV2_BLOCK_H

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
#include "xmobilenetv2_block_hw.h"

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
} XMobilenetv2_block_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XMobilenetv2_block;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XMobilenetv2_block_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XMobilenetv2_block_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XMobilenetv2_block_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XMobilenetv2_block_ReadReg(BaseAddress, RegOffset) \
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
int XMobilenetv2_block_Initialize(XMobilenetv2_block *InstancePtr, UINTPTR BaseAddress);
XMobilenetv2_block_Config* XMobilenetv2_block_LookupConfig(UINTPTR BaseAddress);
#else
int XMobilenetv2_block_Initialize(XMobilenetv2_block *InstancePtr, u16 DeviceId);
XMobilenetv2_block_Config* XMobilenetv2_block_LookupConfig(u16 DeviceId);
#endif
int XMobilenetv2_block_CfgInitialize(XMobilenetv2_block *InstancePtr, XMobilenetv2_block_Config *ConfigPtr);
#else
int XMobilenetv2_block_Initialize(XMobilenetv2_block *InstancePtr, const char* InstanceName);
int XMobilenetv2_block_Release(XMobilenetv2_block *InstancePtr);
#endif

void XMobilenetv2_block_Start(XMobilenetv2_block *InstancePtr);
u32 XMobilenetv2_block_IsDone(XMobilenetv2_block *InstancePtr);
u32 XMobilenetv2_block_IsIdle(XMobilenetv2_block *InstancePtr);
u32 XMobilenetv2_block_IsReady(XMobilenetv2_block *InstancePtr);
void XMobilenetv2_block_EnableAutoRestart(XMobilenetv2_block *InstancePtr);
void XMobilenetv2_block_DisableAutoRestart(XMobilenetv2_block *InstancePtr);

void XMobilenetv2_block_Set_input_tensor(XMobilenetv2_block *InstancePtr, u64 Data);
u64 XMobilenetv2_block_Get_input_tensor(XMobilenetv2_block *InstancePtr);
void XMobilenetv2_block_Set_output_tensor(XMobilenetv2_block *InstancePtr, u64 Data);
u64 XMobilenetv2_block_Get_output_tensor(XMobilenetv2_block *InstancePtr);

void XMobilenetv2_block_InterruptGlobalEnable(XMobilenetv2_block *InstancePtr);
void XMobilenetv2_block_InterruptGlobalDisable(XMobilenetv2_block *InstancePtr);
void XMobilenetv2_block_InterruptEnable(XMobilenetv2_block *InstancePtr, u32 Mask);
void XMobilenetv2_block_InterruptDisable(XMobilenetv2_block *InstancePtr, u32 Mask);
void XMobilenetv2_block_InterruptClear(XMobilenetv2_block *InstancePtr, u32 Mask);
u32 XMobilenetv2_block_InterruptGetEnabled(XMobilenetv2_block *InstancePtr);
u32 XMobilenetv2_block_InterruptGetStatus(XMobilenetv2_block *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
