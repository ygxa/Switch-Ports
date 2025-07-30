/// @description Freezes time for the given time. 
if (freezetype == 0) { global.hitstunalarm = round(global.freezeframetimer); }
if (freezetype == 1) { global.hitstunalarm = round(freezeval); }
if global.hitstunEnabled != 0 
{
	if global.freezeframe = false 
	{
		#region Frozen Entities
		with obj_player 
		{
			if state != states.frozen 
			{
				frozenstate = state;
				frozenspriteindex = sprite_index;
				frozenimageindex = image_index;
				frozenimagespeed = image_speed;
				frozenmovespeed = movespeed;
				frozengrav = grav;
				frozensmash = freefallsmash;
				frozenhsp = hsp;
				frozenvsp = vsp;
				frozenjumpbuffer = input_buffer_jump;
				//Alarms
				for (var i = 0; i < 10; i++)
				{
					frozenalarm[i] = alarm_get(i);
				}	
				state = states.frozen;
			}
		}		
		with obj_baddie 
		{
			if state != baddiestate.frozen
			{
			frozenstate = state;
			frozenspriteindex = sprite_index;
			frozenimageindex = image_index;
			frozenimagespeed = image_speed;
			frozenmovespeed = movespeed;
			frozengrav = grav;
			frozenhsp = hsp;
			frozenvsp = vsp;
			state = baddiestate.frozen;
			}
		}
		with obj_iceblock
		{
			if state != baddiestate.frozen
			{
			frozenstate = state;
			frozenspriteindex = sprite_index;
			frozenimageindex = image_index;
			frozenimagespeed = image_speed;
			frozenmovespeed = movespeed;
			frozengrav = grav;
			frozenhsp = hsp;
			frozenvsp = vsp;
			state = baddiestate.frozen
			}
			
		}
		with par_boss 
		{
			frozenstate = state;
			frozenspriteindex = sprite_index;
			frozenimageindex = image_index;
			frozenimagespeed = image_speed;
			frozenmovespeed = movespeed;
			frozengrav = grav;
			frozenhsp = hsp;
			frozenvsp = vsp;
			state = bossstates.frozen
		}
		with par_aftereffect
		{
			//Alarms
			for (var i = 0; i < 2; i++)
			{
				frozenalarm[i] = alarm_get(i);
			}
			frozen = true;
			for (var i = 0; i < 2; i++)
			{
				if alarm_get(i) > -1
					alarm_set(i, -1);
			}			
		}
		#endregion
		#region Frozen Clocks
		//Alarms obj_camera
		for (var i = 0; i < 3; i++)
		{
			frozenalarm[i] = alarm_get(i);
		}	
		for (var i = 0; i < 3; i++)
		{
			if alarm_get(i) > -1
				alarm_set(i, -1);
		}
		frozen = true;
		with obj_tv
		{
			frozenalarm = alarm[1];
			alarm[1] = -1;
			frozen = true;
		}
		#endregion
		global.freezeframe = true;
	}
}
p1Vibration(30, 25)



