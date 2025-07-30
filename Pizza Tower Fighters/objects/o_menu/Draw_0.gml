DrawSetText(16777215, global.bigfont, 50, 50);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

for (i = 0; i < array_length(menu); i++)
{
    if (selected == i)
        draw_set_color(selectedCol);
    else
        draw_set_color(notSelectedCol);
    
    var str = menu[i];
    draw_text(x, y + (i * spacing), str);
    
    if (collision_rectangle(x, y + (i * spacing), x + string_width(str), y + (i * spacing) + string_height(str), obj_mousepointer, false, true))
    {
        if (selected != i)
        {
            selected = i;
            audio_play_sound(su_menuscroll, 50, false);
        }
        
        if (mouse_check_button_pressed(mb_left))
            confirm();
    }
}

var cursWidth = sprite_get_width(s_cursor);
draw_sprite(s_cursor, -1, (x + 10 + cursorLevitate) - (cursWidth / 2), y + (selectLerp * spacing) + 20);
