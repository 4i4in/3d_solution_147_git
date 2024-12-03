function exe_perform_simple_anchoring_obj(_obj,_thlprs,_result_interpratetion,_anchor_method,_main_id)
{
	var _sublist = _obj.part_detector_lines_results[_thlprs][2];
	var _refer_to_part = _obj.part_detector_lines_results[_thlprs][3];

	var _xyz0 =					_sublist[0][0];
	var _xyz1 =					_sublist[0][1];
	var _normal =				_sublist[0][2];
	var _hash_colided =			_sublist[0][3];
	var _who_colided =			_sublist[0][4];
	var _what_list =			_sublist[0][5];
	var _colision_type =		_sublist[0][6];	
			
	if _colision_type == "solid"
		{
			var _obj_g_vec = vec_normalize([_obj.control_method.gravity[0],_obj.control_method.gravity[1],_obj.control_method.gravity[2]]);
			
			switch(_result_interpratetion)
				{
					case "walk":	case "jog":
						var _coll_dot = dot_product_3d(_normal[0],_normal[1],_normal[2],_obj_g_vec[0],_obj_g_vec[1],_obj_g_vec[2]);
	//show_debug_message("_coll_dot in walk : " + string(_coll_dot));
						if _coll_dot > _obj.character_sheet.body_measures.walk_dot
							{
								//TBD climbing and stuff
	//show_debug_message("to high!!!!!!!!!!!");
								
								_obj.control_method.ground_state = "idle";
								_obj.control_method.carry_anim_info = [irandom(_obj.character_sheet.body_measures.max_idle_states),_obj.character_sheet.body_measures.max_idle_states];
								_obj = exe_perform_pushback_sequence_on_obj(_obj,_main_id,"fall");
								_result_interpratetion = "reanchor";
								
								//info
								var _str = "info : " + "\n";
								_str += "_who_colided : " + string(_who_colided) + "\n";
								_str += "_normal : " + string(_normal) + "\n";
								_str += "cast : " + string(exe_return_direction_cast_vector(_obj,[-_normal[0],-_normal[1],-_normal[2]])) + "\n";
								exe_throw_fake_rclick_info([_str,20,100]);
								//return(_obj)
							}
						break;
					case "idle":
						var _coll_dot = dot_product_3d(_normal[0],_normal[1],_normal[2],_obj_g_vec[0],_obj_g_vec[1],_obj_g_vec[2]);
	//show_debug_message("_coll_dot in idle : " + string(_coll_dot));
						if _coll_dot > _obj.character_sheet.body_measures.walk_dot
							{
	//show_debug_message("to high!!!!!!!!!!!");
								_obj.control_method.ground_state = "idle";
								_obj.control_method.carry_anim_info = [irandom(_obj.character_sheet.body_measures.max_idle_states),_obj.character_sheet.body_measures.max_idle_states];
								return(_obj)
							}
						break;
				}
				
			//add anchor
			var _return_anchor = [_refer_to_part,_xyz1];
			if _anchor_method == "reset"	{_obj.control_method.anchor = [];};
			array_push(_obj.control_method.anchor,_return_anchor);
			//change state, |	break animation, break behaviour_cycle >> exe_resolve_behaviour_cycle
			if _result_interpratetion != "reanchor"	{_obj.control_method.ground_state = _result_interpratetion;};
		}
	
		
	return(_obj)
}