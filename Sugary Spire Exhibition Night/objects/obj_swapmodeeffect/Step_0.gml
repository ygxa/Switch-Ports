
obj_swapmodefollow.visible = false
obj_player1.vsp = 0;
obj_player1.state = PlayerState.actor;
obj_player1.hsp = 0;
obj_player1.movespeed = 0;
playerx = approach(playerx, dest_x, speedx);
playery = approach(playery, dest_y, speedy);
playerindex += 0.35;
if playerx = dest_x{
	instance_destroy()	
	with obj_player1
		scr_taunt_setVariables()
		
	if global.playerCharacter = Characters.Pizzano{
		global.playerCharacter = Characters.Pizzelle
		obj_swapmodefollow.visible = true
		with obj_player1
			scr_characterSprite()
		exit;	
	}
			
	if global.playerCharacter = Characters.Pizzelle{
		global.playerCharacter = Characters.Pizzano
		obj_swapmodefollow.visible = true
		with obj_player1
			scr_characterSprite()
		exit;		
	}
}
