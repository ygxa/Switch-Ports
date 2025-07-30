if (starting == true)
{
    DrawSetText(16777215, F_Menu, 50, 50);
    draw_sprite_ext(start_text, startsprite, 460, 275, 1, 1, 0, c_white, alphastart);
}

if (starting != true && alphastart > 0)
    draw_sprite_ext(start_text, startsprite, 460, 275, 1, 1, 0, c_white, alphastart);
