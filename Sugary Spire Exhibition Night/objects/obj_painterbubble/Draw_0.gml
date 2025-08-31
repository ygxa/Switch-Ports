draw_self()
draw_set_font(global.npcsmallfont)
var txt = ""
var use_typist = undefined

if (!buffering)
{
	txt = idleThoughts[idleThought]
}
else
{
	txt = bufferThought
	
	if (usePaletteThought)
	{
		txt += " "
		txt += paletteThoughts[savedPaletteIndex]
	}
	
	use_typist = usePaletteThought
	
}

/*
var text = scribble(txt)
text.starting_format(font_get_sprite(global.npcsmallfont, true))
text.blend(16777215, fade)
text.wrap(250)
text.align(1, 1)
*/
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_alpha(fade)

var sep = 15
var wrap_w = 200
var new_stringass
var new_string = txt
if usePaletteThought{
	new_stringass = string_replace_all(txt, "Hmm... ", "");	
	new_string = string_replace_all(new_stringass, "_thought", "");	
}

if new_string = "Classic Duds"
	new_string = "Hmm... " + "Classic!"

if new_string = "Exhibition Duds"
	new_string = "Hmm... " + "Timely!"

if new_string = "Painter Red"
	new_string = "Hmm... " + "Antsy!"

if new_string = "Painter Black"
	new_string = "Hmm... " + "Sleek!"

if new_string = "Painter Purple"
	new_string = "Hmm... " + "Regal!"

if new_string = "Noise"
	new_string = "Hmm... " + "\nCopyright Tour de Pizza"

if new_string = "Notebook"
	new_string = "Hmm... " + "College Rule!"

if new_string = "Brainy Duds"
	new_string = "Hmm... " + "Smart!"

if new_string = "Golden Brainy Duds"
	new_string = "Hmm... " + "Shiny!"

if new_string = "Hazardous"
	new_string = "Hmm... " + "Dangerous!"

if new_string = "Cotton Candy"
	new_string = "Hmm... " + "Good for her!"

if new_string = "Fred's Choice"
	new_string = "Hmm... " + "Worms..."

if new_string = "Frog Pajamas"
	new_string = "Hmm... " + "Humid!"

var fuck = clamp(floor(textletter),0,string_length(new_string));

if (image_xscale > 0)
	draw_text_ext(x + 6, y + 4,string_copy(new_string,1,fuck),sep,wrap_w)
else
	draw_text_ext(x - 6, y + 4,string_copy(new_string,1,fuck),sep,wrap_w)
draw_set_alpha(1)