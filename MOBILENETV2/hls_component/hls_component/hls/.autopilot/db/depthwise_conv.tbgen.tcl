set moduleName depthwise_conv
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
set C_modelName {depthwise_conv}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict dw_weights { MEM_WIDTH 16 MEM_SIZE 576 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ input_stream int 16 regular {fifo 0 volatile }  }
	{ internal_fifo int 16 regular {fifo 1 volatile }  }
	{ dw_weights int 16 regular {array 288 { 1 1 } 1 1 }  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "input_stream", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "internal_fifo", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "dw_weights", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 23
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ input_stream_dout sc_in sc_lv 16 signal 0 } 
	{ input_stream_empty_n sc_in sc_logic 1 signal 0 } 
	{ input_stream_read sc_out sc_logic 1 signal 0 } 
	{ input_stream_num_data_valid sc_in sc_lv 3 signal 0 } 
	{ input_stream_fifo_cap sc_in sc_lv 3 signal 0 } 
	{ internal_fifo_din sc_out sc_lv 16 signal 1 } 
	{ internal_fifo_full_n sc_in sc_logic 1 signal 1 } 
	{ internal_fifo_write sc_out sc_logic 1 signal 1 } 
	{ internal_fifo_num_data_valid sc_in sc_lv 32 signal 1 } 
	{ internal_fifo_fifo_cap sc_in sc_lv 32 signal 1 } 
	{ dw_weights_address0 sc_out sc_lv 9 signal 2 } 
	{ dw_weights_ce0 sc_out sc_logic 1 signal 2 } 
	{ dw_weights_q0 sc_in sc_lv 16 signal 2 } 
	{ dw_weights_address1 sc_out sc_lv 9 signal 2 } 
	{ dw_weights_ce1 sc_out sc_logic 1 signal 2 } 
	{ dw_weights_q1 sc_in sc_lv 16 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "input_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_stream", "role": "dout" }} , 
 	{ "name": "input_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_stream", "role": "empty_n" }} , 
 	{ "name": "input_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_stream", "role": "read" }} , 
 	{ "name": "input_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "input_stream", "role": "num_data_valid" }} , 
 	{ "name": "input_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "input_stream", "role": "fifo_cap" }} , 
 	{ "name": "internal_fifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "internal_fifo", "role": "din" }} , 
 	{ "name": "internal_fifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "internal_fifo", "role": "full_n" }} , 
 	{ "name": "internal_fifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "internal_fifo", "role": "write" }} , 
 	{ "name": "internal_fifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "internal_fifo", "role": "num_data_valid" }} , 
 	{ "name": "internal_fifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "internal_fifo", "role": "fifo_cap" }} , 
 	{ "name": "dw_weights_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "dw_weights", "role": "address0" }} , 
 	{ "name": "dw_weights_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dw_weights", "role": "ce0" }} , 
 	{ "name": "dw_weights_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "dw_weights", "role": "q0" }} , 
 	{ "name": "dw_weights_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "dw_weights", "role": "address1" }} , 
 	{ "name": "dw_weights_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dw_weights", "role": "ce1" }} , 
 	{ "name": "dw_weights_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "dw_weights", "role": "q1" }}  ]}

set ArgLastReadFirstWriteLatency {
	depthwise_conv {
		input_stream {Type I LastRead 0 FirstWrite -1}
		internal_fifo {Type O LastRead -1 FirstWrite 12}
		dw_weights {Type I LastRead 5 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "501769", "Max" : "501769"}
	, {"Name" : "Interval", "Min" : "501769", "Max" : "501769"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	input_stream { ap_fifo {  { input_stream_dout fifo_data_in 0 16 }  { input_stream_empty_n fifo_status 0 1 }  { input_stream_read fifo_port_we 1 1 }  { input_stream_num_data_valid fifo_status_num_data_valid 0 3 }  { input_stream_fifo_cap fifo_update 0 3 } } }
	internal_fifo { ap_fifo {  { internal_fifo_din fifo_data_in 1 16 }  { internal_fifo_full_n fifo_status 0 1 }  { internal_fifo_write fifo_port_we 1 1 }  { internal_fifo_num_data_valid fifo_status_num_data_valid 0 32 }  { internal_fifo_fifo_cap fifo_update 0 32 } } }
	dw_weights { ap_memory {  { dw_weights_address0 mem_address 1 9 }  { dw_weights_ce0 mem_ce 1 1 }  { dw_weights_q0 mem_dout 0 16 }  { dw_weights_address1 MemPortADDR2 1 9 }  { dw_weights_ce1 MemPortCE2 1 1 }  { dw_weights_q1 MemPortDOUT2 0 16 } } }
}
