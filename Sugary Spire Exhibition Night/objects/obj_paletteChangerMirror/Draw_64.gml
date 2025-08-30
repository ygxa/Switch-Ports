if (!global.ShowHUD)
	exit

var _my_pal_index = global.PlayerPaletteIndex

if (!number_in_range(_my_pal_index, 0, array_length(global.CharacterPalette[global.playerCharacter].palettes) - 1))
{
	//show_debug_message(string("WARNING: PALETTE INDEX {0} IS OUT OF RANGE 0-{1}. DEFAULTING TO 0", _my_pal_index, array_length(global.CharacterPalette[global.playerCharacter].palettes) - 1))
	_my_pal_index = 0
}

var lang_key = global.CharacterPalette[global.playerCharacter].palettes[_my_pal_index].palName
var lang_key_desc = "chicken"

if lang_key = "Classic Duds"
	lang_key_desc = "Came with your birth"

if lang_key = "Exhibition Duds"
	lang_key_desc = "Unlocked by showing up to the Exhibition Night"

if lang_key = "Painter Red"
	lang_key_desc = "Unlocked by finding 3 Secrets\nat the Exhibition Night"

if lang_key = "Painter Black"
	lang_key_desc = "Unlocked by finding 6 Secrets\nat the Exhibition Night"

if lang_key = "Painter Purple"
	lang_key_desc = "Unlocked by finding 9 Secrets\nat the Exhibition Night"

if lang_key = "Noise"
	lang_key_desc = "Unlocked by finding every Secret\nat the Exhibition Night"

if lang_key = "Notebook"
	lang_key_desc = "Unlocked by scoring a Sick 3-Pointer\nin the Painter's Gallery"

if lang_key = "Notebook"
	lang_key_desc = "Unlocked by scoring a Sick 3-Pointer\nin the Painter's Gallery"

if lang_key = "Brainy Duds"
	lang_key_desc = "Unlocked by facing judgment"

if lang_key = "Golden Brainy Duds"
	lang_key_desc = "Unlocked by getting the highest judgment"

if lang_key = "Hazardous"
	lang_key_desc = "Unlocked by cleaning out all of the trash\nin Crunchy Construction"

if lang_key = "Cotton Candy"
	lang_key_desc = "Unlocked by digging into a Cotton Block\nfor 5 seconds straight"

if lang_key = "Fred's Choice"
	lang_key_desc = "Unlocked by bouncing repeatedly on Fred the Worm's head in Sugarshack Mines"

if lang_key = "Frog Pajamas"
	lang_key_desc = "Unlocked by drowning 3 Box Frogs\nin Molasses Swamp"

//var scrib = scribble(string("[fa_center][promptfont][fa_bottom][alpha,{0}]{1}\n{2}", alpha, lang_get(lang_key), lang_key_desc))
draw_set_halign(fa_center)
draw_set_font(global.promptfont)
draw_set_valign(fa_bottom)
draw_set_alpha(alpha)
draw_text(480, 524,string(lang_key) + "\n" + string(lang_key_desc))
draw_set_alpha(1)