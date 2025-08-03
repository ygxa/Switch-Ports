draw_set_color(c_white);
draw_set_alpha(alpha);
set_font(fnt_main);
draw_text_mono_centered(320, 32, dxd_raw("extras.buger_disclaimer.text"));
draw_set_color(sel ? c_yellow : c_white);
draw_text_mono_centered(224, 416, dxd_raw("extras.buger_disclaimer.yes"));
draw_set_color(sel ? c_white : c_yellow);
draw_text_mono_centered(422, 416, dxd_raw("extras.buger_disclaimer.no"));
draw_set_alpha(1);
