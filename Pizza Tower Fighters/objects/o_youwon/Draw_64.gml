DrawSetText(16777215, F_Menu, 50, 50);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_sprite_ext(s_finish, 0, 460, 275, xscale, xscale, 1, c_white, fade_alpha);

if (xscale == 1)
    fade_alpha -= fade_speed;

if (fade_alpha < 0)
    fade_alpha = 0;
