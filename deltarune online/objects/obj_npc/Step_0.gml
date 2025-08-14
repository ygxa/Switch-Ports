if place_meeting(x,y,obj_player) || place_meeting(x+10,y,obj_player) || place_meeting(x-10,y,obj_player) || place_meeting(x,y+10,obj_player) || place_meeting(x,y-10,obj_player){
	if (obj_player.key_select) {
		if (chatpart == 0) {
			state = "chat"
			chatpart = 1
			global.interact = 1
			obj_player.hsp = 0
			obj_player.vsp = 0
			obj_player.image_index = 0
			obj_player.image_speed = 0	
			obj_player.movespeed = 2
		} else {
			if (textletter < string_length(text)) {
				exit
			}
			chatpart++
			textletter = 0
			var temptext = "text" + string(chatpart)
			if (variable_instance_exists(id, temptext)) {
				text = variable_instance_get(id, temptext)
			} else {
				text = ""
			}
			if (text == "") {
				state = "normal"
				global.interact = 0
				textletter = 0
				chatpart = 0
				text = text1
			}
		}
	}
}

if (state == "chat") {
	if obj_player.key_run2 && textletter < string_length(text){
		textletter = string_length(text)
		audio_play_sound(snd_text,1,0)	
	}
		
	if (textletter < string_length(text)){
		textletter = min(textletter + textspeed, string_length(text))
		audio_play_sound(snd_text,1,0)
	}
}
