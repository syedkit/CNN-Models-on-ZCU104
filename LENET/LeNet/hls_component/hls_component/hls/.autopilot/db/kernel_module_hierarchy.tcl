set ModuleHierarchy {[{
"Name" : "lenet_kernel", "RefName" : "lenet_kernel","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_lenet_kernel_Pipeline_VITIS_LOOP_25_1_fu_107", "RefName" : "lenet_kernel_Pipeline_VITIS_LOOP_25_1","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_25_1","RefName" : "VITIS_LOOP_25_1","ID" : "2","Type" : "pipeline"},]},
	{"Name" : "grp_lenet_kernel_Pipeline_VITIS_LOOP_31_2_fu_115", "RefName" : "lenet_kernel_Pipeline_VITIS_LOOP_31_2","ID" : "3","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_31_2","RefName" : "VITIS_LOOP_31_2","ID" : "4","Type" : "pipeline"},]},]
}]}