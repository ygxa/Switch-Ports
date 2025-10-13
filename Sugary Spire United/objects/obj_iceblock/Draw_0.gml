if (flash)
	gpu_set_fog(true, c_white, 0, 1);
var _y = y;
if (state == 8)
	_y += 8;
draw_sprite(spr_iceblock_bg, color_index, x, _y);
if (contentspr != -4 && contentspr != -1)
{
	if (!surface_exists(contentsurf))
		contentsurf = surface_create(64, 64);
	else
	{
		surface_set_target(contentsurf);
		var xpos = 32 - ((sprite_get_width(contentspr) / 2) - sprite_get_xoffset(contentspr));
		var ypos = 32 - ((sprite_get_height(contentspr) / 2) - sprite_get_yoffset(contentspr));
		shader_set(shd_afterimage);
		var colorblend1 = shader_get_uniform(shd_afterimage, "blendcolor1");
		var colorblend2 = shader_get_uniform(shd_afterimage, "blendcolor2");
		shader_set_uniform_f(colorblend1, color_get_red(color.light) / 255, color_get_green(color.light) / 255, color_get_blue(color.light) / 255);
		shader_set_uniform_f(colorblend2, color_get_red(color.dark) / 255, color_get_green(color.dark) / 255, color_get_blue(color.dark) / 255);
		draw_sprite(contentspr, 0, xpos, ypos);
		shader_reset();
		surface_reset_target();
		draw_surface(contentsurf, x - 32, _y - 32);
	}
}
draw_sprite_ext(grabbedspr, color_index, x, _y, 1, 1, 0, c_white, 1);
gpu_set_fog(false, c_black, 0, 0);
