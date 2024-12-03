function exe_perform_humanoid_sceleton_move_3dmove(_obj)
{
	var _main_id = -1;
	for(var _ii = 0; _ii < array_length(_obj.part_naming); _ii++)
		{
			if _main_id > -1	{break;};
			if _obj.part_naming[_ii] == "main_part"	{_main_id = _ii;};
		}
	//var _input_call = _obj.control_method.temporary_values;
	var _inertial_translation = exe_initialize_inertial_translation_array(_obj.control_method.intertia_translation,1.);
	var _posMat = _obj.part_posMat[_main_id];
	
	switch(_obj.control_method.behaviour_cycle)
		{
			case "faling_cycle":	
				_obj = exe_perform_humanoid_sceleton_faling_cycle(_obj,_posMat,_main_id,_inertial_translation,"landing");	
				break;
			
			case "landing_light_R":	case "landing_medium_R":	case "landing_hard_R":
			case "landing_light_L":	case "landing_medium_L":	case "landing_hard_L":
				_obj = exe_perform_humanoid_sceleton_landing_cycle(_obj,_posMat,_main_id,_inertial_translation);	
				break;
			
			case "idle_start_R":	case "idle_start_L":		
			case "idle_R_01":		case "idle_L_01":
			case "idle_R_02":		case "idle_L_02":
				_obj = exe_perform_humanoid_sceleton_idle_cycle(_obj,_posMat,_main_id,_inertial_translation);	
				break;
				
			case "walk_L_01_flat":		case "walk_R_01_flat":
			case "walk_L_01_stepup":	case "walk_R_01_stepup":
			case "walk_L_01_stepdown":	case "walk_R_01_stepdown":
				_obj = exe_perform_humanoid_sceleton_walk_cycle(_obj,_posMat,_main_id,_inertial_translation);	
				break;
				
			case "jump_up_start_L":		case "jump_up_start_R":
			case "jump_up_continue_L":	case "jump_up_continue_R":
				_obj = exe_perform_humanoid_sceleton_jumping_cycle(_obj,_posMat,_main_id,_inertial_translation);	
				break;
				
			case "jog1_L_01_flat":	case "jog1_R_01_flat":
			case "jog2_L_01_flat":	case "jog2_R_01_flat":
			case "jog4_L_01_flat":	case "jog4_R_01_flat":
			case "jog1_L_01_stepup":	case "jog1_R_01_stepup":
			case "jog2_L_01_stepup":	case "jog2_R_01_stepup":
			case "jog1_L_01_stepdown":	case "jog1_R_01_stepdown":
			case "jog2_L_01_stepdown":	case "jog2_R_01_stepdown":
				_obj = exe_perform_humanoid_sceleton_jog_cycle(_obj,_posMat,_main_id,_inertial_translation);	
				break;
			case "jog3_L_01_flat":		case "jog3_R_01_flat":	
			case "jog3_L_01_stepup":	case "jog3_R_01_stepup":	
			case "jog3_L_01_stepdown":	case "jog3_R_01_stepdown":	
				_obj = exe_perform_humanoid_sceleton_faling_cycle(_obj,_posMat,_main_id,_inertial_translation,"jog");		
				break;
		}
	
	
	
	return(_obj);
}