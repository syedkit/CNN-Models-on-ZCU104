set moduleName pointwise_conv_Pipeline_VITIS_LOOP_83_4
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set isPipelined_legacy 1
set pipeline_type loop_auto_rewind
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set svuvm_can_support 1
set cdfgNum 8
set C_modelName {pointwise_conv_Pipeline_VITIS_LOOP_83_4}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict pw_weights { MEM_WIDTH 16 MEM_SIZE 2048 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ pw_weights int 16 regular {array 1024 { 1 1 } 1 1 }  }
	{ sext_ln87_2 int 16 regular  }
	{ sext_ln87_4 int 16 regular  }
	{ sext_ln87_6 int 16 regular  }
	{ sext_ln87_8 int 16 regular  }
	{ sext_ln87_10 int 16 regular  }
	{ sext_ln87_12 int 16 regular  }
	{ sext_ln87_14 int 16 regular  }
	{ sext_ln87_16 int 16 regular  }
	{ sext_ln87_18 int 16 regular  }
	{ sext_ln87_20 int 16 regular  }
	{ sext_ln87_22 int 16 regular  }
	{ sext_ln87_24 int 16 regular  }
	{ sext_ln87_26 int 16 regular  }
	{ sext_ln87_28 int 16 regular  }
	{ sext_ln87_30 int 16 regular  }
	{ sext_ln87_32 int 16 regular  }
	{ sext_ln87_34 int 16 regular  }
	{ sext_ln87_36 int 16 regular  }
	{ sext_ln87_38 int 16 regular  }
	{ sext_ln87_40 int 16 regular  }
	{ sext_ln87_42 int 16 regular  }
	{ sext_ln87_44 int 16 regular  }
	{ sext_ln87_46 int 16 regular  }
	{ sext_ln87_48 int 16 regular  }
	{ sext_ln87_50 int 16 regular  }
	{ sext_ln87_52 int 16 regular  }
	{ sext_ln87_54 int 16 regular  }
	{ sext_ln87_56 int 16 regular  }
	{ sext_ln87_58 int 16 regular  }
	{ sext_ln87_60 int 16 regular  }
	{ sext_ln87_62 int 16 regular  }
	{ sext_ln87_63 int 16 regular  }
	{ zext_ln83 int 12 regular  }
	{ output_tensor int 64 regular  }
	{ gmem1 int 16 regular {axi_master 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "pw_weights", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln87_2", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln87_4", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln87_6", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln87_8", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln87_10", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln87_12", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln87_14", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln87_16", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln87_18", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln87_20", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln87_22", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln87_24", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln87_26", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln87_28", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln87_30", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln87_32", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln87_34", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln87_36", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln87_38", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln87_40", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln87_42", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln87_44", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln87_46", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln87_48", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln87_50", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln87_52", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln87_54", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln87_56", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln87_58", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln87_60", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln87_62", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln87_63", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln83", "interface" : "wire", "bitwidth" : 12, "direction" : "READONLY"} , 
 	{ "Name" : "output_tensor", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "gmem1", "interface" : "axi_master", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "output_tensor","offset": { "type": "dynamic","port_name": "output_tensor","bundle": "control"},"direction": "WRITEONLY"}]}]} ]}
# RTL Port declarations: 
set portNum 92
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ pw_weights_address0 sc_out sc_lv 10 signal 0 } 
	{ pw_weights_ce0 sc_out sc_logic 1 signal 0 } 
	{ pw_weights_q0 sc_in sc_lv 16 signal 0 } 
	{ pw_weights_address1 sc_out sc_lv 10 signal 0 } 
	{ pw_weights_ce1 sc_out sc_logic 1 signal 0 } 
	{ pw_weights_q1 sc_in sc_lv 16 signal 0 } 
	{ sext_ln87_2 sc_in sc_lv 16 signal 1 } 
	{ sext_ln87_4 sc_in sc_lv 16 signal 2 } 
	{ sext_ln87_6 sc_in sc_lv 16 signal 3 } 
	{ sext_ln87_8 sc_in sc_lv 16 signal 4 } 
	{ sext_ln87_10 sc_in sc_lv 16 signal 5 } 
	{ sext_ln87_12 sc_in sc_lv 16 signal 6 } 
	{ sext_ln87_14 sc_in sc_lv 16 signal 7 } 
	{ sext_ln87_16 sc_in sc_lv 16 signal 8 } 
	{ sext_ln87_18 sc_in sc_lv 16 signal 9 } 
	{ sext_ln87_20 sc_in sc_lv 16 signal 10 } 
	{ sext_ln87_22 sc_in sc_lv 16 signal 11 } 
	{ sext_ln87_24 sc_in sc_lv 16 signal 12 } 
	{ sext_ln87_26 sc_in sc_lv 16 signal 13 } 
	{ sext_ln87_28 sc_in sc_lv 16 signal 14 } 
	{ sext_ln87_30 sc_in sc_lv 16 signal 15 } 
	{ sext_ln87_32 sc_in sc_lv 16 signal 16 } 
	{ sext_ln87_34 sc_in sc_lv 16 signal 17 } 
	{ sext_ln87_36 sc_in sc_lv 16 signal 18 } 
	{ sext_ln87_38 sc_in sc_lv 16 signal 19 } 
	{ sext_ln87_40 sc_in sc_lv 16 signal 20 } 
	{ sext_ln87_42 sc_in sc_lv 16 signal 21 } 
	{ sext_ln87_44 sc_in sc_lv 16 signal 22 } 
	{ sext_ln87_46 sc_in sc_lv 16 signal 23 } 
	{ sext_ln87_48 sc_in sc_lv 16 signal 24 } 
	{ sext_ln87_50 sc_in sc_lv 16 signal 25 } 
	{ sext_ln87_52 sc_in sc_lv 16 signal 26 } 
	{ sext_ln87_54 sc_in sc_lv 16 signal 27 } 
	{ sext_ln87_56 sc_in sc_lv 16 signal 28 } 
	{ sext_ln87_58 sc_in sc_lv 16 signal 29 } 
	{ sext_ln87_60 sc_in sc_lv 16 signal 30 } 
	{ sext_ln87_62 sc_in sc_lv 16 signal 31 } 
	{ sext_ln87_63 sc_in sc_lv 16 signal 32 } 
	{ zext_ln83 sc_in sc_lv 12 signal 33 } 
	{ output_tensor sc_in sc_lv 64 signal 34 } 
	{ m_axi_gmem1_0_AWVALID sc_out sc_logic 1 signal 35 } 
	{ m_axi_gmem1_0_AWREADY sc_in sc_logic 1 signal 35 } 
	{ m_axi_gmem1_0_AWADDR sc_out sc_lv 64 signal 35 } 
	{ m_axi_gmem1_0_AWID sc_out sc_lv 1 signal 35 } 
	{ m_axi_gmem1_0_AWLEN sc_out sc_lv 32 signal 35 } 
	{ m_axi_gmem1_0_AWSIZE sc_out sc_lv 3 signal 35 } 
	{ m_axi_gmem1_0_AWBURST sc_out sc_lv 2 signal 35 } 
	{ m_axi_gmem1_0_AWLOCK sc_out sc_lv 2 signal 35 } 
	{ m_axi_gmem1_0_AWCACHE sc_out sc_lv 4 signal 35 } 
	{ m_axi_gmem1_0_AWPROT sc_out sc_lv 3 signal 35 } 
	{ m_axi_gmem1_0_AWQOS sc_out sc_lv 4 signal 35 } 
	{ m_axi_gmem1_0_AWREGION sc_out sc_lv 4 signal 35 } 
	{ m_axi_gmem1_0_AWUSER sc_out sc_lv 1 signal 35 } 
	{ m_axi_gmem1_0_WVALID sc_out sc_logic 1 signal 35 } 
	{ m_axi_gmem1_0_WREADY sc_in sc_logic 1 signal 35 } 
	{ m_axi_gmem1_0_WDATA sc_out sc_lv 16 signal 35 } 
	{ m_axi_gmem1_0_WSTRB sc_out sc_lv 2 signal 35 } 
	{ m_axi_gmem1_0_WLAST sc_out sc_logic 1 signal 35 } 
	{ m_axi_gmem1_0_WID sc_out sc_lv 1 signal 35 } 
	{ m_axi_gmem1_0_WUSER sc_out sc_lv 1 signal 35 } 
	{ m_axi_gmem1_0_ARVALID sc_out sc_logic 1 signal 35 } 
	{ m_axi_gmem1_0_ARREADY sc_in sc_logic 1 signal 35 } 
	{ m_axi_gmem1_0_ARADDR sc_out sc_lv 64 signal 35 } 
	{ m_axi_gmem1_0_ARID sc_out sc_lv 1 signal 35 } 
	{ m_axi_gmem1_0_ARLEN sc_out sc_lv 32 signal 35 } 
	{ m_axi_gmem1_0_ARSIZE sc_out sc_lv 3 signal 35 } 
	{ m_axi_gmem1_0_ARBURST sc_out sc_lv 2 signal 35 } 
	{ m_axi_gmem1_0_ARLOCK sc_out sc_lv 2 signal 35 } 
	{ m_axi_gmem1_0_ARCACHE sc_out sc_lv 4 signal 35 } 
	{ m_axi_gmem1_0_ARPROT sc_out sc_lv 3 signal 35 } 
	{ m_axi_gmem1_0_ARQOS sc_out sc_lv 4 signal 35 } 
	{ m_axi_gmem1_0_ARREGION sc_out sc_lv 4 signal 35 } 
	{ m_axi_gmem1_0_ARUSER sc_out sc_lv 1 signal 35 } 
	{ m_axi_gmem1_0_RVALID sc_in sc_logic 1 signal 35 } 
	{ m_axi_gmem1_0_RREADY sc_out sc_logic 1 signal 35 } 
	{ m_axi_gmem1_0_RDATA sc_in sc_lv 16 signal 35 } 
	{ m_axi_gmem1_0_RLAST sc_in sc_logic 1 signal 35 } 
	{ m_axi_gmem1_0_RID sc_in sc_lv 1 signal 35 } 
	{ m_axi_gmem1_0_RFIFONUM sc_in sc_lv 10 signal 35 } 
	{ m_axi_gmem1_0_RUSER sc_in sc_lv 1 signal 35 } 
	{ m_axi_gmem1_0_RRESP sc_in sc_lv 2 signal 35 } 
	{ m_axi_gmem1_0_BVALID sc_in sc_logic 1 signal 35 } 
	{ m_axi_gmem1_0_BREADY sc_out sc_logic 1 signal 35 } 
	{ m_axi_gmem1_0_BRESP sc_in sc_lv 2 signal 35 } 
	{ m_axi_gmem1_0_BID sc_in sc_lv 1 signal 35 } 
	{ m_axi_gmem1_0_BUSER sc_in sc_lv 1 signal 35 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "pw_weights_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "pw_weights", "role": "address0" }} , 
 	{ "name": "pw_weights_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "pw_weights", "role": "ce0" }} , 
 	{ "name": "pw_weights_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "pw_weights", "role": "q0" }} , 
 	{ "name": "pw_weights_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "pw_weights", "role": "address1" }} , 
 	{ "name": "pw_weights_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "pw_weights", "role": "ce1" }} , 
 	{ "name": "pw_weights_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "pw_weights", "role": "q1" }} , 
 	{ "name": "sext_ln87_2", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln87_2", "role": "default" }} , 
 	{ "name": "sext_ln87_4", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln87_4", "role": "default" }} , 
 	{ "name": "sext_ln87_6", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln87_6", "role": "default" }} , 
 	{ "name": "sext_ln87_8", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln87_8", "role": "default" }} , 
 	{ "name": "sext_ln87_10", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln87_10", "role": "default" }} , 
 	{ "name": "sext_ln87_12", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln87_12", "role": "default" }} , 
 	{ "name": "sext_ln87_14", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln87_14", "role": "default" }} , 
 	{ "name": "sext_ln87_16", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln87_16", "role": "default" }} , 
 	{ "name": "sext_ln87_18", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln87_18", "role": "default" }} , 
 	{ "name": "sext_ln87_20", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln87_20", "role": "default" }} , 
 	{ "name": "sext_ln87_22", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln87_22", "role": "default" }} , 
 	{ "name": "sext_ln87_24", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln87_24", "role": "default" }} , 
 	{ "name": "sext_ln87_26", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln87_26", "role": "default" }} , 
 	{ "name": "sext_ln87_28", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln87_28", "role": "default" }} , 
 	{ "name": "sext_ln87_30", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln87_30", "role": "default" }} , 
 	{ "name": "sext_ln87_32", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln87_32", "role": "default" }} , 
 	{ "name": "sext_ln87_34", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln87_34", "role": "default" }} , 
 	{ "name": "sext_ln87_36", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln87_36", "role": "default" }} , 
 	{ "name": "sext_ln87_38", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln87_38", "role": "default" }} , 
 	{ "name": "sext_ln87_40", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln87_40", "role": "default" }} , 
 	{ "name": "sext_ln87_42", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln87_42", "role": "default" }} , 
 	{ "name": "sext_ln87_44", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln87_44", "role": "default" }} , 
 	{ "name": "sext_ln87_46", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln87_46", "role": "default" }} , 
 	{ "name": "sext_ln87_48", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln87_48", "role": "default" }} , 
 	{ "name": "sext_ln87_50", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln87_50", "role": "default" }} , 
 	{ "name": "sext_ln87_52", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln87_52", "role": "default" }} , 
 	{ "name": "sext_ln87_54", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln87_54", "role": "default" }} , 
 	{ "name": "sext_ln87_56", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln87_56", "role": "default" }} , 
 	{ "name": "sext_ln87_58", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln87_58", "role": "default" }} , 
 	{ "name": "sext_ln87_60", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln87_60", "role": "default" }} , 
 	{ "name": "sext_ln87_62", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln87_62", "role": "default" }} , 
 	{ "name": "sext_ln87_63", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln87_63", "role": "default" }} , 
 	{ "name": "zext_ln83", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "zext_ln83", "role": "default" }} , 
 	{ "name": "output_tensor", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "output_tensor", "role": "default" }} , 
 	{ "name": "m_axi_gmem1_0_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "0_AWVALID" }} , 
 	{ "name": "m_axi_gmem1_0_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "0_AWREADY" }} , 
 	{ "name": "m_axi_gmem1_0_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem1", "role": "0_AWADDR" }} , 
 	{ "name": "m_axi_gmem1_0_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "0_AWID" }} , 
 	{ "name": "m_axi_gmem1_0_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem1", "role": "0_AWLEN" }} , 
 	{ "name": "m_axi_gmem1_0_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem1", "role": "0_AWSIZE" }} , 
 	{ "name": "m_axi_gmem1_0_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem1", "role": "0_AWBURST" }} , 
 	{ "name": "m_axi_gmem1_0_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem1", "role": "0_AWLOCK" }} , 
 	{ "name": "m_axi_gmem1_0_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem1", "role": "0_AWCACHE" }} , 
 	{ "name": "m_axi_gmem1_0_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem1", "role": "0_AWPROT" }} , 
 	{ "name": "m_axi_gmem1_0_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem1", "role": "0_AWQOS" }} , 
 	{ "name": "m_axi_gmem1_0_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem1", "role": "0_AWREGION" }} , 
 	{ "name": "m_axi_gmem1_0_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "0_AWUSER" }} , 
 	{ "name": "m_axi_gmem1_0_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "0_WVALID" }} , 
 	{ "name": "m_axi_gmem1_0_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "0_WREADY" }} , 
 	{ "name": "m_axi_gmem1_0_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "gmem1", "role": "0_WDATA" }} , 
 	{ "name": "m_axi_gmem1_0_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem1", "role": "0_WSTRB" }} , 
 	{ "name": "m_axi_gmem1_0_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "0_WLAST" }} , 
 	{ "name": "m_axi_gmem1_0_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "0_WID" }} , 
 	{ "name": "m_axi_gmem1_0_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "0_WUSER" }} , 
 	{ "name": "m_axi_gmem1_0_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "0_ARVALID" }} , 
 	{ "name": "m_axi_gmem1_0_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "0_ARREADY" }} , 
 	{ "name": "m_axi_gmem1_0_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem1", "role": "0_ARADDR" }} , 
 	{ "name": "m_axi_gmem1_0_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "0_ARID" }} , 
 	{ "name": "m_axi_gmem1_0_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem1", "role": "0_ARLEN" }} , 
 	{ "name": "m_axi_gmem1_0_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem1", "role": "0_ARSIZE" }} , 
 	{ "name": "m_axi_gmem1_0_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem1", "role": "0_ARBURST" }} , 
 	{ "name": "m_axi_gmem1_0_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem1", "role": "0_ARLOCK" }} , 
 	{ "name": "m_axi_gmem1_0_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem1", "role": "0_ARCACHE" }} , 
 	{ "name": "m_axi_gmem1_0_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem1", "role": "0_ARPROT" }} , 
 	{ "name": "m_axi_gmem1_0_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem1", "role": "0_ARQOS" }} , 
 	{ "name": "m_axi_gmem1_0_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem1", "role": "0_ARREGION" }} , 
 	{ "name": "m_axi_gmem1_0_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "0_ARUSER" }} , 
 	{ "name": "m_axi_gmem1_0_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "0_RVALID" }} , 
 	{ "name": "m_axi_gmem1_0_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "0_RREADY" }} , 
 	{ "name": "m_axi_gmem1_0_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "gmem1", "role": "0_RDATA" }} , 
 	{ "name": "m_axi_gmem1_0_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "0_RLAST" }} , 
 	{ "name": "m_axi_gmem1_0_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "0_RID" }} , 
 	{ "name": "m_axi_gmem1_0_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gmem1", "role": "0_RFIFONUM" }} , 
 	{ "name": "m_axi_gmem1_0_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "0_RUSER" }} , 
 	{ "name": "m_axi_gmem1_0_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem1", "role": "0_RRESP" }} , 
 	{ "name": "m_axi_gmem1_0_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "0_BVALID" }} , 
 	{ "name": "m_axi_gmem1_0_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "0_BREADY" }} , 
 	{ "name": "m_axi_gmem1_0_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem1", "role": "0_BRESP" }} , 
 	{ "name": "m_axi_gmem1_0_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "0_BID" }} , 
 	{ "name": "m_axi_gmem1_0_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "0_BUSER" }}  ]}

set ArgLastReadFirstWriteLatency {
	pointwise_conv_Pipeline_VITIS_LOOP_83_4 {
		pw_weights {Type I LastRead 16 FirstWrite -1}
		sext_ln87_2 {Type I LastRead 0 FirstWrite -1}
		sext_ln87_4 {Type I LastRead 0 FirstWrite -1}
		sext_ln87_6 {Type I LastRead 0 FirstWrite -1}
		sext_ln87_8 {Type I LastRead 0 FirstWrite -1}
		sext_ln87_10 {Type I LastRead 0 FirstWrite -1}
		sext_ln87_12 {Type I LastRead 0 FirstWrite -1}
		sext_ln87_14 {Type I LastRead 0 FirstWrite -1}
		sext_ln87_16 {Type I LastRead 0 FirstWrite -1}
		sext_ln87_18 {Type I LastRead 0 FirstWrite -1}
		sext_ln87_20 {Type I LastRead 0 FirstWrite -1}
		sext_ln87_22 {Type I LastRead 0 FirstWrite -1}
		sext_ln87_24 {Type I LastRead 0 FirstWrite -1}
		sext_ln87_26 {Type I LastRead 0 FirstWrite -1}
		sext_ln87_28 {Type I LastRead 0 FirstWrite -1}
		sext_ln87_30 {Type I LastRead 0 FirstWrite -1}
		sext_ln87_32 {Type I LastRead 0 FirstWrite -1}
		sext_ln87_34 {Type I LastRead 0 FirstWrite -1}
		sext_ln87_36 {Type I LastRead 0 FirstWrite -1}
		sext_ln87_38 {Type I LastRead 0 FirstWrite -1}
		sext_ln87_40 {Type I LastRead 0 FirstWrite -1}
		sext_ln87_42 {Type I LastRead 0 FirstWrite -1}
		sext_ln87_44 {Type I LastRead 0 FirstWrite -1}
		sext_ln87_46 {Type I LastRead 0 FirstWrite -1}
		sext_ln87_48 {Type I LastRead 0 FirstWrite -1}
		sext_ln87_50 {Type I LastRead 0 FirstWrite -1}
		sext_ln87_52 {Type I LastRead 0 FirstWrite -1}
		sext_ln87_54 {Type I LastRead 0 FirstWrite -1}
		sext_ln87_56 {Type I LastRead 0 FirstWrite -1}
		sext_ln87_58 {Type I LastRead 0 FirstWrite -1}
		sext_ln87_60 {Type I LastRead 0 FirstWrite -1}
		sext_ln87_62 {Type I LastRead 0 FirstWrite -1}
		sext_ln87_63 {Type I LastRead 0 FirstWrite -1}
		zext_ln83 {Type I LastRead 0 FirstWrite -1}
		output_tensor {Type I LastRead 0 FirstWrite -1}
		gmem1 {Type O LastRead 36 FirstWrite 35}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "538", "Max" : "538"}
	, {"Name" : "Interval", "Min" : "538", "Max" : "538"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	pw_weights { ap_memory {  { pw_weights_address0 mem_address 1 10 }  { pw_weights_ce0 mem_ce 1 1 }  { pw_weights_q0 mem_dout 0 16 }  { pw_weights_address1 MemPortADDR2 1 10 }  { pw_weights_ce1 MemPortCE2 1 1 }  { pw_weights_q1 MemPortDOUT2 0 16 } } }
	sext_ln87_2 { ap_none {  { sext_ln87_2 in_data 0 16 } } }
	sext_ln87_4 { ap_none {  { sext_ln87_4 in_data 0 16 } } }
	sext_ln87_6 { ap_none {  { sext_ln87_6 in_data 0 16 } } }
	sext_ln87_8 { ap_none {  { sext_ln87_8 in_data 0 16 } } }
	sext_ln87_10 { ap_none {  { sext_ln87_10 in_data 0 16 } } }
	sext_ln87_12 { ap_none {  { sext_ln87_12 in_data 0 16 } } }
	sext_ln87_14 { ap_none {  { sext_ln87_14 in_data 0 16 } } }
	sext_ln87_16 { ap_none {  { sext_ln87_16 in_data 0 16 } } }
	sext_ln87_18 { ap_none {  { sext_ln87_18 in_data 0 16 } } }
	sext_ln87_20 { ap_none {  { sext_ln87_20 in_data 0 16 } } }
	sext_ln87_22 { ap_none {  { sext_ln87_22 in_data 0 16 } } }
	sext_ln87_24 { ap_none {  { sext_ln87_24 in_data 0 16 } } }
	sext_ln87_26 { ap_none {  { sext_ln87_26 in_data 0 16 } } }
	sext_ln87_28 { ap_none {  { sext_ln87_28 in_data 0 16 } } }
	sext_ln87_30 { ap_none {  { sext_ln87_30 in_data 0 16 } } }
	sext_ln87_32 { ap_none {  { sext_ln87_32 in_data 0 16 } } }
	sext_ln87_34 { ap_none {  { sext_ln87_34 in_data 0 16 } } }
	sext_ln87_36 { ap_none {  { sext_ln87_36 in_data 0 16 } } }
	sext_ln87_38 { ap_none {  { sext_ln87_38 in_data 0 16 } } }
	sext_ln87_40 { ap_none {  { sext_ln87_40 in_data 0 16 } } }
	sext_ln87_42 { ap_none {  { sext_ln87_42 in_data 0 16 } } }
	sext_ln87_44 { ap_none {  { sext_ln87_44 in_data 0 16 } } }
	sext_ln87_46 { ap_none {  { sext_ln87_46 in_data 0 16 } } }
	sext_ln87_48 { ap_none {  { sext_ln87_48 in_data 0 16 } } }
	sext_ln87_50 { ap_none {  { sext_ln87_50 in_data 0 16 } } }
	sext_ln87_52 { ap_none {  { sext_ln87_52 in_data 0 16 } } }
	sext_ln87_54 { ap_none {  { sext_ln87_54 in_data 0 16 } } }
	sext_ln87_56 { ap_none {  { sext_ln87_56 in_data 0 16 } } }
	sext_ln87_58 { ap_none {  { sext_ln87_58 in_data 0 16 } } }
	sext_ln87_60 { ap_none {  { sext_ln87_60 in_data 0 16 } } }
	sext_ln87_62 { ap_none {  { sext_ln87_62 in_data 0 16 } } }
	sext_ln87_63 { ap_none {  { sext_ln87_63 in_data 0 16 } } }
	zext_ln83 { ap_none {  { zext_ln83 in_data 0 12 } } }
	output_tensor { ap_none {  { output_tensor in_data 0 64 } } }
	 { m_axi {  { m_axi_gmem1_0_AWVALID VALID 1 1 }  { m_axi_gmem1_0_AWREADY READY 0 1 }  { m_axi_gmem1_0_AWADDR ADDR 1 64 }  { m_axi_gmem1_0_AWID ID 1 1 }  { m_axi_gmem1_0_AWLEN SIZE 1 32 }  { m_axi_gmem1_0_AWSIZE BURST 1 3 }  { m_axi_gmem1_0_AWBURST LOCK 1 2 }  { m_axi_gmem1_0_AWLOCK CACHE 1 2 }  { m_axi_gmem1_0_AWCACHE PROT 1 4 }  { m_axi_gmem1_0_AWPROT QOS 1 3 }  { m_axi_gmem1_0_AWQOS REGION 1 4 }  { m_axi_gmem1_0_AWREGION USER 1 4 }  { m_axi_gmem1_0_AWUSER DATA 1 1 }  { m_axi_gmem1_0_WVALID VALID 1 1 }  { m_axi_gmem1_0_WREADY READY 0 1 }  { m_axi_gmem1_0_WDATA FIFONUM 1 16 }  { m_axi_gmem1_0_WSTRB STRB 1 2 }  { m_axi_gmem1_0_WLAST LAST 1 1 }  { m_axi_gmem1_0_WID ID 1 1 }  { m_axi_gmem1_0_WUSER DATA 1 1 }  { m_axi_gmem1_0_ARVALID VALID 1 1 }  { m_axi_gmem1_0_ARREADY READY 0 1 }  { m_axi_gmem1_0_ARADDR ADDR 1 64 }  { m_axi_gmem1_0_ARID ID 1 1 }  { m_axi_gmem1_0_ARLEN SIZE 1 32 }  { m_axi_gmem1_0_ARSIZE BURST 1 3 }  { m_axi_gmem1_0_ARBURST LOCK 1 2 }  { m_axi_gmem1_0_ARLOCK CACHE 1 2 }  { m_axi_gmem1_0_ARCACHE PROT 1 4 }  { m_axi_gmem1_0_ARPROT QOS 1 3 }  { m_axi_gmem1_0_ARQOS REGION 1 4 }  { m_axi_gmem1_0_ARREGION USER 1 4 }  { m_axi_gmem1_0_ARUSER DATA 1 1 }  { m_axi_gmem1_0_RVALID VALID 0 1 }  { m_axi_gmem1_0_RREADY READY 1 1 }  { m_axi_gmem1_0_RDATA FIFONUM 0 16 }  { m_axi_gmem1_0_RLAST LAST 0 1 }  { m_axi_gmem1_0_RID ID 0 1 }  { m_axi_gmem1_0_RFIFONUM LEN 0 10 }  { m_axi_gmem1_0_RUSER DATA 0 1 }  { m_axi_gmem1_0_RRESP RESP 0 2 }  { m_axi_gmem1_0_BVALID VALID 0 1 }  { m_axi_gmem1_0_BREADY READY 1 1 }  { m_axi_gmem1_0_BRESP RESP 0 2 }  { m_axi_gmem1_0_BID ID 0 1 }  { m_axi_gmem1_0_BUSER DATA 0 1 } } }
}
