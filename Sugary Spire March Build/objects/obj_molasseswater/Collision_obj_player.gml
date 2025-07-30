with (other)
if state = states.fling //or whatever it is
{
scr_sound(sfx_bloop2)
state = states.jump
	jumpstop = true;
	movespeed = abs(hsp);
	vsp = -5;
	sprite_index = spr_player_candytransitionup;
	if sign(hsp) != 0
		xscale = sign(hsp);
}
if instance_exists(obj_flingFrog)
obj_flingFrog.grabbedPlayer = noone;
