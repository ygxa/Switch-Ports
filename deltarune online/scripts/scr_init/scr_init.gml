// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_init(){
	instance_create_depth(x,y,depth,obj_camera)
	room_goto(titlescreen)
	global.fc = 0;
	global.typer = 6;
	global.fe = 0;
	global.interact = 0;	
	global.flag = [0,1,2,3,4,5,6,7,8,9,10,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]
	global.textfont = font_add_sprite_ext(fnt_mainbig, "gyjqpW%#m&Mw$Q*\/XIohNc4xBG36Ant7Cefv51JTK0RHa09PU128izsb@?DVYFESLudrkZ+>}{<_ ~=-])[(! ^  :.l'", 1, 0);
	global.playerhp = 150
	global.battle = false
	
	enum network {
		join,
		latency,
		move,
		shoot,
		chat,
		disconnect
	}
}