if (text == "")
	exit;

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale,0,c_white,1)

//var txt = scribble(text).starting_format(font_get_sprite(global.npcsmallfont, true)).blend(16777215, fade).wrap(250).align(1, 1)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(global.npcsmallfont)
draw_text(x,y,text)
