function exe_return_direction_cast_vector(_obj,_vec3)
{
	var _posMat = _obj.part_posMat[0];
	var _cast_fwd =		_vec3[0] * (-_posMat[0]) +
						_vec3[1] * (-_posMat[1]) +
						_vec3[2] * (-_posMat[2]);
									
	var _cast_sides =	_vec3[0] * (-_posMat[4]) +
						_vec3[1] * (-_posMat[5]) +
						_vec3[2] * (-_posMat[6]);	
				
	var _cast_up =		_vec3[0] * (-_posMat[8]) +
						_vec3[1] * (-_posMat[9]) +
						_vec3[2] * (-_posMat[10]);
						
	//explanation:
	//_cast_fwd > 0 == forward
	//_cast_sides > 0 == right	
	//_cast_up > 0 == up
	
	//	fwd | back		right | left		up|down
	var _answer = "up";
	var _cast_up2 = _cast_up/2; //helper value for resolving
	
	var _max = max(abs(_cast_fwd),abs(_cast_sides),abs(_cast_up2));
	if _max == abs(_cast_fwd)
		{
			switch(sign(_cast_fwd))
				{
					case 1:		_answer = "fwd";break;
					case -1:	_answer = "back";break;
				}
		}
	else if _max == abs(_cast_sides)
		{
			switch(sign(_cast_sides))
				{
					case 1:		_answer = "right";break;
					case -1:	_answer = "left";break;
				}
		}
	else if _max == abs(_cast_up2)
		{
			switch(sign(_cast_up2))
				{
					case 1:		_answer = "up";break;
					case -1:	_answer = "down";break;
				}
		}
		
	return(_answer);
}