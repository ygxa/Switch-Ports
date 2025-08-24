with instance_create_depth(x,y,depth,obj_battle){
	baddieid = other.id
	baddiemove = other.move
	savedplayerx = obj_player.x
	savedplayery = obj_player.y
}
	
global.battle = true
global.interact = 1
obj_player.vsp = 0
obj_player.hsp = 0
obj_player.movespeed = 0
obj_player.image_xscale = 1
image_xscale = -1