function exe_resolve_behaviour_cycle_humanoid_sceleton(_obj)
{
	var _anim_power = _obj.control_method.carry_anim_info;
	switch(_obj.control_method.ground_state)
		{
			case "falling":
				_obj.character_sheet.anim_pack = "humanoid_sceleton_anim_pack_01";
				_obj.character_sheet.anim_cycles = "humanoid_sceleton_anim_cycle_01";
				
				var _str = "faling_cycle";
				if _obj.control_method.behaviour_cycle != _str	{_obj.control_method.anim_stack[1] = 0;};
				_obj.control_method.behaviour_cycle = _str;
				break;
				
			case "landing":
				_obj.character_sheet.anim_pack = "humanoid_sceleton_anim_pack_01";
				_obj.character_sheet.anim_cycles = "humanoid_sceleton_anim_cycle_01";
				
				var _max_anim_power = 0;
				for(var _ii = 0; _ii < array_length(_anim_power); _ii++)
					{
						if _anim_power[_ii] > _max_anim_power	{_max_anim_power = _anim_power[_ii];};
					}			
				var _anim_power_str = "light"; //magic numbers to resolve later on
				if _max_anim_power > 20	{_anim_power_str = "medium"};
				if _max_anim_power > 40	{_anim_power_str = "hard"};
	
				var _dirstr = exe_resolve_anchor_letter(_obj);
				var _str = "landing_" + string(_anim_power_str) + _dirstr;
				if _obj.control_method.behaviour_cycle != _str	{_obj.control_method.anim_stack[1] = 0;};
				_obj.control_method.behaviour_cycle = _str;
				_obj.control_method.intertia_translation[0] = [0,0,0];
				break;
				
			case "idle":
				_obj.character_sheet.anim_pack = "humanoid_sceleton_anim_pack_01";
				_obj.character_sheet.anim_cycles = "humanoid_sceleton_anim_cycle_01";
				
				if string_starts_with(_obj.control_method.behaviour_cycle,"idle") 
					{
						if _anim_power == "recovery_exception"
							{
								_obj.control_method.behaviour_timers[0]++;
								var _dirstr = exe_resolve_anchor_letter(_obj);
								var _str = "idle_start" + _dirstr;
								_obj.control_method.behaviour_cycle = _str;
								_obj = exe_given_pose_anim_in_cycle(_obj,0);
							}
						else
							{
								if string_starts_with(_obj.control_method.behaviour_cycle,"idle_start")
									{
										_obj.control_method.behaviour_timers[0] = 0;//reset cycle counter
										var _dirstr = exe_resolve_anchor_letter(_obj);
										var _str = "idle" + _dirstr + "_01";
										_obj.control_method.behaviour_cycle = _str;
									}
								else
									{
										var _anim_num = (_anim_power[0] mod _anim_power[1])+1;
										var _dirstr = exe_resolve_anchor_letter(_obj);
										var _str = "idle" + _dirstr + "_0" + string(_anim_num);
										_obj.control_method.behaviour_cycle = _str;
										_obj = exe_given_pose_anim_in_cycle(_obj,0);
									}
							}
					}
				else	//cycle starts for first time
					{
						var _dirstr = exe_resolve_anchor_letter(_obj);
						var _str = "idle_start" + _dirstr; 
						_obj.control_method.behaviour_cycle = _str;
						_obj.control_method.anim_stack[1] = 0;
					}
				break;
				
			case "walk":
				_obj.character_sheet.anim_pack = "humanoid_sceleton_anim_pack_01";
				_obj.character_sheet.anim_cycles = "humanoid_sceleton_anim_cycle_01";
				
				var _step_up = 0;
				var _step_flat = 0;
				var _step_down = 0;
				_obj = exe_perform_colisions_on_obj(_obj,["info","fwd_step_up",0]);
				_step_up = exe_temp_check_if_any_colisions(_obj,"info");
				if _step_up < 1
					{		
						_obj = exe_perform_colisions_on_obj(_obj,["info","fwd_step_flat",0]);
						_step_flat = exe_temp_check_if_any_colisions(_obj,"info");
						if _step_flat < 1
							{
								_obj = exe_perform_colisions_on_obj(_obj,["info","fwd_step_down",0]);
								_step_down = exe_temp_check_if_any_colisions(_obj,"info");
							}
					}

				if string_starts_with(_obj.control_method.behaviour_cycle,"walk") 
					{	
						var _bc_str = string(_obj.control_method.behaviour_cycle);
						var _bc_switch = string_delete(_bc_str,8,99);
						switch(_bc_switch)
							{
								case "walk_L_":	_bc_str = string_replace(_bc_str,"_L_","_R_");	break;
								case "walk_R_":	_bc_str = string_replace(_bc_str,"_R_","_L_");	break;
							}
						_bc_str = string_delete(_bc_str,8,99);
						if		_step_up > 0	{	_bc_str += "01_stepup";		}
						else if _step_flat > 0	{	_bc_str += "01_flat";		}
						//else if _step_down > 0	{	_bc_str += "01_stepdown";	}
						else					{	_bc_str += "01_stepdown";	}
						
						_obj.control_method.behaviour_cycle = _bc_str;
						_obj.control_method.anim_stack[1] = 0;
						_obj = exe_given_pose_anim_in_cycle(_obj,0);
					}
				else	//cycle starts for first time
					{
						var _dirstr = exe_resolve_anchor_letter(_obj);
						
						if		_step_up > 0		{	var _str = "walk" + _dirstr + "_01_stepup";		}
						else if	_step_flat > 0		{	var _str = "walk" + _dirstr + "_01_flat";		}
						//else if	_step_down > 0		{	var _str = "walk" + _dirstr + "_01_stepdown";	}
						else						{	var _str = "walk" + _dirstr + "_01_stepdown";	}
						
						_obj.control_method.behaviour_cycle = _str;
						_obj.control_method.anim_stack[1] = 0;
						_obj = exe_given_pose_anim_in_cycle(_obj,0);
					}
				break;
				
			case "jump":
				_obj.character_sheet.anim_pack = "humanoid_sceleton_anim_pack_02";
				_obj.character_sheet.anim_cycles = "humanoid_sceleton_anim_cycle_02";
				
				if string_starts_with(_obj.control_method.behaviour_cycle,"jump")
					{
						if string_starts_with(_obj.control_method.behaviour_cycle,"jump_up_start_L")
							{	_obj.control_method.behaviour_cycle = "jump_up_continue_L";	};
						if string_starts_with(_obj.control_method.behaviour_cycle,"jump_up_start_R")
							{	_obj.control_method.behaviour_cycle = "jump_up_continue_R";	};
							
						_obj.control_method.anchor = [];
						
						_obj.control_method.intertia_translation[0] = variable_clone(_anim_power);	_obj.control_method.carry_anim_info	= [0,0,0];
						_obj.control_method.anim_stack[1] = 0;
						_obj = exe_given_pose_anim_in_cycle(_obj,0);
					}
				else
					{
						var _jump_dir_name = exe_return_direction_cast_vector(_obj,_anim_power);
						
				//show_debug_message("_jump_dir_name : " + string(_jump_dir_name));
						//TBD resolve jump direction by _jump_dir_name
						
						var _dirstr = exe_resolve_anchor_letter(_obj);
						var _str = "jump_up_start" + _dirstr;
						_obj.control_method.anim_stack[1] = 0;
						_obj.control_method.behaviour_cycle = _str;
						_obj = exe_given_pose_anim_in_cycle(_obj,0);
					}
				break;
				
			case "jog":
				_obj.character_sheet.anim_pack = "humanoid_sceleton_anim_pack_02";
				_obj.character_sheet.anim_cycles = "humanoid_sceleton_anim_cycle_02";
				
				
				if string_starts_with(_obj.control_method.behaviour_cycle,"jog1") 
					{	
						//to jump in jog
						if string_starts_with(_obj.control_method.behaviour_cycle,"jog1_L_01_flat")
							{	_obj.control_method.behaviour_cycle = "jog2_L_01_flat";	};
						if string_starts_with(_obj.control_method.behaviour_cycle,"jog1_R_01_flat")
							{	_obj.control_method.behaviour_cycle = "jog2_R_01_flat";	};
							
						if string_starts_with(_obj.control_method.behaviour_cycle,"jog1_L_01_stepup")
							{	_obj.control_method.behaviour_cycle = "jog2_L_01_stepup";	};
						if string_starts_with(_obj.control_method.behaviour_cycle,"jog1_R_01_stepup")
							{	_obj.control_method.behaviour_cycle = "jog2_R_01_stepup";	};
							
						if string_starts_with(_obj.control_method.behaviour_cycle,"jog1_L_01_stepdown")
							{	_obj.control_method.behaviour_cycle = "jog2_L_01_stepdown";	};
						if string_starts_with(_obj.control_method.behaviour_cycle,"jog1_R_01_stepdown")
							{	_obj.control_method.behaviour_cycle = "jog2_R_01_stepdown";	};	
								
							
						_obj.control_method.anchor = [];
						
						_obj.control_method.intertia_translation[0] = variable_clone(_anim_power);	_obj.control_method.carry_anim_info	= [0,0,0];
						_obj.control_method.anim_stack[1] = 0;
						_obj = exe_given_pose_anim_in_cycle(_obj,0);
			
					}
				else if string_starts_with(_obj.control_method.behaviour_cycle,"jog2") 
					{	
						if string_starts_with(_obj.control_method.behaviour_cycle,"jog2_L_01_flat")
							{	_obj.control_method.behaviour_cycle = "jog3_L_01_flat";	};
						if string_starts_with(_obj.control_method.behaviour_cycle,"jog2_R_01_flat")
							{	_obj.control_method.behaviour_cycle = "jog3_R_01_flat";	};
						
						if string_starts_with(_obj.control_method.behaviour_cycle,"jog2_L_01_stepup")
							{	_obj.control_method.behaviour_cycle = "jog3_L_01_stepup";	};
						if string_starts_with(_obj.control_method.behaviour_cycle,"jog2_R_01_stepup")
							{	_obj.control_method.behaviour_cycle = "jog3_R_01_stepup";	};
						
						if string_starts_with(_obj.control_method.behaviour_cycle,"jog2_L_01_stepdown")
							{	_obj.control_method.behaviour_cycle = "jog3_L_01_stepdown";	};
						if string_starts_with(_obj.control_method.behaviour_cycle,"jog3_R_01_stepdown")
							{	_obj.control_method.behaviour_cycle = "jog3_R_01_stepdown";	};
						
						_obj.control_method.anim_stack[1] = 0;
						_obj = exe_given_pose_anim_in_cycle(_obj,0);
					}
				else if string_starts_with(_obj.control_method.behaviour_cycle,"jog3") 
					{
						//TBD how hard landed
						//var _anim_power_str = "light"; //magic numbers to resolve later on
						//if _max_anim_power > 20	{_anim_power_str = "medium"};
						//if _max_anim_power > 40	{_anim_power_str = "hard"};
	
						var _dirstr = exe_resolve_anchor_letter(_obj);
						switch(_dirstr)
							{
								case "_L":	var _str = "jog4_L_01_flat";break;
								case "_R":	var _str = "jog4_R_01_flat"	break;
							}
						if _obj.control_method.behaviour_cycle != _str	{_obj.control_method.anim_stack[1] = 0;};
						_obj.control_method.behaviour_cycle = _str;
						_obj.control_method.intertia_translation[0] = [0,0,0];
					}
				else	//cycle starts for first time or continue
					{	
						var _step_up = 0;
						var _step_flat = 0;
						var _step_down = 0;
						
						//jog starting = always up
						if !string_starts_with(_obj.control_method.behaviour_cycle,"jog")	{_step_up = 1;}; 
						
						//continue jog check
						_obj = exe_perform_colisions_on_obj(_obj,["info","anchor_fwd_ground_C",0]);
						_step_up = exe_temp_check_if_any_colisions(_obj,"info");
						if _step_up < 1
							{	
								_obj = exe_perform_colisions_on_obj(_obj,["info","fwd_step_up",0]);
								_step_up = exe_temp_check_if_any_colisions(_obj,"info");
								if _step_up < 1
									{		
										_obj = exe_perform_colisions_on_obj(_obj,["info","fwd_step_flat",0]);
										_step_flat = exe_temp_check_if_any_colisions(_obj,"info");
										if _step_flat < 1
											{
												_obj = exe_perform_colisions_on_obj(_obj,["info","fwd_step_down",0]);
												_step_down = exe_temp_check_if_any_colisions(_obj,"info");
											}
									}
							}
						if		string_starts_with(_obj.control_method.behaviour_cycle,"jog4_L") {var _dirstr = "_L";}
						else if string_starts_with(_obj.control_method.behaviour_cycle,"jog4_R") {var _dirstr = "_R";}
						else	{var _dirstr = exe_resolve_anchor_letter(_obj);}
						
				
						if		_step_up > 0		{	var _str = "jog1" + _dirstr + "_01_stepup";		}
						else if	_step_flat > 0		{	var _str = "jog1" + _dirstr + "_01_flat";		}
						else						{	var _str = "jog1" + _dirstr + "_01_stepdown";	}
				
						//var _str = "jog1" + _dirstr + "_01_flat";
						
						_obj.control_method.behaviour_cycle = _str;
						_obj.control_method.anim_stack[1] = 0;
						_obj = exe_given_pose_anim_in_cycle(_obj,0);
					}
				break;
		}
	
	return(_obj);
}