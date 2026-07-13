set SynModuleInfo {
  {SRCNAME resnet50_bottleneck_Pipeline_VITIS_LOOP_40_3 MODELNAME resnet50_bottleneck_Pipeline_VITIS_LOOP_40_3 RTLNAME resnet50_bottleneck_resnet50_bottleneck_Pipeline_VITIS_LOOP_40_3
    SUBMODULES {
      {MODELNAME resnet50_bottleneck_flow_control_loop_pipe_sequential_init RTLNAME resnet50_bottleneck_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME resnet50_bottleneck_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME resnet50_bottleneck_Pipeline_VITIS_LOOP_55_4 MODELNAME resnet50_bottleneck_Pipeline_VITIS_LOOP_55_4 RTLNAME resnet50_bottleneck_resnet50_bottleneck_Pipeline_VITIS_LOOP_55_4}
  {SRCNAME resnet50_bottleneck_Pipeline_VITIS_LOOP_61_5 MODELNAME resnet50_bottleneck_Pipeline_VITIS_LOOP_61_5 RTLNAME resnet50_bottleneck_resnet50_bottleneck_Pipeline_VITIS_LOOP_61_5}
  {SRCNAME resnet50_bottleneck MODELNAME resnet50_bottleneck RTLNAME resnet50_bottleneck IS_TOP 1
    SUBMODULES {
      {MODELNAME resnet50_bottleneck_local_in_RAM_AUTO_1R1W RTLNAME resnet50_bottleneck_local_in_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME resnet50_bottleneck_local_out_RAM_AUTO_1R1W RTLNAME resnet50_bottleneck_local_out_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME resnet50_bottleneck_fifo_w16_d1024_A RTLNAME resnet50_bottleneck_fifo_w16_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME skip_connection_fifo_U}
      {MODELNAME resnet50_bottleneck_gmem0_m_axi RTLNAME resnet50_bottleneck_gmem0_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME resnet50_bottleneck_gmem1_m_axi RTLNAME resnet50_bottleneck_gmem1_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME resnet50_bottleneck_control_s_axi RTLNAME resnet50_bottleneck_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
