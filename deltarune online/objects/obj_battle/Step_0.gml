scr_input()

if !instance_exists(baddieid)
	turn = "end"

switch turn{
	case "intro":
		scr_battleintro()
	break;
	
	case "playerselect":
		scr_battleplayerselect()
	break;	
	
	case "playerattack":
		scr_battleplayerattack()
	break;		
	
	case "enemyattack":
		scr_battleenemyattack()
	break;	
	
	case "end":
		scr_battleeend()
	break;	
}

if obj_player.x = playerx && obj_player.y = playery && baddieid.x = baddiex && baddieid.y = baddiey && obj_player.sprite_index = spr_krisb_idle && turn = "intro"{
	turn = "playerselect"
}

drawx += 1
drawy += 1