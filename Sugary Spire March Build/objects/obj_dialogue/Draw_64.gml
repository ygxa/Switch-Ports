/*draw_sprite_ext(spr_npcrope, propdex, boxx - 416, boxy - 15, 1, 1, 0, c_white, 1)
draw_sprite_ext(spr_npcrope, propdex, boxx + 384, boxy - 15, 1, 1, 0, c_white, 1)
#region Old And Bad
if !surface_exists(mysurf)
	mysurf = surface_create(960, (96 * (height)))
if !surface_exists(mycut)
	mycut = surface_create(960, (96 * (height)))
if surface_exists(mycut)
{
	surface_set_target(mycut)
	draw_set_color(c_white)
	draw_rectangle(-960, -540, 1920, 1080, false)
	draw_set_blend_mode(bm_subtract)
	draw_sprite_ext(spr_npcbubble, 1, 480, 0, 9, height, 0, c_white, 1)
	draw_set_blend_mode(bm_normal)
	surface_reset_target()
}
if surface_exists(mysurf)
{
	//draw_clear_alpha(c_black, 0)
	surface_set_target(mysurf)
	draw_set_color(c_white)
	draw_sprite_tiled(mytex, 0, mytex_x, mytex_y)
	draw_set_blend_mode(bm_subtract)
	draw_surface(mycut, 0, 0)
	draw_set_blend_mode(bm_normal)
	draw_sprite_ext(spr_npcbubble, 0, 480, 0, 9, height, 0, c_white, 1)
	surface_reset_target()
	draw_surface(mysurf, boxx - 480, boxy)
}
#endregion





//draw_sprite_ext(spr_npcbubble, 0, boxx, boxy, 9, 1 + height, 0, c_white, 1)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_black)
//draw_text_ext((boxx - 416) + 16, boxy + 16, text, 0, 800)
draw_text_scribble_ext((boxx - 416) + 16, boxy + 16, "[shake][spr_npcfont]" + text, 800)
draw_set_color(c_white)
