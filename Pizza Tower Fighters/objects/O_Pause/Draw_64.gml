if (PAUSE == true)
{
    if (sprite_exists(paused_sprite))
        draw_sprite(paused_sprite, 0, 0, 0);
    
    draw_set_color(c_black);
    draw_set_alpha(0.5);
    draw_rectangle(0, 0, 1000, 1000, 0);
    draw_set_color(c_white);
    draw_set_alpha(1);
    DrawSetText(16777215, F_Menu, 50, 50);
    //draw_text_scribble(10, 10, "[wave] PAUSED!");
}
