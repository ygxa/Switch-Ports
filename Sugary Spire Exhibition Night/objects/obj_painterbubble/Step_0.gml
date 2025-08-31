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

image_alpha = fade

if paletteThoughts = false{
	textletter = 9999
	idleThought = irandom_range(0, array_length(idleThoughts) - 1)	
}

with obj_paletteChangerMirror{
	if !place_meeting(x,y,obj_player1) && other.fade = 0{
		other.buffering = false
		other.usePaletteThought = false
		other.textletter = string_length(other.idleThoughts[other.idleThought])
		other.idleThought = irandom_range(0, array_length(other.idleThoughts) - 1)
	}
}
if (global.PlayerPaletteIndex != savedPaletteIndex)
{
	savedPaletteIndex = global.PlayerPaletteIndex
	usePaletteThought = true
	buffering = true
	bufferCooldown = 0
	textletter = 0
}

if (bufferCooldown > 0)
{
	bufferCooldown--
	
	if (bufferCooldown <= 0)
	{
		buffering = false
		
		if (usePaletteThought)
		{
			usePaletteThought = false
			buffering = true
			bufferCooldown = 180
			textletter = 0
		}
	}
	
	//if (usePaletteThought)
		//typist.skip()
}
else if buffering && textletter > string_length(txt)
{
	//typist.skip()
	bufferCooldown = 180
}


if (textletter < string_length(txt)) {
	textletter = min(textletter + textspeed, string_length(txt))
	while (textletter < string_length(txt) && string_char_at(txt, textletter) == " ") {
		textletter++
	}
}
