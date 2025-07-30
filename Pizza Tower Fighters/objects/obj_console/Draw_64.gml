var _yoff = 334;
_yoff = 0;
var da50thing = 25;
draw_set_font(font_console);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha((length / 480) * 0.75);

if (length > 0)
    draw_roundrect_colour(483 - length, 3 + (((length / 480) * -da50thing) + da50thing) + _yoff, 475 + length, 200 + (((length / 480) * -da50thing) + da50thing) + _yoff, c_black, c_black, false);

draw_set_alpha(length / 480);

if (length > 0)
    draw_line_width_color(483 - length, 180 + (((length / 480) * -da50thing) + da50thing) + _yoff, 475 + length, 180 + (((length / 480) * -da50thing) + da50thing) + _yoff, 1, c_white, c_white);

if (!surface_exists(surf))
    surf = surface_create(960, 200);

surface_set_target(surf);
draw_clear_alpha(c_black, 0);
draw_text(6, (180 - scrollpos) + (((length / 480) * -da50thing) + da50thing), str);
draw_text(6 + string_width(string_copy(str, 1, at - 1)), (180 - scrollpos) + (((length / 480) * -da50thing) + da50thing), showcursor ? "|" : "");

for (var i = 0; i < array_length(history); i++)
{
    if (history[i][1] != 2)
    {
        draw_set_alpha(0.75);
        draw_set_color(history[i][1] ? c_red : c_green);
        draw_rectangle(4, (((180 - lerppos) + (20 * i)) - scrollpos) + (((length / 480) * -da50thing) + da50thing), 477 + length, (((198 - lerppos) + (20 * i)) - scrollpos) + (((length / 480) * -da50thing) + da50thing), false);
    }
    
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_text(6, (((180 - lerppos) + (20 * i)) - scrollpos) + (((length / 480) * -da50thing) + da50thing), string_replace(history[i][0], " - FAILED", ""));
}

draw_set_halign(fa_right);
draw_text(956, 3, "Vadimos's debug console");
draw_set_halign(fa_left);
surface_reset_target();
draw_set_alpha(length / 480);
draw_surface_part(surf, 0, 0, length * 2, 200, 480 + -length, ((length / 480) * -da50thing) + da50thing + _yoff);
draw_set_alpha(1);

for (var i = 0; i < array_length(search); i++)
{
    draw_set_alpha((length / 480) * 0.75);
    draw_set_color(c_black);
    draw_roundrect(10, 201 + (i * 20) + _yoff, string_width(search[i]) + 30, 220 + (i * 20) + _yoff, false);
    draw_set_alpha(length / 480);
    draw_set_color(c_white);
    draw_text(16 + irandom_range(-sh, sh), 202 + (20 * i) + _yoff, search[i]);
}

var arrnum = -((array_length(history) - 9) * 20);

if ((array_length(history) - 9) < 0)
    arrnum = 0;

draw_set_color(c_white);
draw_set_alpha(1);
