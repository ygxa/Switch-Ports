draw_set_font(global.bigfont)
draw_set_alpha(1)
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_set_color(c_white)
var s = selected
var c_hover = (s == -1 ? c_white : c_gray)
draw_text_color(32, 50, "BACK", c_hover, c_hover, c_hover, c_hover, 1)
if (s < 0)
    s = 0
var dx = 960 / 2
scroll_pos = lerp(scroll_pos, s, 0.1)
var t = []
for (var i = 0; i < array_length(inputs); i++)
{
    draw_set_halign(fa_left)
    draw_set_valign(fa_middle)
    var c = inputs[i]
    var input = input_get(c)
    if gamepad
        c = string_copy(c, 1, (string_length(c) - 1))
    c_hover = (s == i ? c_white : c_gray)
    draw_set_color(c_hover)
    var dy = 50 - scroll_pos * scroll_pad + scroll_pad * i
    var _icon = input.icon
    if (_icon[0] == spr_null)
        draw_text_color(dx, dy, string_upper(c), c_hover, c_hover, c_hover, c_hover, 1)
    else
        draw_sprite_ext(_icon[0], _icon[1], dx, dy, 1, 1, 0, c_hover, 1)
    var ddx = 960 - 32
    draw_set_halign(fa_right)
    draw_set_valign(fa_middle)
    var input_arr = scr_input_get_icon(c, true)
    var txt = ""
    for (var j = array_length(input_arr) - 1; j >= 0; j--)
        txt += string("[{0},{1}]", sprite_get_name(input_arr[j][0]), input_arr[j][1])
    draw_text_scribble(ddx, dy, string("[fa_right][fa_middle]{0}", txt))
}
if reading
{
    draw_set_alpha(0.5)
    draw_rectangle_color(0, 0, 960, 540, c_black, c_black, c_black, c_black, false)
    draw_set_alpha(1)
    draw_set_halign(fa_center)
    draw_set_valign(fa_middle)
    draw_text_color((960 / 2), (540 / 2), "PRESS ANY BUTTON", c_white, c_white, c_white, c_white, 1)
}
else
{
    draw_set_halign(fa_left)
    draw_set_valign(fa_middle)
    draw_set_color(c_white)
    draw_set_alpha(1)
    var ty = 540 - 192
    draw_text_scribble(32, ty, "[fa_left][fa_middle]BIND:")
    draw_text_scribble(272, ty, string("[fa_center]{0}", get_control_sprite("jump")))
    ty += 50
    draw_text_scribble(32, ty, "[fa_left][fa_middle]CLEAR:")
    draw_text_scribble(272, ty, string("[fa_center]{0}", get_control_sprite("taunt")))
    ty += 50
    draw_text_scribble(32, ty, "[fa_left][fa_middle]RESET:")
    draw_text_scribble(272, ty, "[fa_center]F1")
}
