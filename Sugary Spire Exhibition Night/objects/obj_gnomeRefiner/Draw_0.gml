if (gemsRefined < 4)
{
	draw_sprite(spr_donutbubble, donutIndex, x, y - 35)
	draw_set_font(global.npcfont)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	
	var shit = 4 - gemsRefined
	draw_set_color(c_black)
	draw_text(x + 10, y - 35, string(shit))
}

pal_swap_set(pal_gnome, colorID, false)
draw_self()
pal_swap_reset()
