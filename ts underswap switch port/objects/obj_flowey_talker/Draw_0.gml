if (obj_overworldui.portraitSprite != -1)
    draw_sprite_ext(obj_overworldui.portraitSprite, floor(portraitIndex), x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
else
    draw_self();

if (writer != -4 && instance_exists(writer))
{
    global.draw_text_style_scale = 2;
    draw_text_style(90, 80, writer.internalStr, 16777215, fnt_dotumche, global.lang_charwidth_sm * 2, global.lang_charheight_md * 2);
    global.draw_text_style_scale = 1;
}
