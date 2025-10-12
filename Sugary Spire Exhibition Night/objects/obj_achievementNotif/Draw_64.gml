if (sprite_index != lang_get_sprite(spr_paletteUnlock))
{
	draw_sprite(lang_get_sprite(spr_achievementText), 0, x, y)
	var _yy = y - 90
	
	if (sprite_index == spr_bakertasks_en_ranks)
		_yy -= 20
	
	draw_sprite(sprite_index, image_index, x, _yy)
}
else
{
	//draw_sprite(sprite_index, 0, x, (y - 80))
	var clothes = 0
	
	if clothingCharacter = "Painter Red"
		clothes = 3
	
	if clothingCharacter = "Painter Black"
		clothes = 4
	
	if clothingCharacter = "Painter Purple"
		clothes = 5
	
	if clothingCharacter = "Noise"
		clothes = 6
	
	if clothingCharacter = "Brainy Duds"
		clothes = 7
	
	if clothingCharacter = "Golden Brainy Duds"
		clothes = 8
	
	if clothingCharacter = "Notebook"
		clothes = 9
	
	if clothingCharacter = "Hazardous"
		clothes = 10
	
	if clothingCharacter = "Cotton Candy"
		clothes = 11
	
	if clothingCharacter = "Fred's Choice"
		clothes = 12
	
	if clothingCharacter = "Frog Pajamas"
		clothes = 13
		
	//draw_player_sprite(sprite_index, 0, x, (y - 80) + bump, clothingCharacter, index_from_paletteName(clothingCharacter, taskKey))
	draw_player_sprite(sprite_index, 0, x, (y - 80) + bump, global.playerCharacter, clothes)
}