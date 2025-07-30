var p = tex_max - array_length(tex_list);
var t = p / tex_max;
var spr_w = sprite_get_width(s_loadingscreen);
var spr_h = sprite_get_height(s_loadingscreen);
var xx = floor(480 - (spr_w / 2));
var yy = floor(270 - (spr_h / 2));
draw_sprite(s_loadingscreen, 0, xx, yy);
draw_sprite_part(s_loadingscreen, 1, 0, 0, spr_w * t, spr_h, xx, yy);
