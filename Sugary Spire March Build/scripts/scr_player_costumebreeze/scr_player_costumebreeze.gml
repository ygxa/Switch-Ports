// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function state_player_costumebreeze(){
	hsp = (xscale * move)
	move = (key_left + key_right)
	movespeed = approach(movespeed, 0, 0.2)
	breezecooldown--
	if breezecooldown <= 0 || movespeed == 0
		state = states.costumenormal
	
		
		
		
}