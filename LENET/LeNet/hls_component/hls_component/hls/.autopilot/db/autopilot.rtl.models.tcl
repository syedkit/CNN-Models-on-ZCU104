set SynModuleInfo {
  {SRCNAME lenet_kernel_Pipeline_VITIS_LOOP_25_1 MODELNAME lenet_kernel_Pipeline_VITIS_LOOP_25_1 RTLNAME lenet_kernel_lenet_kernel_Pipeline_VITIS_LOOP_25_1
    SUBMODULES {
      {MODELNAME lenet_kernel_flow_control_loop_pipe_sequential_init RTLNAME lenet_kernel_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME lenet_kernel_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME lenet_kernel_Pipeline_VITIS_LOOP_31_2 MODELNAME lenet_kernel_Pipeline_VITIS_LOOP_31_2 RTLNAME lenet_kernel_lenet_kernel_Pipeline_VITIS_LOOP_31_2}
  {SRCNAME lenet_kernel MODELNAME lenet_kernel RTLNAME lenet_kernel IS_TOP 1
    SUBMODULES {
      {MODELNAME lenet_kernel_local_in_RAM_AUTO_1R1W RTLNAME lenet_kernel_local_in_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME lenet_kernel_gmem0_m_axi RTLNAME lenet_kernel_gmem0_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME lenet_kernel_gmem1_m_axi RTLNAME lenet_kernel_gmem1_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME lenet_kernel_control_s_axi RTLNAME lenet_kernel_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME lenet_kernel_control_r_s_axi RTLNAME lenet_kernel_control_r_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
