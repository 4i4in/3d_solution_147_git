function exe_return_humanoid_sceleton_anim_cycle_01()
{
	var _struct =
		{
			//done
			walk_R_01_flat :		[	["walk_passing_R",15,[0,1,1],["col_ass_fwd","col_shd_right","col_shd_left"]],	["walk_up_R",15,[0,1,1],["col_ass_fwd","col_shd_right","col_shd_left"]],	["walk_contact_R",10,[0,1,1],["ass_Ltoe","fwd_step_up","fwd_step_flat","fwd_step_down","col_ass_fwd","col_shd_right","col_shd_left"]],	["walk_down_R",10,[0,1,1],["ass_Ltoe","fwd_step_up","fwd_step_flat","fwd_step_down","col_ass_fwd","col_shd_right","col_shd_left"]],	["walk_ddown_R",10,[0,1,1],["ass_Ltoe","fwd_step_up","fwd_step_flat","fwd_step_down","col_ass_fwd","col_shd_right","col_shd_left"]],	["walk_d3own_R",15,[0,1,1],["ass_Ltoe","fwd_step_up","fwd_step_flat","fwd_step_down","col_ass_fwd","col_shd_right","col_shd_left"]],			],
			walk_L_01_flat :		[	["walk_passing_L",15,[0,1,1],["col_ass_fwd","col_shd_right","col_shd_left"]],	["walk_up_L",15,[0,1,1],["col_ass_fwd","col_shd_right","col_shd_left"]],	["walk_contact_L",10,[0,1,1],["ass_Rtoe","fwd_step_up","fwd_step_flat","fwd_step_down","col_ass_fwd","col_shd_right","col_shd_left"]],	["walk_down_L",10,[0,1,1],["ass_Rtoe","fwd_step_up","fwd_step_flat","fwd_step_down","col_ass_fwd","col_shd_right","col_shd_left"]],	["walk_ddown_L",10,[0,1,1],["ass_Rtoe","fwd_step_up","fwd_step_flat","fwd_step_down","col_ass_fwd","col_shd_right","col_shd_left"]],	["walk_d3own_L",15,[0,1,1],["ass_Rtoe","fwd_step_up","fwd_step_flat","fwd_step_down","col_ass_fwd","col_shd_right","col_shd_left"]],			],
			
			walk_R_01_stepup :		[	["walk_passing_R",15,[0,1,1],["col_ass_fwd","col_shd_right","col_shd_left"]],	["walk_up_R",15,[0,1,1],["col_ass_fwd","col_shd_right","col_shd_left"]],	["walk_step_up_R",15,[0,1,1],["col_ass_fwd","col_shd_right","col_shd_left"]],	["walk_step_up_down_R",10,[0,1,1],["ass_Ltoe","fwd_step_up","fwd_step_flat","fwd_step_down","col_ass_fwd","col_shd_right","col_shd_left"]],	["walk_down_R",10,[0,1,1],["ass_Ltoe","fwd_step_up","fwd_step_flat","fwd_step_down","col_ass_fwd","col_shd_right","col_shd_left"]],	["walk_ddown_R",10,[0,1,1],["ass_Ltoe","fwd_step_up","fwd_step_flat","fwd_step_down","col_ass_fwd","col_shd_right","col_shd_left"]],	["walk_d3own_R",15,[0,1,1],["ass_Ltoe","fwd_step_up","fwd_step_flat","fwd_step_down","col_ass_fwd","col_shd_right","col_shd_left"]],			],
			walk_L_01_stepup :		[	["walk_passing_L",15,[0,1,1],["col_ass_fwd","col_shd_right","col_shd_left"]],	["walk_up_L",15,[0,1,1],["col_ass_fwd","col_shd_right","col_shd_left"]],	["walk_step_up_L",15,[0,1,1],["col_ass_fwd","col_shd_right","col_shd_left"]],	["walk_step_up_down_L",10,[0,1,1],["ass_Rtoe","fwd_step_up","fwd_step_flat","fwd_step_down","col_ass_fwd","col_shd_right","col_shd_left"]],	["walk_down_L",10,[0,1,1],["ass_Rtoe","fwd_step_up","fwd_step_flat","fwd_step_down","col_ass_fwd","col_shd_right","col_shd_left"]],	["walk_ddown_L",10,[0,1,1],["ass_Rtoe","fwd_step_up","fwd_step_flat","fwd_step_down","col_ass_fwd","col_shd_right","col_shd_left"]],	["walk_d3own_L",15,[0,1,1],["ass_Rtoe","fwd_step_up","fwd_step_flat","fwd_step_down","col_ass_fwd","col_shd_right","col_shd_left"]],			],
			
			walk_R_01_stepdown :	[	["walk_passing_R",15,[0,1,1],["col_ass_fwd","col_shd_right","col_shd_left"]],	["walk_up_R",15,[0,1,1],["col_ass_fwd","col_shd_right","col_shd_left"]],	["walk_step_down_R",15,[0,1,1],["col_ass_fwd","col_shd_right","col_shd_left"]],	["walk_step_down2_R",15,[0,1,1],["ass_Ltoe","fwd_step_up","fwd_step_flat","fwd_step_down","col_ass_fwd","col_shd_right","col_shd_left"]],	["walk_step_down3_R",10,[0,1,1],["ass_Ltoe","fwd_step_up","fwd_step_flat","fwd_step_down","col_ass_fwd","col_shd_right","col_shd_left"]],	],
			walk_L_01_stepdown :	[	["walk_passing_L",15,[0,1,1],["col_ass_fwd","col_shd_right","col_shd_left"]],	["walk_up_L",15,[0,1,1],["col_ass_fwd","col_shd_right","col_shd_left"]],	["walk_step_down_L",15,[0,1,1],["col_ass_fwd","col_shd_right","col_shd_left"]],	["walk_step_down2_L",15,[0,1,1],["ass_Rtoe","fwd_step_up","fwd_step_flat","fwd_step_down","col_ass_fwd","col_shd_right","col_shd_left"]],	["walk_step_down3_L",10,[0,1,1],["ass_Rtoe","fwd_step_up","fwd_step_flat","fwd_step_down","col_ass_fwd","col_shd_right","col_shd_left"]],	],
			
			//done
			noone_cycle :			[],
			//faling_cycle :			[	["falling_short_01",20,[0,1,1],["rec_Ltoe","rec_Rtoe","ass_inertial","col_ass_fwd","col_shd_right","col_shd_left","col_ass_back"]],				["falling_left_01",20,[0,1,1],["rec_Ltoe","rec_Rtoe","ass_inertial","col_ass_fwd","col_shd_right","col_shd_left","col_ass_back"]],						["falling_right_01",20,[0,1,1],["rec_Ltoe","rec_Rtoe","ass_inertial","col_ass_fwd","col_shd_right","col_shd_left","col_ass_back"]]			],
			faling_cycle :			[	["falling_short_01",20,[0,1,1],["rec_Ltoe","rec_Rtoe","ass_inertial","col_ass_fb","col_shd_sides"]],				["falling_left_01",20,[0,1,1],["rec_Ltoe","rec_Rtoe","ass_inertial","col_ass_fb","col_shd_sides"]],						["falling_right_01",20,[0,1,1],["rec_Ltoe","rec_Rtoe","ass_inertial","col_ass_fb","col_shd_sides"]]			],
			
			landing_light_R :		[	["landing_light_R_01",5,[0,1,1],[]],				],
			landing_light_L :		[	["landing_light_L_01",5,[0,1,1],[]],				],
			
			landing_medium_R :		[	["landing_medium_R_01",5,[0,1,1],[]],									["landing_light_R_01",15,[0,1,1],[]],					],
			landing_medium_L :		[	["landing_medium_L_01",5,[0,1,1],[]],									["landing_light_L_01",15,[0,1,1],[]],					],
				
			landing_hard_R :		[	["landing_hard_R_01",15,[0,1,1],[]],									["landing_medium_R_01",15,[0,1,1],[]],										["landing_light_R_01",15,[0,1,1],[]],							],
			landing_hard_L :		[	["landing_hard_L_01",15,[0,1,1],[]],									["landing_medium_L_01",15,[0,1,1],[]],										["landing_light_L_01",15,[0,1,1],[]],							],
			
			idle_start_R :			[	["idle_start_R_01",30,[0,1,1],["fwd_step_up","fwd_step_flat","fwd_step_down"]],		["idle_start_C_0R",15,[0,1,1],["fwd_step_up","fwd_step_flat","fwd_step_down"]],		["idle_start_C_1R",10,[0,1,1],["ass_Ltoe","fwd_step_up","fwd_step_flat","fwd_step_down"]],			],
			idle_start_L :			[	["idle_start_L_01",30,[0,1,1],["fwd_step_up","fwd_step_flat","fwd_step_down"]],		["idle_start_C_0L",15,[0,1,1],["fwd_step_up","fwd_step_flat","fwd_step_down"]],		["idle_start_C_1L",10,[0,1,1],["ass_Rtoe","fwd_step_up","fwd_step_down","fwd_step_down"]],			],
			
			idle_R_01 :				[	["idle_R_02",45,[0,1,1],["fwd_step_up","fwd_step_flat","fwd_step_down"]],			["idle_start_R_01",45,[0,1,1],["fwd_step_up","fwd_step_flat","fwd_step_down"]],		["idle_R_01",45,[0,1,1],["fwd_step_up","fwd_step_flat","fwd_step_down"]],		["idle_left_02",45,[0,1,1],["fwd_step_up","fwd_step_flat","fwd_step_down"]],			["idle_right_02",45,[0,1,1],["fwd_step_up","fwd_step_flat","fwd_step_down"]],						],
			idle_L_01 :				[	["idle_L_02",45,[0,1,1],["fwd_step_up","fwd_step_flat","fwd_step_down"]],			["idle_start_L_01",45,[0,1,1],["fwd_step_up","fwd_step_flat","fwd_step_down"]],		["idle_L_01",45,[0,1,1],["fwd_step_up","fwd_step_flat","fwd_step_down"]],		["idle_right_02",45,[0,1,1],["fwd_step_up","fwd_step_flat","fwd_step_down"]],			["idle_left_02",45,[0,1,1],["fwd_step_up","fwd_step_flat","fwd_step_down"]],						],
			
			idle_R_02 :				[	["idle_left_02",45,[0,1,1],["fwd_step_up","fwd_step_flat","fwd_step_down"]],		["idle_right_02",45,[0,1,1],["fwd_step_up","fwd_step_flat","fwd_step_down"]],						],
			idle_L_02 :				[	["idle_right_02",45,[0,1,1],["fwd_step_up","fwd_step_flat","fwd_step_down"]],		["idle_left_02",45,[0,1,1],["fwd_step_up","fwd_step_flat","fwd_step_down"]],							],
			
		}
	return(_struct);
}