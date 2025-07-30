// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_boss_frozen(){
	if global.freezeframe = false 
	{
		state =	frozenstate;
		sprite_index = frozenspriteindex;
		image_index = frozenimageindex;
		image_speed = frozenimagespeed;
		movespeed = frozenmovespeed;
		grav = frozengrav;
		hsp = frozenhsp;
		vsp = frozenvsp;
		if setfordeath {
			camera_shake(3, 3)
			repeat(2) 
			{
				instance_create(x, y, obj_slapstar);
				instance_create(x, y, obj_baddiegibs);
			}
			with obj_bosscontroller
				event_user(0)
			setfordeath = 0
		}
	}
	else 
	{
		vsp = 0;
		hsp = 0;
		grav = 0;
		x = x;
		y = y;
		image_speed = 0;
		movespeed = 0;
	}
}
