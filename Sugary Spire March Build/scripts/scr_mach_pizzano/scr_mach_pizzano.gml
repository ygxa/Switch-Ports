function scr_mach_pizzano(){
	
	// Who fucking made this? and why does it look so bad
			move = (key_left + key_right)
	hsp = (xscale * movespeed)
		if(movespeed < 12)
			movespeed += 0.07
		if(movespeed > 12)
			movespeed = 12
	/*
	if !key_attack movespeed -= 0.1;
	if sprite_index != spr_pizzano_mach3 && sprite_index != spr_pizzano_handstand sprite_index = spr_pizzano_mach2
if move != 0 && key_attack && movespeed < 12
      movespeed += 0.1
	
	if movespeed >= 12 movespeed = 12
	
	if movespeed = 0 && sprite_index != spr_pizzano_handstand state = states.normal

if key_jump && grounded vsp = -8

if movespeed = 12 sprite_index = spr_pizzano_mach3
else if movespeed < 12 sprite_index = spr_pizzano_mach2

if key_up2 && sprite_index = spr_pizzano_mach3
{
	state = states.Sjumpprep
	sprite_index = spr_pizzano_sjumpprep
	movespeed = 0
	hsp = 0
}

if machpunchAnim > 0 machpunchAnim -= 0.1;
			if (scr_solid((x - 1), y) && xscale == -1 && (!place_meeting((x - 1), y, obj_slope)) && (!place_meeting((x - 1), y, obj_destructibles)) && (grounded || place_meeting((x + sign(hsp)), y, obj_railv))) {
			    scr_sound(sound_bump);
			    movespeed = -5
				image_xscale = 1
			    hsp = 2.5;
			    vsp = -3;
			    mach2 = 0;
			    image_index = 0;
			    instance_create((x - 10), (y + 10), obj_bumpeffect);
				sprite_index = spr_pizzano_mach1
			}
				if (scr_solid((x + 1), y) && xscale == 1 && (!place_meeting((x + 1), y, obj_slope)) && (!place_meeting((x + 1), y, obj_destructibles)) && (grounded || place_meeting((x + sign(hsp)), y, obj_railv))) {
			    scr_sound(sound_bump);
			    movespeed = -5
				image_xscale = -1
			    hsp = 2.5;
			    vsp = -3;
			    mach2 = 0;
			    image_index = 0;
			    instance_create((x - 10), (y + 10), obj_bumpeffect);
				sprite_index = spr_pizzano_mach1
			}
if movespeed < 0 && grounded
{
movespeed += 2	
}

	if key_down 
	{
	state = states.crouchslide
	sprite_index = spr_pizzano_crouchslide
	}*/
	
	hsp = (xscale * movespeed)
		
			if !grounded && (move != 0 && move != xscale) && movespeed > 1 movespeed -= 0.05;
	 
	 if !grounded && (move != 0 && move = xscale) && movespeed < 12 movespeed += 0.05;
}
