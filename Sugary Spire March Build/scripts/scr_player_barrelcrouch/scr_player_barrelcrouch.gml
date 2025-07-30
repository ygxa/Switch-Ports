function state_player_barrelcrouch() {
if input_buffer != 0 {
	input_buffer = approach(input_buffer, 0, 1)
}
 hsp = movespeed
 move = (key_left + key_right)
 
 #region CONTROLS
 
if ((move != 0) && (input_buffer == 0))
    {
        if (move == xscale) {
				movespeed = approach(movespeed, (xscale * 16), 0.35)
		}
        else
        {
            movespeed = approach(movespeed, 0, 0.7)
        if (movespeed <= 0)
                xscale = move
        }
		if ((movespeed != 0) && (place_meeting_solid(x + sign(xscale), y, obj_solid)) && (!place_meeting_slope(x + sign(xscale), y + 1) && (!place_meeting(x + sign(xscale), y, obj_destructibles) && (!place_meeting(x + sign(xscale), y, obj_chocofrog))))) {
			input_buffer = 5
			movespeed = -(movespeed - (movespeed / 1.5))
			audio_stop_sound(sound_bump)
			scr_sound(sound_bump)
			repeat (4) {
				instance_create(x, y, obj_slapstar);
			}
		}
        if (abs(movespeed) < 3 && move != 0)
            image_speed = 0.35
        else if (abs(movespeed) > 3 && abs(movespeed) < 6)
            image_speed = 0.45
        else
            image_speed = 0.6
    }
else if (input_buffer == 0)
	movespeed = approach(movespeed, 0, 0.7)
		
if key_jump
    {
        movespeed = abs(hsp)
        if (movespeed < 6)
            movespeed = 6
        dir = xscale
        state = states.mach2
        sprite_index = spr_mach2jump
        jumpstop = 0
        vsp = -11
		ridingmarsh = false
        instance_create(x, y, obj_jumpdust)
        with (instance_create(x, y, obj_cookiemount))
            {
			image_xscale = other.xscale
			sprite_index = spr_cookiemountkick
			}
    }

if (grounded) && (move != 0) && !place_meeting(x, y + 1, obj_molassesGround) && !place_meeting(x, y + 1, obj_ramp)
	vsp = -5


#endregion

#region SFX

if ((move != 0))
{
	if !audio_is_playing(sound_mount) scr_sound(sound_mount)
}
else
{
	audio_stop_sound(sound_mount)
}

#endregion

#region SPRITES

if ((move == 0) && (input_buffer == 0)) {
	image_speed = 0.35
	sprite_index = spr_player_cookiemount_idle;
}

if ((move != 0) && (xscale != move) && (input_buffer == 0)) {
	image_index = 0;
	sprite_index = spr_player_cookiemount_skid;
}

if (move != 0) || (sprite_index == spr_player_cookiemount_skid && animation_end()) {
	
	sprite_index = spr_player_cookiemount;
}

#endregion

}
