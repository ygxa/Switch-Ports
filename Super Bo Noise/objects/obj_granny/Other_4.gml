if (!instance_exists(self))
    return;
if is_undefined(text)
{
    instance_destroy()
    return;
}
if global.panic
{
    instance_destroy()
    return;
}
if surface_exists(surfclip)
    surface_free(surfclip)
if surface_exists(surffinal)
    surface_free(surffinal)
var p = 1
var l = string_length(text)
var old_text = text
text = ""
font = global.grannyfont
while (p <= l)
{
    text = string_insert(string_char_at(old_text, p), text, (p + 1))
    text = scr_separate_text(text, font, (text_sprite_width * text_xscale - text_contentpad * 2))
    p++
}
text_yscale = (string_height(text) + text_contentpad * 2) / text_sprite_height
if (text_yscale < 1)
    text_yscale = 1
if change_y
    text_y = (-((text_yscale * text_sprite_height)))
else
    change_y = true
text_oldxscale = text_xscale
draw_set_font(global.grannyfont)
text_arr = scr_compile_icon_text(text)
