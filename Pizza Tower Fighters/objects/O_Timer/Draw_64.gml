if (!(global.GUIon == true))
    return 0;

DrawSetText(16777215, global.bigfont, 50, 50);
var mm = floor(timermin) div 60;
var ss = floor(timermin) % 60;
var mm_string = string_replace(string_format(mm, 2, 0), " ", "0");
var ss_string = string_replace(string_format(ss, 2, 0), " ", "0");
var _max_x = 252;
var _perc = (timerold - timermin) / timerold;
var _barpos = _max_x * _perc;
draw_text(435, 50, mm_string + ":" + ss_string);
