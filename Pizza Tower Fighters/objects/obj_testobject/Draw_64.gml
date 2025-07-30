return 0;
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_alpha(1);
draw_set_font(font_console);
var arr = audio_get_playing();

for (var i = 0; i < array_length(arr); i++)
    draw_text(400, 10 + (i * 20), audio_get_name(arr[i]));
