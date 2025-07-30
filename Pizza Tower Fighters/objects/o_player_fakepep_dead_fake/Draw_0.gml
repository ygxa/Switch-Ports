if (fart == "player1")
{
    pal_swap_set(s_pal_fakepep, global.palp1, false);
    draw_self();
    pal_swap_reset();
}

if (fart == "player2")
{
    pal_swap_set(s_pal_fakepep, global.palp2, false);
    draw_self();
    pal_swap_reset();
}
