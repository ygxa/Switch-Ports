draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(global.bigfont);

for (i = 0; i < array_length(menu); i++)
{
    if (selected == i)
        draw_set_color(selectedCol);
    else
        draw_set_color(notSelectedCol);
    
    draw_set_halign(fa_left);
    draw_text(x - 50, y + (i * spacing), menu[i]);
    
    if (i != 3)
    {
        draw_set_halign(fa_left);
        draw_sprite(spr_slider, 0, x + 200, y + (i * spacing) + 8);
        var w = 200;
        var aw = w * (menuselect[i] / 100);
        draw_sprite(spr_slidericon, 0, x + 200 + aw, y + (i * spacing) + 8);
    }
}

var cursWidth = sprite_get_width(s_cursor);
draw_sprite(s_cursor, -1, (x + -40 + cursorLevitate) - (cursWidth / 2), y + (selectLerp * spacing) + 20);
