set ModuleHierarchy {[{
"Name" : "mobilenetv2_block", "RefName" : "mobilenetv2_block","ID" : "0","Type" : "dataflow",
"SubInsts" : [
	{"Name" : "Loop_VITIS_LOOP_117_1_proc_U0", "RefName" : "Loop_VITIS_LOOP_117_1_proc","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_117_1","RefName" : "VITIS_LOOP_117_1","ID" : "2","Type" : "pipeline"},]},
	{"Name" : "depthwise_conv_U0", "RefName" : "depthwise_conv","ID" : "3","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_27_1_VITIS_LOOP_28_2_VITIS_LOOP_29_3","RefName" : "VITIS_LOOP_27_1_VITIS_LOOP_28_2_VITIS_LOOP_29_3","ID" : "4","Type" : "pipeline"},]},
	{"Name" : "pointwise_conv_U0", "RefName" : "pointwise_conv","ID" : "5","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_72_1","RefName" : "VITIS_LOOP_72_1","ID" : "6","Type" : "no",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_73_2","RefName" : "VITIS_LOOP_73_2","ID" : "7","Type" : "no",
			"SubInsts" : [
			{"Name" : "grp_pointwise_conv_Pipeline_VITIS_LOOP_77_3_fu_414", "RefName" : "pointwise_conv_Pipeline_VITIS_LOOP_77_3","ID" : "8","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_77_3","RefName" : "VITIS_LOOP_77_3","ID" : "9","Type" : "pipeline"},]},
			{"Name" : "grp_pointwise_conv_Pipeline_VITIS_LOOP_83_4_fu_421", "RefName" : "pointwise_conv_Pipeline_VITIS_LOOP_83_4","ID" : "10","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_83_4","RefName" : "VITIS_LOOP_83_4","ID" : "11","Type" : "pipeline"},]},]},]},]},]
}]}