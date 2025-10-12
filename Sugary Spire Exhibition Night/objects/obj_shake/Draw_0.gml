if (flash)
{
	draw_sprite_ext_flash(sprite_index, image_index, x + random_range(-5, 5), y + random_range(-5, 5), image_xscale, image_yscale, image_angle, 16777215, image_alpha)
}
else
{
	pal_swap_set(paletteSprite, paletteSelect, 0)
	draw_sprite_ext(sprite_index, image_index, x + random_range(-5, 5), y + random_range(-5, 5), image_xscale, image_yscale, image_angle, image_blend, image_alpha)
	shader_reset()
}
