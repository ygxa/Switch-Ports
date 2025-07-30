var c = view_camera[0]
// could steal pt method of after image handling t

with obj_baddie
{
	var dist = 32

	if visible && bbox_in_camera_ext(c, dist)
	{
		//Variables
		var _drawx = x;
		var _drawy = y;
		if tauntBuffer || global.freezeframe && setfordeath {
			_drawx += irandom_range(-1, 1);
			_drawy += irandom_range(-1, 1);
		}
		var _xs = (abs(image_xscale) + (squashvalx)) * sign(image_xscale);
		var _ys = image_yscale - squashvalx;
		if squashedy = true
		{
			_xs = image_yscale - squashvaly;
			_ys = (abs(image_xscale) + (squashvaly)) * sign(image_xscale);
		}
		draw_xscale = _xs
		draw_yscale = _ys
		draw_x = _drawx + (46 * squashvaly)
		draw_y = _drawy + (46 * squashvalx)
		if object_index == obj_pillarenem && state = baddiestate.grabbed
			draw_y -= 75
		pal_swap_set(spr_palette, paletteselect, false);
		#region Draw Enemy
		draw_sprite_ext(sprite_index, image_index, draw_x, draw_y, draw_xscale, draw_yscale, image_angle, image_blend, image_alpha);

		if flash {
		    draw_sprite_ext_flash(sprite_index, image_index, draw_x, draw_y, draw_xscale, draw_yscale, image_angle, c_white, image_alpha);
		}

		if cottoned {
			draw_sprite_ext_flash(sprite_index, image_index, draw_x, draw_y, draw_xscale, draw_yscale, image_angle, #FF8AFE, 0.6);
		}

		#endregion
		pal_swap_reset();
		if global.debugmode = 1
		{
			draw_set_font(font_dev);
			draw_text(x, y - 50, state);
			draw_text(x, y - 150, movespeed);
			if object_index = obj_cottonwitch
			{
				draw_text(x, y - 100, bombreset);	
			}
			if object_index = obj_sluggy
			{
				draw_text(x, y - 100, idletimer);	
				draw_text(x, y - 150, jumptimer);	
			}
			if object_index = obj_creamtheifOLD
			{
				draw_text(x, y - 100, snatchcooldown);	
		
			}
			draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1);	
		}
	}
}
with obj_creamThief {
	if visible && bbox_in_camera_ext(c,32) {	
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	}
}
with obj_player
{
	if visible && bbox_in_camera_ext(c,32)
	{
			
			var my_color_array = my_palettes[paletteselect, 2]
			var using_pattern = sprite_exists(my_color_array[2])
			if !using_pattern {
				if !surface_exists(my_pal_surface) my_pal_surface = surface_create(sprite_get_width(spr_pal2), sprite_get_height(spr_pal2))
				if !buffer_exists(my_pal_buffer) {
					trace("buffer created")
					//if surface_exists(my_pal_surface) surface_free(my_pal_surface)
					if surface_exists(my_pal_surface) {
						surface_set_target(my_pal_surface)	
						draw_clear_alpha(c_white,0)
						pal_swap_draw_palette(spr_pal2,0,0,0)
						pal_swap_draw_palette(spr_pal2,1,1,0)	
						for (var i = 0; i < array_length(my_color_array); i++) {
						    draw_point_color(1,i,my_color_array[i]);
						}
					
						surface_reset_target();	
					}
					my_pal_buffer = buffer_create(sprite_get_width(spr_pal2) * sprite_get_height(spr_pal2) * 4, buffer_fixed, 1)
					buffer_get_surface(my_pal_buffer, my_pal_surface, 0)
					//if surface_exists(my_pal_surface) surface_free(my_pal_surface)
				}
				if buffer_exists(my_pal_buffer) buffer_set_surface(obj_player.my_pal_buffer, obj_player.my_pal_surface, 0)	
			}
			
			var _x_shake = 0, _y_shake = 0
			if state == states.bushdisguise && shaketime > 0
				_x_shake += random_range(shaketime / 12, -shaketime / 12)
			if global.freezeframe {
				_x_shake = random_range(-6, 6)
				 _y_shake = random_range(-6, 6)
			}
			scr_palette_as_player()
		
			draw_sprite_ext(sprite_index, image_index, x + _x_shake, y + _y_shake, xscale * scale, yscale * scale, draw_angle, image_blend, image_alpha);
	
			pal_swap_reset()
			//if surface_exists(my_pal_surface) draw_surface_ext(my_pal_surface, x + 50, y, 10, 10, 0, c_white, 1)
			
		
		/*
		else
		{
			var _x = x
			if state == states.bushdisguise && shaketime > 0
				_x += random_range(shaketime / 12, -shaketime / 12)
				
			var s_pat = shader_get_sampler_index(shd_pattern, "s_Pattern");
			var tex = sprite_get_texture(patternspr, 0);
			var tex2 = sprite_get_texture(sprite_index, image_index);
			shader_set(shd_pattern);
			texture_set_stage(s_pat, tex);

			var mask_color = #FFFF40
			shader_set_uniform_f(u_mask, color_get_red(mask_color), color_get_green(mask_color), color_get_blue(mask_color));

			var uvs = sprite_get_uvs(sprite_index, image_index);
			shader_set_uniform_f(u_spr, uvs[0], uvs[1], uvs[2], uvs[3]);
			shader_set_uniform_f(u_offset, uvs[4], uvs[5]);
			uvs = sprite_get_uvs(patternspr, 0);
			shader_set_uniform_f(u_pat, uvs[0], uvs[1], uvs[2], uvs[3]);

			shader_set_uniform_f(u_texel, texture_get_texel_width(tex), texture_get_texel_height(tex), texture_get_texel_width(tex2), texture_get_texel_height(tex2))

			draw_sprite_ext(sprite_index, image_index, _x, y, xscale * scale, yscale * scale, draw_angle, image_blend, image_alpha);
			shader_reset();
		}
	*/
		if flash {
		    draw_sprite_ext_flash(sprite_index, image_index, x + _x_shake, y + _y_shake, xscale * scale, yscale * scale, draw_angle, c_white, image_alpha);
		}

		if is_inSecretPortal {
		    draw_sprite_ext_flash(sprite_index, image_index, x + _x_shake, y + _y_shake, xscale * scale, yscale * scale, draw_angle, #49298D, image_alpha * (1.5 - scale));
		}




		if global.debugmode = 1 {
			draw_set_font(font_dev);
			draw_set_halign(fa_center);
			draw_set_color(c_white);
			draw_text(x, y - 50, "State: " + string(state) + "." + string(substate) + ", " + string(stateName));
			draw_text(x, y - 100, movespeed);
			draw_text(x, y - 150, grounded);
	
			draw_text(x, y - 200, "Can Ladder:" + string(!scr_solid(x, y + 16)));
			draw_text(x, y - 220, angle);
			draw_text(x + 50, y - 220, baddiegrabbedID);
	
			draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1);
			draw_set_halign(fa_left);
		}

	}
}

with obj_sausageman_dead {
	if spr_palette != noone
	{
		pal_swap_set(spr_palette, paletteselect, false)
		draw_sprite_ext(sprite_index,-1,drawx,drawy,image_xscale,image_yscale,image_angle,c_white,image_alpha)
		shader_reset()
	}
	else
		draw_sprite_ext(sprite_index,-1,drawx,drawy,image_xscale,image_yscale,image_angle,c_white,image_alpha)	
	
}

