// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_slugidle(){
	movespeed = 0
	hsp = 0
	image_speed = 0.35 sprite_index = spr_sluggy_idle;
	if ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_sluggy_idle))
	{
		state = baddiestate.walk
		sprite_index = spr_sluggy
		movespeed = 1
		visible = 1
	}
}