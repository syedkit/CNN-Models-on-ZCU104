set ModuleHierarchy {[{
"Name" : "resnet50_bottleneck", "RefName" : "resnet50_bottleneck","ID" : "0","Type" : "sequential",
"SubLoops" : [
	{"Name" : "VITIS_LOOP_36_1","RefName" : "VITIS_LOOP_36_1","ID" : "1","Type" : "no",
	"SubLoops" : [
	{"Name" : "VITIS_LOOP_37_2","RefName" : "VITIS_LOOP_37_2","ID" : "2","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_resnet50_bottleneck_Pipeline_VITIS_LOOP_40_3_fu_151", "RefName" : "resnet50_bottleneck_Pipeline_VITIS_LOOP_40_3","ID" : "3","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_40_3","RefName" : "VITIS_LOOP_40_3","ID" : "4","Type" : "pipeline"},]},
		{"Name" : "grp_resnet50_bottleneck_Pipeline_VITIS_LOOP_55_4_fu_161", "RefName" : "resnet50_bottleneck_Pipeline_VITIS_LOOP_55_4","ID" : "5","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_55_4","RefName" : "VITIS_LOOP_55_4","ID" : "6","Type" : "pipeline"},]},
		{"Name" : "grp_resnet50_bottleneck_Pipeline_VITIS_LOOP_61_5_fu_167", "RefName" : "resnet50_bottleneck_Pipeline_VITIS_LOOP_61_5","ID" : "7","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_61_5","RefName" : "VITIS_LOOP_61_5","ID" : "8","Type" : "pipeline"},]},]},]},]
}]}