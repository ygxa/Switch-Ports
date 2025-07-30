event_inherited();
pal_swap_set(s_pizzaface_palette, palette, false);
draw_self();
pal_swap_reset();

if (flash > 0)
{
    flash--;
    shader_set(ShaderWhite);
    draw_self();
    shader_reset();
}
