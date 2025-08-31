textletter = 9999
textspeed = 0.5
image_speed = 0.35
fade = 0
bufferThought = lang_get("Hmm...")
bufferLength = string_length(bufferThought) + 1
idleThoughts = []
idleThought = 0
usePaletteThought = false
paletteThoughts = []
savedPaletteIndex = global.PlayerPaletteIndex
buffering = false
bufferCooldown = 0
//typist = scribble_typist()
//typist.pause()
//typist.in(0.25, 1)

array_push(idleThoughts, "Hmm... \"Art block\"?\nCall it art curse!\nThat's what it is...")
array_push(idleThoughts, "Hmm... If it all goes\nwrong, I can always\nreturn to jock life...")
array_push(idleThoughts, "Hmm... Maybe this will\nfinally get people off\ntheir phones...")
array_push(idleThoughts, "Hmm... Does the dry\ncleaner handle magic ink?\nOr just normal ink?")
array_push(idleThoughts, "Hmm... I wonder if\nI could write a\nbook about this...")
array_push(idleThoughts, "Hmm... The bathroom\ndidn't arrive in time.\nI hope noone noticed.")



var palette_array = global.CharacterPalette[global.playerCharacter].palettes

for (var i = 0; i < array_length(palette_array); i++)
{
	var key = palette_array[i].palName
	array_push(paletteThoughts, lang_get(string(key + "_thought")))
}

