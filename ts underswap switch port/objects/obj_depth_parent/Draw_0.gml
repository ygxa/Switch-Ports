if (visible)
{
    if (global.draw_dark_tiles)
        darktiles_predraw();
    
    draw_self();
    
    if (global.draw_dark_tiles)
        shader_postdraw();
}
