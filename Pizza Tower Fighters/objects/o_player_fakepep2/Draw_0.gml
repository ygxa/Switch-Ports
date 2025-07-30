event_inherited();
pal_swap_set(s_pal_fakepep, global.palp2, false);
draw_self();
pal_swap_reset();

if (flash > 0)
{
    flash--;
    shader_set(ShaderWhite);
    draw_self();
    shader_reset();
}
