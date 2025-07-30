draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(bgalpha / 2);
draw_set_color(c_black);
draw_rectangle(0, 0, 960, 540, false);
DrawSetText(16777215, F_CrayZee, 50, 50);

if (bgalpha != 1)
    return 0;

draw_set_alpha(1);

for (i = 0; i < array_length(menu); i++)
{
    if (selected == i)
        draw_set_color(selectedCol);
    else
        draw_set_color(notSelectedCol);
    
    draw_text(x, y + (i * spacing), menu[i]);
}
