function scr_enemy_charge() {
	/*if (object_index == obj_peasanto)
	{
	    if (grounded || (grounded && (!place_meeting(x, y, obj_platform))))
	        hsp = (image_xscale * (movespeed * 4))
	    else
	        hsp = 0
	    if (x != obj_player.x)
	    {
	        if (obj_player.x > (x - 400) && obj_player.x < (x + 400) && obj_player.y == y && image_xscale == sign((obj_player.x - x)))
	            chargereset = 200
	    }
	    image_speed = 0.35
	    chargereset--
	    if (chargereset == 0)
	        state = baddiestate.walk
	    if (((scr_solid((x + 1), y) && image_xscale == 1) || (scr_solid((x - 1), y) && image_xscale == -1)) && (!place_meeting((x + sign(hsp)), y, obj_slope)))
	        image_xscale *= -1
	    if ((!(scr_solid((x + 15), (y + 31)) || scr_solid((x + 15), (y + 31)))) && image_xscale == 1 && movespeed > 0)
	        image_xscale *= -1
	    if ((!(scr_solid((x - 15), (y + 31)) || scr_solid((x - 15), (y + 31)))) && image_xscale == -1 && movespeed > 0)
	        image_xscale *= -1
	    if ((!(grounded || (grounded && (!place_meeting(x, y, obj_platform))))) && hsp < 0)
	        hsp += 0.1
	    else if ((!(grounded || (grounded && (!place_meeting(x, y, obj_platform))))) && hsp > 0)
	        hsp -= 0.1
	    sprite_index = spr_peasanto_attack
	}
	if (object_index == obj_pizzice)
	{
	    hsp = (image_xscale * movespeed)
	    image_speed = 0.35
	    if (((scr_solid((x + 1), y) && image_xscale == 1) || (scr_solid((x - 1), y) && image_xscale == -1)) && (!place_meeting((x + sign(hsp)), y, obj_slope)))
	        image_xscale *= -1
	    sprite_index = spr_pizzice_walk
	}
	if (object_index == obj_ninja)
	{
	    hsp = (image_xscale * (movespeed * 2))
	    image_speed = 0.35
	    if (grounded && vsp > 0)
	        state = baddiestate.walk
	    if (((scr_solid((x + 1), y) && image_xscale == 1) || (scr_solid((x - 1), y) && image_xscale == -1)) && (!place_meeting((x + sign(hsp)), y, obj_slope)))
	        image_xscale *= -1
	    if ((!(grounded || (grounded && (!place_meeting(x, y, obj_platform))))) && hsp < 0)
	        hsp += 0.1
	    else if ((!(grounded || (grounded && (!place_meeting(x, y, obj_platform))))) && hsp > 0)
	        hsp -= 0.1
	    sprite_index = spr_ninja_attack
	}*/
	if (object_index == obj_swedishfish)
	{
	    hsp = (image_xscale * movespeed)
	    if place_meeting((x + hsp), y, obj_solid)
	    {
	        state = baddiestate.stun
	        stunned = 100
	    }
	}
	if (object_index == obj_charger)
	{
		hsp = (image_xscale * movespeed)
		if substate = 0 {
			
			if sprite_index != spr_banana_chargestart movespeed = 8
			else movespeed = 0
			if place_meeting((x + sign(hsp)), y, obj_solid) && !place_meeting((x + sign(hsp)), y, obj_slope)
				image_xscale *= -1
			var dir = sign(obj_player.x - x)
			if eliteEnemy && image_xscale == -dir && point_distance(x, 0, obj_player.x, 0) >= 50 {
				substate = 1	
				sprite_index = spr_banana_machturn
				image_index = 0
			}	
		}
		
		if substate = 1 {
			movespeed = ( 1 -(image_index / image_number)) * 8
			if animation_end() || movespeed == 0 {
				image_xscale *= -1
				movespeed = 8
				substate = 0
				sprite_index = spr_banana_charge
				
			}
			
		}
	}



}
