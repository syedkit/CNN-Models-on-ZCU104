set ModuleHierarchy {[{
"Name" : "alexnet_layer1", "RefName" : "alexnet_layer1","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_alexnet_layer1_Pipeline_VITIS_LOOP_36_1_VITIS_LOOP_38_2_VITIS_LOOP_39_3_VITIS_LO_fu_134", "RefName" : "alexnet_layer1_Pipeline_VITIS_LOOP_36_1_VITIS_LOOP_38_2_VITIS_LOOP_39_3_VITIS_LO","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_36_1_VITIS_LOOP_38_2_VITIS_LOOP_39_3_VITIS_LOOP_40_4","RefName" : "VITIS_LOOP_36_1_VITIS_LOOP_38_2_VITIS_LOOP_39_3_VITIS_LOOP_40_4","ID" : "2","Type" : "pipeline"},]},
	{"Name" : "grp_alexnet_layer1_Pipeline_VITIS_LOOP_49_5_VITIS_LOOP_50_6_VITIS_LOOP_51_7_fu_148", "RefName" : "alexnet_layer1_Pipeline_VITIS_LOOP_49_5_VITIS_LOOP_50_6_VITIS_LOOP_51_7","ID" : "3","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_49_5_VITIS_LOOP_50_6_VITIS_LOOP_51_7","RefName" : "VITIS_LOOP_49_5_VITIS_LOOP_50_6_VITIS_LOOP_51_7","ID" : "4","Type" : "no"},]},]
}]}