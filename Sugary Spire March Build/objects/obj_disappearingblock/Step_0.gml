//Dissolve
if place_meeting(x, y - 1, obj_player) && dissolving = false && sprite_index == spr_caramel_idle {
	image_index = 0;
	image_speed = 0.35;
	sprite_index = spr_caramel_dissolve;
	dissolving = true;	
}
//Gone Anim
if sprite_index == spr_caramel_dissolve {
	//sprite_index = spr_caramel_dead
	if dissolving = true && image_index > 9 {
		destroyed = true;	
		dissolving = false;
		reset = 100;
	    x = -960;
	    y = -100;
	}
	if animation_end()
		sprite_index = spr_caramel_dead
}
//Return
if reset < 0 
{
	reset = 100;
	visible = true;
	destroyed = false;
	dissolving = false;
	image_speed = 0.5;
	image_index = 0;
	sprite_index = spr_caramel_alive;
}
//Idle Anim
if (sprite_index == spr_caramel_alive && animation_end())
{
	image_index = image_number - 1;
	if !place_meeting(xstart, ystart, obj_player) && !place_meeting(xstart, ystart, obj_baddie)
	{	
		x = xstart;
		y = ystart;		
		sprite_index = spr_caramel_idle;
		image_speed = 0.35;
		image_index = 0;
	}
}

if (destroyed = true)
    reset--;