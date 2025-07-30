DrawSetText(16777215, global.bigfont, 50, 50);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

for (i = 0; i < array_length(menu); i++)
{
    if (selected == i)
        draw_set_color(selectedCol);
    else
        draw_set_color(notSelectedCol);
    
    draw_text(x, y + (i * spacing), menu[i]);
}

var cursWidth = sprite_get_width(s_cursor);
