if (!global.ShowHUD || is_tutorial())
	exit

draw_sprite(lang_get_sprite(spr_comboEnd), 0, x, y)
var img_ind = floor(title_cur + title_index)
draw_sprite(lang_get_sprite(spr_comboTitles), img_ind, x, y + 10)

if (showVery)
	draw_sprite(lang_get_sprite(spr_comboOver), 0, x - 60, y - 15)

draw_set_font(global.smallfont)
draw_set_halign(fa_center)
draw_text(x, y + 70, comboScoreMax)
