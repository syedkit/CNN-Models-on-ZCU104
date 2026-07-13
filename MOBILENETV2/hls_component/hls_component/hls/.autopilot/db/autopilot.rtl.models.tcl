set SynModuleInfo {
  {SRCNAME Loop_VITIS_LOOP_117_1_proc MODELNAME Loop_VITIS_LOOP_117_1_proc RTLNAME mobilenetv2_block_Loop_VITIS_LOOP_117_1_proc
    SUBMODULES {
      {MODELNAME mobilenetv2_block_flow_control_loop_pipe RTLNAME mobilenetv2_block_flow_control_loop_pipe BINDTYPE interface TYPE internal_upc_flow_control INSTNAME mobilenetv2_block_flow_control_loop_pipe_U}
    }
  }
  {SRCNAME depthwise_conv MODELNAME depthwise_conv RTLNAME mobilenetv2_block_depthwise_conv
    SUBMODULES {
      {MODELNAME mobilenetv2_block_mul_16s_16s_24_1_1 RTLNAME mobilenetv2_block_mul_16s_16s_24_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME mobilenetv2_block_mac_muladd_16s_16s_24ns_24_4_1 RTLNAME mobilenetv2_block_mac_muladd_16s_16s_24ns_24_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
      {MODELNAME mobilenetv2_block_depthwise_conv_line_buffer_RAM_AUTO_1R1W RTLNAME mobilenetv2_block_depthwise_conv_line_buffer_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME pointwise_conv_Pipeline_VITIS_LOOP_77_3 MODELNAME pointwise_conv_Pipeline_VITIS_LOOP_77_3 RTLNAME mobilenetv2_block_pointwise_conv_Pipeline_VITIS_LOOP_77_3
    SUBMODULES {
      {MODELNAME mobilenetv2_block_flow_control_loop_pipe_sequential_init RTLNAME mobilenetv2_block_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME mobilenetv2_block_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME pointwise_conv_Pipeline_VITIS_LOOP_83_4 MODELNAME pointwise_conv_Pipeline_VITIS_LOOP_83_4 RTLNAME mobilenetv2_block_pointwise_conv_Pipeline_VITIS_LOOP_83_4}
  {SRCNAME pointwise_conv MODELNAME pointwise_conv RTLNAME mobilenetv2_block_pointwise_conv
    SUBMODULES {
      {MODELNAME mobilenetv2_block_pointwise_conv_pixel_channels_RAM_AUTO_1R1W RTLNAME mobilenetv2_block_pointwise_conv_pixel_channels_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME mobilenetv2_block MODELNAME mobilenetv2_block RTLNAME mobilenetv2_block IS_TOP 1
    SUBMODULES {
      {MODELNAME mobilenetv2_block_fifo_w16_d2_S RTLNAME mobilenetv2_block_fifo_w16_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME input_stream_U}
      {MODELNAME mobilenetv2_block_fifo_w16_d64_S RTLNAME mobilenetv2_block_fifo_w16_d64_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME internal_fifo_U}
      {MODELNAME mobilenetv2_block_gmem0_m_axi RTLNAME mobilenetv2_block_gmem0_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME mobilenetv2_block_gmem1_m_axi RTLNAME mobilenetv2_block_gmem1_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME mobilenetv2_block_control_s_axi RTLNAME mobilenetv2_block_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
