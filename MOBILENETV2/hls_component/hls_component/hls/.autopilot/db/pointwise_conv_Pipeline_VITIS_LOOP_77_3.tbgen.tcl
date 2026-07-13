set moduleName pointwise_conv_Pipeline_VITIS_LOOP_77_3
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
set C_modelName {pointwise_conv_Pipeline_VITIS_LOOP_77_3}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict pixel_channels { MEM_WIDTH 16 MEM_SIZE 64 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
set C_modelArgList {
	{ internal_fifo int 16 regular {fifo 0 volatile }  }
	{ pixel_channels int 16 regular {array 32 { 0 3 } 0 1 }  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "internal_fifo", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "pixel_channels", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 15
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ internal_fifo_dout sc_in sc_lv 16 signal 0 } 
	{ internal_fifo_empty_n sc_in sc_logic 1 signal 0 } 
	{ internal_fifo_read sc_out sc_logic 1 signal 0 } 
	{ internal_fifo_num_data_valid sc_in sc_lv 7 signal 0 } 
	{ internal_fifo_fifo_cap sc_in sc_lv 7 signal 0 } 
	{ pixel_channels_address0 sc_out sc_lv 5 signal 1 } 
	{ pixel_channels_ce0 sc_out sc_logic 1 signal 1 } 
	{ pixel_channels_we0 sc_out sc_logic 1 signal 1 } 
	{ pixel_channels_d0 sc_out sc_lv 16 signal 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "internal_fifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "internal_fifo", "role": "dout" }} , 
 	{ "name": "internal_fifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "internal_fifo", "role": "empty_n" }} , 
 	{ "name": "internal_fifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "internal_fifo", "role": "read" }} , 
 	{ "name": "internal_fifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "internal_fifo", "role": "num_data_valid" }} , 
 	{ "name": "internal_fifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "internal_fifo", "role": "fifo_cap" }} , 
 	{ "name": "pixel_channels_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "pixel_channels", "role": "address0" }} , 
 	{ "name": "pixel_channels_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "pixel_channels", "role": "ce0" }} , 
 	{ "name": "pixel_channels_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "pixel_channels", "role": "we0" }} , 
 	{ "name": "pixel_channels_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "pixel_channels", "role": "d0" }}  ]}

set ArgLastReadFirstWriteLatency {
	pointwise_conv_Pipeline_VITIS_LOOP_77_3 {
		internal_fifo {Type I LastRead 1 FirstWrite -1}
		pixel_channels {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "34", "Max" : "34"}
	, {"Name" : "Interval", "Min" : "34", "Max" : "34"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	internal_fifo { ap_fifo {  { internal_fifo_dout fifo_data_in 0 16 }  { internal_fifo_empty_n fifo_status 0 1 }  { internal_fifo_read fifo_port_we 1 1 }  { internal_fifo_num_data_valid fifo_status_num_data_valid 0 7 }  { internal_fifo_fifo_cap fifo_update 0 7 } } }
	pixel_channels { ap_memory {  { pixel_channels_address0 mem_address 1 5 }  { pixel_channels_ce0 mem_ce 1 1 }  { pixel_channels_we0 mem_we 1 1 }  { pixel_channels_d0 mem_din 1 16 } } }
}
