function positionPlayer(targetDoor)
{
	var player = obj_player
	
	switch targetDoor
	{
		case "A":
			if !instance_exists(obj_doorA)
				exit;
			if player.hallwayxscale != 0{
				player.x = obj_doorA.x + 16 * obj_player.hallwayxscale
				player.y = obj_doorA.y - 30
			}
			else{
				player.x = obj_doorA.x + 2
				player.y = obj_doorA.y + 40 * obj_player.hallwayyscale					
			}
			break
		case "B":
			if !instance_exists(obj_doorB)
				exit;
			if player.hallwayxscale != 0{
				player.x = obj_doorB.x + 16 * obj_player.hallwayxscale
				player.y = obj_doorB.y - 30
			}
			else{
				player.x = obj_doorB.x + 2
				player.y = obj_doorB.y + 40 * obj_player.hallwayyscale								
			}
			break
		case "C":
			if !instance_exists(obj_doorC)
				exit;
			if player.hallwayxscale != 0{
				player.x = obj_doorC.x + 16 * obj_player.hallwayxscale
				player.y = obj_doorC.y - 30
			}
			else{
				player.x = obj_doorC.x + 2
				player.y = obj_doorC.y + 40 * obj_player.hallwayyscale							
			}
			break
		case "S":
			if !instance_exists(obj_doorS)
				exit;
			player.x = obj_doorS.x
			player.y = obj_doorS.y
			break
	}
}

function change_room(_room, _door = "A"){
	if !instance_exists(obj_fadeout){
		with instance_create(x,y,obj_fadeout){
			targetDoor = _door
			targetRoom = _room
		}
	}	
}