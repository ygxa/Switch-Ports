var reserved_gates = []
var available_critics = [spr_paintCritic_1, spr_paintCritic_2, spr_paintCritic_3, spr_paintCritic_4]

with (obj_paintcritic)
{
	var i = array_get_index(available_critics, sprite_index)
	
	if (i != -1)
	{
		array_delete(available_critics, i, 1)
		
		if (targetGate != -4)
			array_push(reserved_gates, targetGate)
	}
}

var lv = ""

with (instance_nearest(x, y, obj_startGate))
{
	lv = level
	other.targetGate = id
	
	if (array_contains(reserved_gates, id))
	{
		instance_destroy(other)
		return
	}
}

ini_open(global.SaveFileName)
var found_rank = string_lower(ini_read_string("Ranks", lv, ""))
fixed_ini_close()
if (found_rank == "" || instance_exists(obj_tutorialBlock))
	instance_destroy()

var si = irandom_range(0, array_length(available_critics) - 1)

if (lv == "tutorial")
{
	sprite_index = spr_grandpacone
	image_speed = 0.35
}
else
{
	sprite_index = available_critics[si]
}

var xo = (sprite_get_width(spr_npcbubble) / 2) + 16
var yo = (sprite_get_height(spr_npcbubble) / 2) + 16
textbubble = instance_create(x - ((abs(sprite_width / 2) + xo) * image_xscale), bbox_top - yo, obj_npcbubble)

with (textbubble)
{
	paintcriticid = other.id
	if (lv == "tutorial")
	{
		text = "That's right... I, Grandpa\n Cone, did quite\na good job, didn't I?"
		image_xscale = -other.image_xscale
	}
	else
	{
		var ass = array_get_index(other.criticArr, other.sprite_index) + 1
		text = string("democritic_" + string(ass) + "_" + string(found_rank))
		image_xscale = -other.image_xscale
		
		//critic 1
		if text = "democritic_1_d"
			text = "Ah... This painting\nbelongs in the trash..."
		if text = "democritic_1_c"
			text = "Ah... It's...\nsomething..."
		if text = "democritic_1_b"
			text = "Ah... It seems\nto insist upon itself..."
		if text = "democritic_1_a"
			text = "Ah... Interesting\nbrushwork..."
		if text = "democritic_1_s"
			text = "Ah... This piece is\ndelightfully abstract..."
		if text = "democritic_1_p"
			text = "Ah... I get it now!"
		
		//critic 2
		if text = "democritic_2_d"
			text = "Er... The Painter seems to\nhave missed a spot..."
		if text = "democritic_2_c"
			text = "Er... Looks weird..."
		if text = "democritic_2_b"
			text = "Er... What is this...\nSome Gum...?"
		if text = "democritic_2_a"
			text = "Er... This works..."
		if text = "democritic_2_s"
			text = "Er... It's rather\nerudite."
		if text = "democritic_2_p"
			text = "Er... It's too good,\neven for me!"
		
		//critic 3
		if text = "democritic_3_d"
			text = "Umm... Looks too...\n\"anime?\""
		if text = "democritic_3_c"
			text = "Umm... Would be better\nif The Painter\ndrew me instead!"
		if text = "democritic_3_b"
			text = "Umm... I could have\ndrawn this better..."
		if text = "democritic_3_a"
			text = "Umm... Interesting style,\nI suppose..."
		if text = "democritic_3_s"
			text = "Umm... The colors here\nare immaculate!"
		if text = "democritic_3_p"
			text = "Umm... I can't take my\neyes off this piece!"
		
		//critic 4
		if text = "democritic_4_d"
			text = "Oui... This thumb here\nappears to be backwards..."
		if text = "democritic_4_c"
			text = "Oui... A child could\ndraw this..."
		if text = "democritic_4_b"
			text = "Umm... I could have\ndrawn this better..."
		if text = "democritic_4_a"
			text = "Oui... It's \"fine\", but\nnot \"fine art\"..."
		if text = "democritic_4_s"
			text = "Oui... This piece is\nquite delectable..."
		if text = "democritic_4_p"
			text = "Oui... C'est trop beau\npour mes propres\nyeux!"
	}
}
