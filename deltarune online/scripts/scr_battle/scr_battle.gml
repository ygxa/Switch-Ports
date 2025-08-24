// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_battleintro(){
	with obj_player{
		x = approach(x, other.playerx, 20)
		y = approach(y, other.playery, 20)

		if x = other.playerx && y = other.playery && sprite_index != spr_krisb_attackready && sprite_index != spr_krisb_idle
			sprite_index = spr_krisb_attackready

		if sprite_index = spr_krisb_attackready && sprite_animation_end(){
			sprite_index = spr_krisb_idle
		}
	}

	with baddieid{
		x = approach(x, other.baddiex, 20)
		y = approach(y, other.baddiey, 20)
	}
}

function scr_battleplayerselect(){
	if key_left2 && selection != 0
		selection --
		
	if key_right2 && selection != 3
		selection ++
	
	if selection = 0 && key_select{
		obj_player.image_index = 0
		obj_player.sprite_index = spr_krisb_attack		
		turn = "playerattack"
	}
}

function scr_battleplayerattack(){
	with obj_player{
		if sprite_animation_end(obj_player.sprite_index){
			other.turn = "enemyattack"
			randomize()
			other.baddieid.hp -= irandom_range(30,60)
			sprite_index = spr_krisb_idle
		}
	}
}


function scr_battleeend(){
	obj_player.x = approach(obj_player.x, savedplayerx, 20)
	obj_player.y = approach(obj_player.y, savedplayery, 20)	
	
	if obj_player.x = savedplayerx && obj_player.y = savedplayery{
		instance_destroy()	
		instance_destroy(obj_solid)	
		instance_destroy(obj_battleback)	
		instance_destroy(obj_soul)
		global.battle = false
		global.interact = 0
	}
}

function scr_battleenemyattack(){
	if !instance_exists(obj_soul)
		instance_create_depth(obj_camera.view_width/2+obj_camera.camera_x,obj_camera.view_height/2+obj_camera.camera_y+100,obj_player.depth,obj_soul)
	
	if !instance_exists(obj_solid){
		with instance_create_depth(obj_camera.view_width/2+obj_camera.camera_x-105,obj_camera.view_height/2+obj_camera.camera_y+20,1,obj_solid)	
			image_yscale = 5
			
		with instance_create_depth(obj_camera.view_width/2+obj_camera.camera_x+75,obj_camera.view_height/2+obj_camera.camera_y+20,1,obj_solid)	
			image_yscale = 5
				
		with instance_create_depth(obj_camera.view_width/2+obj_camera.camera_x-70,obj_camera.view_height/2+obj_camera.camera_y-5,1,obj_solid)	
			image_xscale = 5
	
		with instance_create_depth(obj_camera.view_width/2+obj_camera.camera_x-70,obj_camera.view_height/2+obj_camera.camera_y+170,1,obj_solid)	
			image_xscale = 5
	}
	
	switch baddiemove{
		case "chomp":
			if alarm_get(0) = -1 && alarm_get(1) = -1{
				projectile = obj_chompmove
				alarm[1] = 20
				show_debug_message("wario from wario world!!!")
			}
		break;
		
	}
		
}