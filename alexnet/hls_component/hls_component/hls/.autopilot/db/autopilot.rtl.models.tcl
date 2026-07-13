set SynModuleInfo {
  {SRCNAME alexnet_layer1_Pipeline_VITIS_LOOP_36_1_VITIS_LOOP_38_2_VITIS_LOOP_39_3_VITIS_LO MODELNAME alexnet_layer1_Pipeline_VITIS_LOOP_36_1_VITIS_LOOP_38_2_VITIS_LOOP_39_3_VITIS_LO RTLNAME alexnet_layer1_alexnet_layer1_Pipeline_VITIS_LOOP_36_1_VITIS_LOOP_38_2_VITIS_LOOP_39_3_VITIS_LO
    SUBMODULES {
      {MODELNAME alexnet_layer1_mul_7ns_5ns_11_1_1 RTLNAME alexnet_layer1_mul_7ns_5ns_11_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME alexnet_layer1_ama_addmuladd_11ns_4ns_4ns_4ns_14_4_1 RTLNAME alexnet_layer1_ama_addmuladd_11ns_4ns_4ns_4ns_14_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
      {MODELNAME alexnet_layer1_flow_control_loop_pipe_sequential_init RTLNAME alexnet_layer1_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME alexnet_layer1_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME alexnet_layer1_Pipeline_VITIS_LOOP_49_5_VITIS_LOOP_50_6_VITIS_LOOP_51_7 MODELNAME alexnet_layer1_Pipeline_VITIS_LOOP_49_5_VITIS_LOOP_50_6_VITIS_LOOP_51_7 RTLNAME alexnet_layer1_alexnet_layer1_Pipeline_VITIS_LOOP_49_5_VITIS_LOOP_50_6_VITIS_LOOP_51_7
    SUBMODULES {
      {MODELNAME alexnet_layer1_mul_6ns_11ns_16_1_1 RTLNAME alexnet_layer1_mul_6ns_11ns_16_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME alexnet_layer1_mul_7ns_13ns_19_1_1 RTLNAME alexnet_layer1_mul_7ns_13ns_19_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME alexnet_layer1_mul_7ns_8ns_14_1_1 RTLNAME alexnet_layer1_mul_7ns_8ns_14_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME alexnet_layer1_mac_muladd_6ns_6ns_19ns_19_4_1 RTLNAME alexnet_layer1_mac_muladd_6ns_6ns_19ns_19_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
      {MODELNAME alexnet_layer1_mac_muladd_16s_16s_24ns_24_4_1 RTLNAME alexnet_layer1_mac_muladd_16s_16s_24ns_24_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
    }
  }
  {SRCNAME alexnet_layer1 MODELNAME alexnet_layer1 RTLNAME alexnet_layer1 IS_TOP 1
    SUBMODULES {
      {MODELNAME alexnet_layer1_local_weights_RAM_1WNR_AUTO_1R1W RTLNAME alexnet_layer1_local_weights_RAM_1WNR_AUTO_1R1W BINDTYPE storage TYPE ram_1wnr IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME alexnet_layer1_local_bias_RAM_AUTO_1R1W RTLNAME alexnet_layer1_local_bias_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME alexnet_layer1_gmem0_m_axi RTLNAME alexnet_layer1_gmem0_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME alexnet_layer1_gmem1_m_axi RTLNAME alexnet_layer1_gmem1_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME alexnet_layer1_gmem2_m_axi RTLNAME alexnet_layer1_gmem2_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME alexnet_layer1_gmem3_m_axi RTLNAME alexnet_layer1_gmem3_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME alexnet_layer1_control_s_axi RTLNAME alexnet_layer1_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
