function scr_enemy_rage() {
	//sprite_index = ragespr
	switch object_index {
		case obj_doggy:
			image_speed = 0.35
			if sprite_index == spr_badmarsh_ragestart {
				hsp = 0
				if animation_end() {
					sprite_index = spr_badmarsh_rage
					hsp = image_xscale * 5
					lunged = 50
					with instance_create(x, y, obj_forkhitbox, { ID : other.id}) {
						ID = other.id
						image_xscale = other.image_xscale
						//image_index = other.image_index		
						depth = -1
						
					}
				}
				
			} 
			else if sprite_index == spr_badmarsh_rage {
				hsp = approach(hsp, image_xscale * 8, 0.3)
				lunged--
				if lunged <= 0 {
					hsp = image_xscale * 4
					movespeed = 4
					sprite_index = spr_badmarsh_rageend
				}
				if place_meeting_solid(x + image_xscale, y) && !place_meeting_slope(x, y + 1)
				{
					lunged = 0
					hsp = image_xscale * 4
					movespeed = 4
					sprite_index = spr_badmarsh_rageend
				}
				
			} 
			else if sprite_index == spr_badmarsh_rageend {
				hsp = approach(hsp, 0, 0.1)
				if animation_end() {
					state = baddiestate.walk
					movespeed = 1
					bombreset = 200
					
				}
				
			}
		
		break
		case obj_babybear:
			if animation_end(,10)
                hsp = (image_xscale * 8)
            else
                hsp = 0
            if animation_end()
            {
                state = baddiestate.walk
                sprite_index = walkspr
            }
		break
		/*
		case obj_badmarsh:
			if animation_end(,2)
                hsp = (image_xscale * 8)
            else
                hsp = 0
			if (place_meeting_solid(x + xscale, y) && !place_meeting_slope(x, y + 1))
			{
				ragereset = 260
				stun_timer = 180
				state = baddiestate.stun
				sprite_index = stunfallspr
			}
            if animation_end()
            {
				ragereset = 100
				movespeed = 2
                state = baddiestate.walk
                sprite_index = walkspr
            }
		break
		*/
		case obj_sluggy:
			hsp = image_xscale * movespeed
			if animation_end()
				movespeed--
			if movespeed <= 0
            {
                state = baddiestate.walk
                sprite_index = walkspr
				movespeed = 1
				hsp = 0
            }
		break
	case obj_painter:
	{
	/* if animation_end() && sprite_index = spr_painter_draw_painting
	{
	instance_create(x, y, obj_paintercheapshot)
	sprite_index = spr_painter_idle
	state = baddiestate.idle
	}
	
	invincible = true
	image_speed = 0.35
	sprite_index = spr_painter_draw_painting
	}
	break
	*/
	scr_painter_dash()
	}
}
}
