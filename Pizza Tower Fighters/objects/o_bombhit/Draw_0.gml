if (player == 1)
{
    pal_swap_set(s_pal_noi, global.palp1, false);
    draw_self();
    pal_swap_reset();
}

if (player == 2)
{
    pal_swap_set(s_pal_noi, global.palp2, false);
    draw_self();
    pal_swap_reset();
}
