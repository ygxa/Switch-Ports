if (player_marker == o_maker2)
{
    pal_swap_set(s_pal_fakepepclone, global.palp1, false);
    draw_set_alpha(0.5);
    draw_sprite(s_cputarget, 0, x, y - 50);
    draw_set_alpha(1);
    draw_self();
    pal_swap_reset();
}
else
{
    pal_swap_set(s_pal_fakepepclone, global.palp2, false);
    draw_set_alpha(0.5);
    draw_sprite(s_cputarget_3, 0, x, y - 50);
    draw_set_alpha(1);
    draw_self();
    pal_swap_reset();
}
