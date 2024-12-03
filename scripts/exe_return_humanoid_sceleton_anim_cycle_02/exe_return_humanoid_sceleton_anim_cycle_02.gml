function exe_return_humanoid_sceleton_anim_cycle_02()
{
	var _struct =
		{
			//jump
			jump_up_start_L :		[	["jump_start_i_L_1",10,[0,1,1],["col_ass_fwd","col_shd_right","col_shd_left","col_ass_back"]],	["jump_start_i_L_2",15,[0,1,1],["col_ass_fwd","col_shd_right","col_shd_left","col_ass_back"]]		],
			jump_up_start_R :		[	["jump_start_i_R_1",10,[0,1,1],["col_ass_fwd","col_shd_right","col_shd_left","col_ass_back"]],	["jump_start_i_R_2",15,[0,1,1],["col_ass_fwd","col_shd_right","col_shd_left","col_ass_back"]]		],
			
			jump_up_continue_L :	[	["jump_continue_i_L_1",2,[0,1,1],["col_ass_fb","col_shd_sides","rec_past_present"]]			],
			jump_up_continue_R :	[	["jump_continue_i_R_1",2,[0,1,1],["col_ass_fb","col_shd_sides","rec_past_present"]]			],
			
			//jog flat
			jog1_L_01_flat :		[	["jog_passing_L_flat",12,[0,1,1],["rec_Rtoe","col_ass_fwd","col_shd_right","col_shd_left"]],			["jog_push_off_L_flat",8,[0,1,1],["rec_Rtoe","col_ass_fwd","col_shd_right","col_shd_left"]],		],
			jog1_R_01_flat :		[	["jog_passing_R_flat",12,[0,1,1],["rec_Ltoe","col_ass_fwd","col_shd_right","col_shd_left"]],			["jog_push_off_R_flat",8,[0,1,1],["rec_Ltoe","col_ass_fwd","col_shd_right","col_shd_left"]],		],
			
				//jump in jog
			jog2_L_01_flat :		[	["jogJ_up_L_flat",2,[0,1,1],["col_ass_fb","col_shd_sides","rec_past_present"]]			],
			jog2_R_01_flat :		[	["jogJ_up_R_flat",2,[0,1,1],["col_ass_fb","col_shd_sides","rec_past_present"]]			],
				
				//reaching ground
			jog3_L_01_flat :		[	["jog_contact_L_flat",2,[0,1,1],["rec_Rtoe","ass_inertial","col_ass_fb","col_shd_sides"]],		],
			jog3_R_01_flat :		[	["jog_contact_R_flat",2,[0,1,1],["rec_Ltoe","ass_inertial","col_ass_fb","col_shd_sides"]],		],
			
			
			//jog stepup
			jog1_L_01_stepup :		[	["jog_passing_L_stepup",15,[0,1,1],["rec_Rtoe","col_ass_fwd","col_shd_right","col_shd_left"]],			["jog_push_off_L_stepup",10,[0,1,1],["rec_Rtoe","col_ass_fwd","col_shd_right","col_shd_left"]],		],
			jog1_R_01_stepup :		[	["jog_passing_R_stepup",15,[0,1,1],["rec_Ltoe","col_ass_fwd","col_shd_right","col_shd_left"]],			["jog_push_off_R_stepup",10,[0,1,1],["rec_Ltoe","col_ass_fwd","col_shd_right","col_shd_left"]],		],
			
				//jump in jog
			jog2_L_01_stepup :		[	["jogJ_up_L_stepup",2,[0,1,1],["col_ass_fb","col_shd_sides","rec_past_present"]]			],
			jog2_R_01_stepup :		[	["jogJ_up_R_stepup",2,[0,1,1],["col_ass_fb","col_shd_sides","rec_past_present"]]			],
				
				//reaching ground
			jog3_L_01_stepup :		[	["jog_contact_L_stepup",2,[0,1,1],["rec_Rtoe","ass_inertial","col_ass_fb","col_shd_sides"]],		],
			jog3_R_01_stepup :		[	["jog_contact_R_stepup",2,[0,1,1],["rec_Ltoe","ass_inertial","col_ass_fb","col_shd_sides"]],		],
			
			
			//jog stepdown
			jog1_L_01_stepdown :	[	["jog_passing_L_stepdown",15,[0,1,1],["rec_Rtoe","col_ass_fwd","col_shd_right","col_shd_left"]],			["jog_push_off_L_stepdown",10,[0,1,1],["rec_Rtoe","col_ass_fwd","col_shd_right","col_shd_left"]],		],
			jog1_R_01_stepdown :	[	["jog_passing_R_stepdown",15,[0,1,1],["rec_Ltoe","col_ass_fwd","col_shd_right","col_shd_left"]],			["jog_push_off_R_stepdown",10,[0,1,1],["rec_Ltoe","col_ass_fwd","col_shd_right","col_shd_left"]],		],
			
				//jump in jog
			jog2_L_01_stepdown :	[	["jogJ_up_L_stepdown",2,[0,1,1],["col_ass_fb","col_shd_sides","rec_past_present"]]			],
			jog2_R_01_stepdown :	[	["jogJ_up_R_stepdown",2,[0,1,1],["col_ass_fb","col_shd_sides","rec_past_present"]]			],
				
				//reaching ground
			jog3_L_01_stepdown :	[	["jog_contact_L_stepdown",2,[0,1,1],["rec_Rtoe","ass_inertial","col_ass_fb","col_shd_sides"]],		["jog_contact2_L_stepdown",8,[0,1,1],["rec_Rtoe","ass_inertial","col_ass_fb","col_shd_sides"]],		],
			jog3_R_01_stepdown :	[	["jog_contact_R_stepdown",2,[0,1,1],["rec_Ltoe","ass_inertial","col_ass_fb","col_shd_sides"]],		["jog_contact2_R_stepdown",8,[0,1,1],["rec_Ltoe","ass_inertial","col_ass_fb","col_shd_sides"]],		],
			
			//to new cycle
			//uniform for stepup down flat
			//TBD differnt landing force
			jog4_L_01_flat :		[	["jog_down_R_flat",8,[0,1,1],["anchor_fwd_ground_C","fwd_step_up","fwd_step_flat","fwd_step_down","rec_Rtoe","col_ass_fwd","col_shd_right","col_shd_left","col_ass_back"]],				],
			jog4_R_01_flat :		[	["jog_down_L_flat",8,[0,1,1],["anchor_fwd_ground_C","fwd_step_up","fwd_step_flat","fwd_step_down","rec_Ltoe","col_ass_fwd","col_shd_right","col_shd_left","col_ass_back"]],				],
			
			
			//done
			noone_cycle :			[],
			
		}
	return(_struct);
}