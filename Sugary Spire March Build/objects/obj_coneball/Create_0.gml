depth = -100
scr_sound(sfx_coneball)
image_speed = 0.35
image_alpha = 0
alarm[0] = 10
coneballspeed = 1;
x = obj_player.x
y = obj_player.y

dis = 800
mindis = 150

dir = 0
timer = 150
attacking = false
atktimer = 250
projcool = 5
fading = false
alpha = 1
attack = 1
/*
hurtplayer = function() {
		with (obj_player)
		{
		    if ((state == states.knightpep || state == states.knightpepattack || state == states.knightpepslopes) && cutscene == 0)
		    {
		    }
		    else if (state == states.bombpep && hurted == 0)
		    {
		    }
		    else if (state == states.boxxedpep)
		    {
		    }
		    else if (state == states.cheesepep || state == states.cheesepepstick)
		    {
		    }
		    else if (state != states.hurt && hurted == 0 && cutscene == 0 && state != states.bump && state != states.tumble)
		    {
		        scr_sound(sound_touchspike)
		        global.hurtcounter += 1
		        alarm[8] = 60
		        alarm[7] = 120
		        hurted = 1
		        if (xscale == other.image_xscale)
		            sprite_index = spr_hurtjump
		        else
		            sprite_index = spr_hurt
		        movespeed = 8
		        vsp = -5
		        timeuntilhpback = 300
		        if (global.collect > 100)
		            global.collect -= 100
		        else
		            global.collect = 0
		        if (global.collect != 0)
		        {
		            instance_create(x, y, obj_pizzaloss)
		            instance_create(x, y, obj_pizzaloss)
		            instance_create(x, y, obj_pizzaloss)
		            instance_create(x, y, obj_pizzaloss)
		            instance_create(x, y, obj_pizzaloss)
		            instance_create(x, y, obj_pizzaloss)
		            instance_create(x, y, obj_pizzaloss)
		            instance_create(x, y, obj_pizzaloss)
		            instance_create(x, y, obj_pizzaloss)
		            instance_create(x, y, obj_pizzaloss)
		            instance_create(x, y, obj_pizzaloss)
		            instance_create(x, y, obj_pizzaloss)
		
				}
		        /*if (obj_player.shotgunAnim == 0)
		            global.playerhealth -= 1
					
		        else if (obj_player.shotgunAnim == 1)
		        {
		            obj_player.shotgunAnim = 0
		            //with (instance_create(x, y, obj_knightdebris))
		            //{
		                //sprite_index = spr_shotgun
		                //image_speed = 0.35
		            //}
		        }
		        instance_create(x, y, obj_spikehurteffect)
		        state = states.hurt
		        image_index = 0
		        flash = 1
				global.style -= 15
		    }
		}
}
if global.panic = 0
//instance_destroy()