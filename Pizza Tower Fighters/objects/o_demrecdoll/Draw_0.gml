if (usepal)
{
    pal_swap_set(palspr, palselect, false);
    draw_self();
    pal_swap_reset();
}
else
{
    draw_self();
}
