draw_self()
if (array_length(musicArr) < 1)
    return;
var dc = musicArr[pos_playing].desc
draw_sprite(spr_soundtest_nowplaying, bubbleindex, 0, 0)
draw_set_color(0xF8A0F8)
draw_set_font(global.transfopromptfont)
draw_set_valign(fa_middle)
draw_set_halign(fa_center)
draw_text_scribble((960 / 2), 64, dc)
draw_set_color(c_white)
