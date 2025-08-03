draw_sprite(spr_alphys_chain, 0, x, y);
draw_self();

if (staticMode)
{
    if (global.lowvfx)
        draw_rectangle_pix(x - 18, y + 34, 36, 24, 16777215, 1);
    else
        draw_sprite(spr_alphys_monitor_static, staticIndex, x, y + 46);
}

if (contentIndex)
    draw_sprite(lang_get_sprite(spr_alphys_monitor_contents), contentIndex, x, y + 46);

if (screenPose >= 0)
{
    draw_sprite(spr_alphys_screenposes, screenPose, x - 18, y + 33);
    draw_sprite_ext(lang_get_sprite(spr_alphys_monitor_contents), 9, x, y + 46, 1, 1, 0, c_white, 0.2);
}

draw_sprite(lang_get_sprite(spr_alphys_monitor_contents), 3, x, y + 46);
draw_sprite_inbox(spr_alphys_monitor_beam, 0, x - 18, y + beamY, x - 18, y + 34, x + 18, y + 58);
