draw_set_halign(fa_center);
draw_set_font(global.font);
draw_option(150, 30 + ScrollY, "BACK", optionselected == 0);
draw_option(480, 100 + ScrollY, "WINDOW MODE", optionselected == 1);
draw_option(280, 150 + ScrollY, "WINDOWED", !optionsaved_fullscreen);
draw_option(680, 150 + ScrollY, "FULLSCREEN", optionsaved_fullscreen);
draw_option(480, 200 + ScrollY, "RESOLUTION", optionselected == 2);
draw_option(250, 250 + ScrollY, "480X260", optionsaved_resolution == 0);
draw_option(480, 250 + ScrollY, "960X540", optionsaved_resolution == 1);
draw_option(710, 250 + ScrollY, "1280X720", optionsaved_resolution == 2);
draw_option(480, 300 + ScrollY, "SMOOTH CAM", optionselected == 3);
draw_option(380, 350 + ScrollY, "ON", optionsaved_smoothcam);
draw_option(580, 350 + ScrollY, "OFF", !optionsaved_smoothcam);
draw_option(480, 400 + ScrollY, "SCREEN MELT", optionselected == 4);
draw_option(380, 450 + ScrollY, "ON", optionsaved_screenmelt);
draw_option(580, 450 + ScrollY, "OFF", !optionsaved_screenmelt);
draw_option(480, 500 + ScrollY, "SCREEN TILT", optionselected == 5);
draw_option(380, 550 + ScrollY, "ON", optionsaved_screentilt);
draw_option(580, 550 + ScrollY, "OFF", !optionsaved_screentilt);
draw_set_font(global.smallfont);
var _string_width = string_width(subtitle) + 32;

if (subtitle != "")
    draw_sprite_ext(spr_optionSubtitle, 0, 480, 521, _string_width / 32, 1, 0, c_white, 1);

draw_text(480, 512, subtitle);
