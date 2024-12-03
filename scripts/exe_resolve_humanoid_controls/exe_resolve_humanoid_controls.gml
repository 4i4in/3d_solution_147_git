function exe_resolve_humanoid_controls(_cycle,_obj,_main_id)
{
	switch(_cycle)
		{
			case "idle":
				if array_length(_obj.control_method.anchor) > 0
					{
					//save respawn point
					if _obj.control_method.temporary_values.action1 != 0	{_obj = exe_save_respawn_point(_obj,"current")};
					//rotation
						if _obj.control_method.temporary_values.yaw != 0	
							{	
								var _value = _obj.control_method.temporary_values.yaw * _obj.character_sheet.body_measures.idle_rot_speed[0];
								_obj = exe_humanoid_in_cycle_rotate(_obj,_main_id,_value);
								
								//speed up rotation
								_obj.character_sheet.body_measures.idle_rot_speed[0] +=	(	abs(_obj.control_method.temporary_values.yaw)/game_speed	) * _obj.character_sheet.body_measures.idle_rot_speed[3];
								if _obj.character_sheet.body_measures.idle_rot_speed[0] > _obj.character_sheet.body_measures.idle_rot_speed[1]	{_obj.character_sheet.body_measures.idle_rot_speed[0] = _obj.character_sheet.body_measures.idle_rot_speed[1];};
							}
						//reset rotation speed
						else	{_obj.character_sheet.body_measures.idle_rot_speed[0] = _obj.character_sheet.body_measures.idle_rot_speed[2];}
					//==========
					
						if _obj.control_method.temporary_values.strafe_fb > 0	&&	_obj.control_method.temporary_values.jump == 0		
							{
								_obj.character_sheet.body_measures.walk_speed_up[0] = _obj.character_sheet.body_measures.walk_speed_up[2];
								
								var _value = _obj.control_method.temporary_values.strafe_fb;
								_obj = exe_humanoid_in_cycle_walk(_obj,_main_id,_value);
							};
						
					//mod camera
						if	_obj.control_method.temporary_values.yaw != 0 || _obj.control_method.temporary_values.pitch != 0
							{
								var _cam_rot = _obj.character_sheet.body_measures.idle_rot_speed[0] * _obj.character_sheet.body_measures.cam_rot_speed	* sign(_obj.control_method.temporary_values.yaw);
								var _cam_pitch = _obj.character_sheet.body_measures.cam_pitch_speed	* _obj.control_method.temporary_values.pitch;
								
								if abs(_obj.control_method.temporary_values.pitch) > 0.9
									{
										_obj.character_sheet.body_measures.cam_minus_pitch[0] += _obj.control_method.temporary_values.pitch * _obj.character_sheet.body_measures.cam_minus_pitch[3];
									}
								else if abs(_obj.control_method.temporary_values.pitch) < 0.3
									{
										_obj.character_sheet.body_measures.cam_minus_pitch[0] -= sign(_obj.character_sheet.body_measures.cam_minus_pitch[0]);
										//reset
										if abs(_obj.character_sheet.body_measures.cam_minus_pitch[0]) < _obj.character_sheet.body_measures.cam_minus_pitch[2]
											{_obj.character_sheet.body_measures.cam_minus_pitch[0] = 0;}
									}
								if abs(_obj.character_sheet.body_measures.cam_minus_pitch[0]) > _obj.character_sheet.body_measures.cam_minus_pitch[1]	
									{	_obj.character_sheet.body_measures.cam_minus_pitch[0] = sign(_obj.character_sheet.body_measures.cam_minus_pitch[0]) * _obj.character_sheet.body_measures.cam_minus_pitch[1]	}
								
									
								var _cam_minus_pitch = _obj.character_sheet.body_measures.cam_minus_pitch[0];
								
								_obj.character_sheet.body_measures.mod_camera_back = [0,_cam_pitch + _cam_minus_pitch,_cam_rot,0,0,0,0,0,0];
								for(var _mcb = 0; _mcb < array_length(_obj.character_sheet.body_measures.mod_camera_back); _mcb++)
									{
										_obj.character_sheet.body_measures.mod_camera_back[_mcb] += _obj.character_sheet.body_measures.keep_camera_back[_mcb];
									}
							}
						else
							{
								_obj.character_sheet.body_measures.mod_camera_back = variable_clone(_obj.character_sheet.body_measures.keep_camera_back);
								_obj.character_sheet.body_measures.cam_minus_pitch[0] -= sign(_obj.character_sheet.body_measures.cam_minus_pitch[0]);
								//reset
								if abs(_obj.character_sheet.body_measures.cam_minus_pitch[0]) < _obj.character_sheet.body_measures.cam_minus_pitch[2]
									{_obj.character_sheet.body_measures.cam_minus_pitch[0] = 0;}
							}
					//jumping	
						if _obj.control_method.temporary_values.jump > 0		
							{
								_obj.character_sheet.body_measures.jump_arr[0] += _obj.character_sheet.body_measures.jump_arr[3];
								if _obj.character_sheet.body_measures.jump_arr[0] > _obj.character_sheet.body_measures.jump_arr[1]
									{
										//execute jump;
										var _jump_or_not = exe_check_if_jump_is_reasonable(_obj,_main_id,"idle");
										if _jump_or_not > 0
											{	_obj = exe_humanoid_in_cycle_jump(_obj,_main_id);	};
										//reset	
										_obj.character_sheet.body_measures.jump_arr[0] = _obj.character_sheet.body_measures.jump_arr[2];
									}
							}
						else
							{
								if _obj.character_sheet.body_measures.jump_arr[0] > 0
									{
										//execute jump;
										var _jump_or_not = exe_check_if_jump_is_reasonable(_obj,_main_id,"idle");
										if _jump_or_not > 0
											{	_obj = exe_humanoid_in_cycle_jump(_obj,_main_id);	};
										//reset	
										_obj.character_sheet.body_measures.jump_arr[0] = _obj.character_sheet.body_measures.jump_arr[2];
									}
							}
					//=============
					}
				break;
				
			case "walk":
				if array_length(_obj.control_method.anchor) > 0
					{
					//rotation
						if _obj.control_method.temporary_values.yaw != 0	||	_obj.control_method.temporary_values.strafe_sides != 0
							{	
								var _rot_input = _obj.control_method.temporary_values.yaw;
								if abs(_obj.control_method.temporary_values.strafe_sides) < 0.75
									{	_rot_input += _obj.control_method.temporary_values.strafe_sides;	};
								
								var _value = _rot_input * _obj.character_sheet.body_measures.walk_rot_speed[0];
								_obj = exe_humanoid_in_cycle_rotate(_obj,_main_id,_value);
								
								//speed up rotation
								_obj.character_sheet.body_measures.walk_rot_speed[0] +=	(	abs(_rot_input)/game_speed	) * _obj.character_sheet.body_measures.walk_rot_speed[3];
								if _obj.character_sheet.body_measures.walk_rot_speed[0] > _obj.character_sheet.body_measures.walk_rot_speed[1]	{_obj.character_sheet.body_measures.walk_rot_speed[0] = _obj.character_sheet.body_measures.walk_rot_speed[1];};
							}
						//reset rotation speed
						else	{_obj.character_sheet.body_measures.walk_rot_speed[0] = _obj.character_sheet.body_measures.walk_rot_speed[2];}
					//==========
						
						if _obj.control_method.temporary_values.strafe_fb > 0		
							{
								_obj.character_sheet.body_measures.walk_speed_up[0] -=	(	abs(_obj.control_method.temporary_values.strafe_fb)/game_speed	) * _obj.character_sheet.body_measures.walk_speed_up[3];
								if _obj.character_sheet.body_measures.walk_speed_up[0] < -_obj.control_method.temporary_values.strafe_fb *_obj.character_sheet.body_measures.walk_speed_up[1]	{_obj.character_sheet.body_measures.walk_speed_up[0] = -_obj.control_method.temporary_values.strafe_fb *_obj.character_sheet.body_measures.walk_speed_up[1]};
								if _obj.character_sheet.body_measures.walk_speed_up[0] > _obj.control_method.temporary_values.strafe_fb *_obj.character_sheet.body_measures.walk_speed_up[1]		{_obj.character_sheet.body_measures.walk_speed_up[0] = _obj.control_method.temporary_values.strafe_fb *_obj.character_sheet.body_measures.walk_speed_up[1]};
							}
					
						if _obj.control_method.temporary_values.strafe_fb == 0		
							{
								_obj.character_sheet.body_measures.walk_speed_up[0] = _obj.character_sheet.body_measures.walk_speed_up[2];
								
								var _value = _obj.control_method.temporary_values.strafe_fb;
								_obj = exe_humanoid_in_cycle_idle(_obj,_main_id,_value);
							};
						
						if _obj.control_method.temporary_values.strafe_fb < 0		
							{
								_obj.character_sheet.body_measures.walk_speed_up[0] = _obj.character_sheet.body_measures.walk_speed_up[2];
								
								var _value = _obj.control_method.temporary_values.strafe_fb;
								_obj = exe_humanoid_in_cycle_idle(_obj,_main_id,_value);
							};
							
						//mod camera
						if	_obj.control_method.temporary_values.yaw != 0	||	_obj.control_method.temporary_values.strafe_sides != 0 ||
							_obj.control_method.temporary_values.strafe_fb != 0 || _obj.control_method.temporary_values.pitch != 0
							{	
								var _cam_rot = _obj.character_sheet.body_measures.walk_rot_speed[0] * _obj.character_sheet.body_measures.cam_rot_speed	* sign(_obj.control_method.temporary_values.yaw);
								var _move_speed = -_obj.character_sheet.body_measures.walk_speed_up[0] * _obj.character_sheet.body_measures.cam_pitch_mul;
								var _cam_pitch = _obj.character_sheet.body_measures.cam_pitch_speed	* _obj.control_method.temporary_values.pitch;
								
								_obj.character_sheet.body_measures.mod_camera_back = [0,_move_speed+_cam_pitch,_cam_rot,0,0,0,0,0,0];
								for(var _mcb = 0; _mcb < array_length(_obj.character_sheet.body_measures.mod_camera_back); _mcb++)
									{
										_obj.character_sheet.body_measures.mod_camera_back[_mcb] += _obj.character_sheet.body_measures.keep_camera_back[_mcb];
									}
							}
						else
							{
								_obj.character_sheet.body_measures.mod_camera_back = variable_clone(_obj.character_sheet.body_measures.keep_camera_back);
							}
						//jumping	
						if _obj.control_method.temporary_values.jump > 0		
							{
								_obj.character_sheet.body_measures.jump_arr[0] += _obj.character_sheet.body_measures.jump_arr[3];
								if _obj.character_sheet.body_measures.jump_arr[0] > _obj.character_sheet.body_measures.jump_arr[1]
									{
										//execute jump;
										var _jump_or_not = exe_check_if_jump_is_reasonable(_obj,_main_id,"walk");
										if _jump_or_not > 0
											{	_obj = exe_humanoid_in_cycle_jump(_obj,_main_id);	};
										//reset	
										_obj.character_sheet.body_measures.jump_arr[0] = _obj.character_sheet.body_measures.jump_arr[2];
									}
							}
						else
							{
								if _obj.character_sheet.body_measures.jump_arr[0] > 0
									{
										//execute jump;
										var _jump_or_not = exe_check_if_jump_is_reasonable(_obj,_main_id,"walk");
										if _jump_or_not > 0
											{	_obj = exe_humanoid_in_cycle_jump(_obj,_main_id);	};
										//reset	
										_obj.character_sheet.body_measures.jump_arr[0] = _obj.character_sheet.body_measures.jump_arr[2];
									}
							}
						//=============
						//action	walk to run
						if _obj.control_method.temporary_values.action > 0	&& _obj.control_method.temporary_values.strafe_fb > 0	
							{
								_obj.character_sheet.body_measures.walk_speed_up[0] -=	(	abs(_obj.control_method.temporary_values.strafe_fb)/game_speed	) * _obj.character_sheet.body_measures.walk_speed_up[3];
								if _obj.character_sheet.body_measures.walk_speed_up[0] < -_obj.control_method.temporary_values.strafe_fb *_obj.character_sheet.body_measures.walk_speed_up[1]
									{
										_obj = exe_humanoid_in_cycle_jog(_obj,_main_id,-1);
									}
							}
					}
				break;
				
			case "jog":
				if array_length(_obj.control_method.anchor) > 0
					{
					//rotation
						if _obj.control_method.temporary_values.yaw != 0	||	_obj.control_method.temporary_values.strafe_sides != 0
							{	
								var _rot_input = _obj.control_method.temporary_values.yaw;
								if abs(_obj.control_method.temporary_values.strafe_sides) < 0.75
									{	_rot_input += _obj.control_method.temporary_values.strafe_sides;	};
								
								var _value = _rot_input * _obj.character_sheet.body_measures.jog_rot_speed[0];
								_obj = exe_humanoid_in_cycle_rotate(_obj,_main_id,_value);
								
								//speed up rotation
								_obj.character_sheet.body_measures.jog_rot_speed[0] +=	(	abs(_rot_input)/game_speed	) * _obj.character_sheet.body_measures.jog_rot_speed[3];
								if _obj.character_sheet.body_measures.jog_rot_speed[0] > _obj.character_sheet.body_measures.jog_rot_speed[1]	{_obj.character_sheet.body_measures.jog_rot_speed[0] = _obj.character_sheet.body_measures.jog_rot_speed[1];};
							}
						//reset rotation speed
						else	{_obj.character_sheet.body_measures.jog_rot_speed[0] = _obj.character_sheet.body_measures.jog_rot_speed[2];}
					//==========
						
						if _obj.control_method.temporary_values.strafe_fb > 0		
							{
								_obj.character_sheet.body_measures.jog_speed_up[0] -=	(	abs(_obj.control_method.temporary_values.strafe_fb)/game_speed	) * _obj.character_sheet.body_measures.jog_speed_up[3];
								if _obj.character_sheet.body_measures.jog_speed_up[0] < -_obj.control_method.temporary_values.strafe_fb *_obj.character_sheet.body_measures.jog_speed_up[1]		{_obj.character_sheet.body_measures.jog_speed_up[0] = -_obj.control_method.temporary_values.strafe_fb *_obj.character_sheet.body_measures.jog_speed_up[1]};
								if _obj.character_sheet.body_measures.jog_speed_up[0] > _obj.control_method.temporary_values.strafe_fb *_obj.character_sheet.body_measures.jog_speed_up[1]		{_obj.character_sheet.body_measures.jog_speed_up[0] = _obj.control_method.temporary_values.strafe_fb *_obj.character_sheet.body_measures.jog_speed_up[1]};
							}
					
						if _obj.control_method.temporary_values.strafe_fb == 0		
							{
								_obj.character_sheet.body_measures.jog_speed_up[0] = _obj.character_sheet.body_measures.jog_speed_up[2];
								
								_obj = exe_humanoid_in_cycle_walk(_obj,_main_id,-1);
							};
						
						if _obj.control_method.temporary_values.strafe_fb < 0		
							{
								_obj.character_sheet.body_measures.jog_speed_up[0] = _obj.character_sheet.body_measures.jog_speed_up[2];
								
								var _value = _obj.control_method.temporary_values.strafe_fb;
								_obj = exe_humanoid_in_cycle_idle(_obj,_main_id,_value);
							};
							
						//mod camera
						if	_obj.control_method.temporary_values.yaw != 0	||	_obj.control_method.temporary_values.strafe_sides != 0 ||
							_obj.control_method.temporary_values.strafe_fb != 0 || _obj.control_method.temporary_values.pitch != 0
							{	
								var _cam_rot = _obj.character_sheet.body_measures.jog_rot_speed[0] * _obj.character_sheet.body_measures.cam_rot_speed	* sign(_obj.control_method.temporary_values.yaw);
								var _move_speed = -_obj.character_sheet.body_measures.jog_speed_up[0] * _obj.character_sheet.body_measures.cam_pitch_mul;
								var _cam_pitch = _obj.character_sheet.body_measures.cam_pitch_speed	* _obj.control_method.temporary_values.pitch;
								
								_obj.character_sheet.body_measures.mod_camera_back = [0,_move_speed+_cam_pitch,_cam_rot,0,0,0,0,0,0];
								for(var _mcb = 0; _mcb < array_length(_obj.character_sheet.body_measures.mod_camera_back); _mcb++)
									{
										_obj.character_sheet.body_measures.mod_camera_back[_mcb] += _obj.character_sheet.body_measures.keep_camera_back[_mcb];
									}
							}
						else
							{
								_obj.character_sheet.body_measures.mod_camera_back = variable_clone(_obj.character_sheet.body_measures.keep_camera_back);
							}
						
						//jumping	
						if _obj.control_method.temporary_values.jump > 0		
							{
								_obj.character_sheet.body_measures.jump_arr[0] += _obj.character_sheet.body_measures.jump_arr[3];
								if	_obj.character_sheet.body_measures.jump_arr[0] > _obj.character_sheet.body_measures.jump_arr[1]
									{_obj.character_sheet.body_measures.jump_arr[0] = _obj.character_sheet.body_measures.jump_arr[1];};
							}	//reset and resolving in exe_check_if_jump_is_reasonable
					}
				else
					{
						//in air
						//jumping	
						if _obj.control_method.temporary_values.jump > 0		
							{
								_obj.character_sheet.body_measures.jump_arr[0] += _obj.character_sheet.body_measures.jump_arr[3];
								if	_obj.character_sheet.body_measures.jump_arr[0] > _obj.character_sheet.body_measures.jump_arr[1]
									{_obj.character_sheet.body_measures.jump_arr[0] = _obj.character_sheet.body_measures.jump_arr[1];};
							}	//reset and resolving in exe_check_if_jump_is_reasonable
					}
				break;
		}
	return(_obj);
}