if (!active)
	exit

dialogAlpha = approach(dialogAlpha, (progression == 1) ? 1 : 0, 0.05)

if (dialogAlpha >= 1 && typist.get_paused())
	typist.unpause()
else
	typist.pause()

draw_set_halign(fa_left)
draw_set_alpha(dialogAlpha)
draw_set_color(c_white)
draw_sprite(spr_dialobox_temp, 0, 0, 0)

if (!chatty && dialogAlpha >= 1)
	draw_sprite(spr_dialogbox_next, ass, 870,160)

draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_alpha(dialogAlpha)
draw_set_font(global.npcfont)

var sep = 32
var wrap_w = 800

var text = dialogEvents[dialogCurrent]
var newtext = string_replace_all(text, " ", "        ");

var fuck = clamp(floor(textletter),0,string_length(newtext));
draw_text_ext(40,40,string_copy(newtext,1,fuck),sep,wrap_w)


draw_set_color(c_white)
draw_set_alpha(1)
