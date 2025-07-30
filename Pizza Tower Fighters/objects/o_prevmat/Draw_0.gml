draw_set_alpha(image_alpha);
draw_sprite_ext(s_b_match, 0, x, y + yactual, image_xscale, image_yscale, image_angle, c_white, image_alpha);
draw_sprite_ext(s_b_match2, 0, x, y + yactual, image_xscale, image_yscale, image_angle, c_white, image_alpha);

if (p1liv > p2liv)
{
    pal_swap_set(p1pal, pal1, false);
    draw_sprite_ext(p1spr_w, 0, x - 125, y + yactual + 30, image_xscale, image_yscale, image_angle, c_white, image_alpha);
    pal_swap_reset();
    DrawSetText(0, F_Menu, 50, 50);
    draw_text_transformed(x - 50, y + yactual, string(p1liv) + "-" + string(p2liv), image_xscale, image_yscale, image_angle);
    pal_swap_set(p2pal, pal2, false);
    draw_sprite_ext(p2spr_l, 1, x + 130, y + yactual + 30, image_xscale, image_yscale, image_angle, c_white, image_alpha);
    pal_swap_reset();
}

if (p1liv < p2liv)
{
    pal_swap_set(p1pal, pal1, false);
    draw_sprite_ext(p1spr_l, 0, x - 125, y + yactual + 30, image_xscale, image_yscale, image_angle, c_white, image_alpha);
    pal_swap_reset();
    DrawSetText(0, F_Menu, 50, 50);
    draw_text_transformed(x - 50, y + yactual, string(p1liv) + "-" + string(p2liv), image_xscale, image_yscale, image_angle);
    pal_swap_set(p2pal, pal2, false);
    draw_sprite_ext(p2spr_w, 1, x + 130, y + yactual + 30, image_xscale, image_yscale, image_angle, c_white, image_alpha);
    pal_swap_reset();
}

if (p1liv == p2liv)
{
    pal_swap_set(p1pal, pal1, false);
    draw_sprite_ext(p1spr, 0, x - 125, y + yactual + 30, image_xscale, image_yscale, image_angle, c_white, image_alpha);
    pal_swap_reset();
    DrawSetText(0, F_Menu, 50, 50);
    draw_text_transformed(x - 50, y + yactual, string(p1liv) + "-" + string(p2liv), image_xscale, image_yscale, image_angle);
    pal_swap_set(p2pal, pal2, false);
    draw_sprite_ext(p2spr, 1, x + 130, y + yactual + 30, image_xscale, image_yscale, image_angle, c_white, image_alpha);
    pal_swap_reset();
}

DrawSetText(0, F_Win, 50, 50);

if (gamemode == "CPU")
    draw_text_transformed(x - 50, (y + yactual) - 90, "CPU BATTLE", image_xscale, image_yscale, image_angle);

if (gamemode == "Multi")
    draw_text_transformed(x - 50, (y + yactual) - 90, "MULTIPLAYER", image_xscale, image_yscale, image_angle);

if (gamemode == "Arcade")
    draw_text_transformed(x - 50, (y + yactual) - 90, "ARCADE MATCH", image_xscale, image_yscale, image_angle);

draw_text_transformed(x - 50, (y + yactual) - 75, string(day) + "/" + string(month) + "/" + string(year), image_xscale, image_yscale, image_angle);

if (playanim)
    draw_sprite_ext(s_b_matchanim, playindex, x, y + yactual, image_xscale, image_yscale, image_angle, c_white, image_alpha);

draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_font(global.font);
draw_set_color(c_white);
draw_text(x + 10, (y - 170) + yactual, str);
