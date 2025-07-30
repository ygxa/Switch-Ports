draw_sprite(s_icon_arrow, 0, x + 50, y);
pal_swap_set(p1pal, global.palp1, false);
draw_self();
pal_swap_reset();
draw_set_alpha(1);
