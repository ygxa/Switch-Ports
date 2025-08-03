set_font(fnt_main);
draw_set_color(c_white);
var offX = global.lang_data[global.lang_bound].offsets.info_text_x;
var offY = global.lang_data[global.lang_bound].offsets.info_text_y;
var ending = state >= 7;

if (state == 0 || ending)
    draw_set_alpha(alpha);

draw_text_mono_centered(320 + offX[0], 24 + offY[0], texts[4]);

if (state == 1 || ending)
    draw_set_alpha(alpha);
else
    draw_set_alpha(state > 1);

for (var i = 0; i < 2; i++)
    draw_text_style(textX[i] + offX[1], 76 + offY[1] + (i * global.lang_charheight_lgs), text0[i]);

if (state == 2 || ending)
    draw_set_alpha(alpha);
else
    draw_set_alpha(state > 2);

draw_text_mono_centered(320 + offX[2], 154 + offY[2], texts[1], global.lang_charwidth_md, global.lang_charheight_lgs);

if (state == 3 || ending)
    draw_set_alpha(alpha);
else
    draw_set_alpha(state > 3);

draw_text_mono_centered(320 + offX[3], 250 + offY[3], texts[2], global.lang_charwidth_md, global.lang_charheight_lgs);

if (state == 4 || ending)
    draw_sprite_ext(lang_get_sprite(spr_havefun), 0, 244, 294, 2, 2, 0, c_white, alpha);
else
    draw_sprite_ext(lang_get_sprite(spr_havefun), 0, 244, 294, 2, 2, 0, c_white, state > 4);

if (state == 5 || ending)
{
    draw_sprite_ext(spr_tslogo, 0, 438, 401, 1, 1, 0, c_white, alpha);
    draw_set_alpha(alpha);
}
else
{
    var _cond = state > 5;
    draw_sprite_ext(spr_tslogo, 0, 438, 401, 1, 1, 0, c_white, _cond);
    draw_set_alpha(_cond);
}

draw_text_mono(180 + offX[4], 400 + offY[4], texts[3]);
draw_set_alpha(1);
