draw_set_font(global.bigfont);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var yy = 0;

for (i = 0; i < array_length(menu); i++)
{
    if (selected == i)
        draw_set_color(selectedCol);
    else
        draw_set_color(notSelectedCol);
    
    draw_text(x - 80, y + (i * spacing), menu[i]);
}

var cursWidth = sprite_get_width(s_cursor);
draw_sprite(s_cursor, -1, (x + 10 + cursorLevitate) - (cursWidth / 2) - 80, y + (selectLerp * spacing) + 20);
