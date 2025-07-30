switch state {
	case baddiestate.intro:
		firey--
		draw_sprite_tiled(spr_versusbg, 0, 0, firey)
		if !surface_exists(player_surface)
			player_surface = surface_create(480, 540)
		else {	
			surface_set_target(player_surface)	
			draw_clear_alpha(c_black, 0)
			scr_palette_as_player()
			if showing_player draw_sprite_ext(spr_pizzellebossintro, 0, 200 + random_range(player_shake, -player_shake), 320 + random_range(player_shake, -player_shake), player_scale, player_scale, 0, player_color, player_alpha)
			if showing_names draw_sprite_ext(spr_boss_pizzelleTitle, 0, 200 + random_range(name_shake, -name_shake), 70 + random_range(name_shake, -name_shake), 1, 1, 0, c_white, 1)
			pal_swap_reset()
			surface_reset_target()
			draw_surface(player_surface, 0, 0)
		}
		if !surface_exists(boss_surface)
			boss_surface = surface_create(480, 540)
		else {	
			surface_set_target(boss_surface)	
			draw_clear_alpha(c_black, 0)
			if showing_boss draw_sprite_ext(boss_intro, 0, 280 + random_range(boss_shake, -boss_shake), 320 + random_range(boss_shake, -boss_shake), -1 * boss_scale, boss_scale, 0, boss_color, boss_alpha)
			pal_swap_reset()
			surface_reset_target()
			draw_surface(boss_surface, 480, 0)
		}
		if showing_names {
			draw_sprite_ext(spr_boss_vs, 0, 480 + random_range(versus_shake, -versus_shake), 270 + random_range(versus_shake, -versus_shake), 1, 1, 0, c_white, 1)
			draw_sprite_ext(boss_name, 0, 760 + random_range(name_shake, -name_shake), 70 + random_range(name_shake, -name_shake), 1, 1, 0, c_white, 1)
		}
		draw_set_alpha(fadeout)
		draw_rectangle_color(-10, -10, 970, 550, color, color, color, color, false)
		draw_set_alpha(1)
	break;
	case states.normal:
		scr_bosscontroller_draw_health()
		scr_bosscontroller_draw_health(bosshpspr, -1, bossmaxhp, lastbosshp, 960 - 64, 50,,,,bosshpindex)
	break
	
}

/*
if !showing_versus {
	for (var i = 0; i < max(8, bosshp); i++) {
		var startx = 800
		var starty = 54
		var _layer = floor(i / 8) 
		var _x = ((1 - (i % 4)) * 50) + (_layer * -4) + ((floor(i / 4) % 2) * 20)
		var _y = ((1 - (i % 4)) * 10) + ((floor(i / 4) % 2) * 60) + (_layer * -4)
		var _p_hpX = startx + _x		
		var _p_hpY = starty + _y	
		if i < 8
			draw_sprite_ext(bosshpspr, bosshpindex, _p_hpX + 2, _p_hpY + 2, 1, 1, 0, c_black, 1)
		pal_swap_set(pal_painter, 2 - (_layer), false)	
		if i < bosshp
			draw_sprite_ext(bosshpspr, bosshpindex, _p_hpX, _p_hpY, 1, 1, 0, c_white, 1)
		//draw_point_color(_p_hpX, _p_hpY, c_red)	
		pal_swap_reset()	
	}

	for (i = 0; i < playmaxhp; i++) {
		startx = 160
		starty = 54
		_layer = floor(i / 6) 
		_x = ((1 - (i % 3)) * -50) + (_layer * 4) + ((floor(i / 3) % 2) * -20)
		_y = ((1 - (i % 3)) * 10) + (_layer * 4) + ((floor(i / 3) % 2) * 60) 
		var _pz_hpX = startx + _x
		var _pz_hpY = starty + _y
		if i < 8
			draw_sprite_ext(playhpspr, playhpindex, _pz_hpX - 2, _pz_hpY + 2, 1, 1, 0, c_black, 1)
		scr_palette_as_player()	
		if i < playhp
			draw_sprite_ext(playhpspr, playhpindex, _pz_hpX, _pz_hpY, 1, 1, 0, c_white, 1)
		//draw_point_color(_pz_hpX, _pz_hpY, c_red)		
		pal_swap_reset()
	}
} else {
	firey--
	draw_sprite_tiled(spr_versusbg, 0, 0, firey)
	if !surface_exists(player_surface)
		player_surface = surface_create(480, 540)
	else {	
		surface_set_target(player_surface)	
		draw_clear_alpha(c_black, 0)
		
		//var _shk = random_range(player_shake, -player_shake)
		scr_palette_as_player()
		if showing_player
			draw_sprite_ext(spr_pizzellebossintro, 0, 200 + random_range(player_shake, -player_shake), 320 + random_range(player_shake, -player_shake), player_scale, player_scale, 0, player_color, player_alpha)
		if showing_names
			draw_sprite_ext(spr_boss_pizzelleTitle, 0, 200 + random_range(name_shake, -name_shake), 70 + random_range(name_shake, -name_shake), 1, 1, 0, c_white, 1)
		pal_swap_reset()
		surface_reset_target()
		draw_surface(player_surface, 0, 0)
	}
	if !surface_exists(boss_surface)
		boss_surface = surface_create(480, 540)
	else {	
		surface_set_target(boss_surface)	
		draw_clear_alpha(c_black, 0)
		if showing_boss
			draw_sprite_ext(boss_intro, 0, 280 + random_range(boss_shake, -boss_shake), 320 + random_range(boss_shake, -boss_shake), -1 * boss_scale, boss_scale, 0, boss_color, boss_alpha)
		pal_swap_reset()
		surface_reset_target()
		draw_surface(boss_surface, 480, 0)
	}
	if showing_names {
		draw_sprite_ext(spr_boss_vs, 0, 480 + random_range(versus_shake, -versus_shake), 270 + random_range(versus_shake, -versus_shake), 1, 1, 0, c_white, 1)
		
		draw_sprite_ext(boss_name, 0, 760 + random_range(name_shake, -name_shake), 70 + random_range(name_shake, -name_shake), 1, 1, 0, c_white, 1)
	}
}
	




