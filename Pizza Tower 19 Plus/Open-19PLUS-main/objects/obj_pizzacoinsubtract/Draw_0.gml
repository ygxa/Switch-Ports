draw_set_font(global.smallnumber);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
__draw_text_colour_hook(roundlower(obj_player.x) - 48, (roundlower(obj_player.y) - 110) + yoff, number, c_white, c_white, c_white, c_white, obj_pizzacoinindicator.image_alpha * image_alpha);
