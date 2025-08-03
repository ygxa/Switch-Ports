if (gameActive)
{
    draw_set_color(c_white);
    set_font(fnt_main);
    draw_text_outlined(20, 20, dxd_raw("stars.village_raw.lives"));
    
    for (var i = 0; i < gameLives; i++)
    {
        draw_sprite_ext(spr_bluesoul, 1, 40, 64 + (i * 48), 2, 2, 0, c_white, 1);
        draw_sprite_ext(spr_bluesoul, 0, 36, 60 + (i * 48), 2, 2, 0, c_white, 1);
    }
}

if (gameActive || (gameEnded && (gameEndedCounter % 30) >= 4 && !instance_exists(obj_fader)))
{
    draw_set_color(c_white);
    set_font(fnt_main);
    draw_set_halign(fa_right);
    global.dxformat[0] = _string(gameScore);
    draw_text_outlined(620, 20, dxd_int("stars.village_raw.score"));
    
    if (gameNewHighscore)
        draw_set_color(c_yellow);
    
    draw_set_valign(fa_bottom);
    global.dxformat[0] = _string(ds_map_find_value(global.flags, "sts_highscore"));
    draw_text_outlined(620, 460, dxd_int("stars.village_raw.highscore"));
    draw_set_color(c_white);
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);
}
