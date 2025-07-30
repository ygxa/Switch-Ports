function scr_queue_tvanim(spr = noone,buffer = 150) 
{
	with (obj_tv)
	{
		if (expressionsprite != spr && spr != idletvspr)
		{
			expressionsprite = spr
			draw_static = true
			state = states.tv_transition
			static_index = 0
			expressiontime = buffer
		}
	}
}


function scr_forceplay_tvanim(argument0 = noone,argument1 = 150) 
{
	///@param sprite_index
	///@param anim_length
	obj_tv.tvsprite = ds_queue_dequeue(argument0);
	obj_tv.tvlength = ds_queue_dequeue(argument1);
	ds_queue_clear(global.newhudtvanim);
}


function scr_queue_message(argument0 = "", argument1 = noone) {
	///@param string
	///@param insert_sprite_here_to_activate_talkingsprs
	ds_queue_enqueue(global.newhudmessage,argument0);
	//ds_queue_enqueue(global.newhudmessage,argument1);
	if argument1 != noone
		scr_queue_tvanim(argument1, 1000)
}


function scr_controlprompt(prompt = "[spr_promptfont]No prompt set", save = prompt)
{
	var time = string_length(prompt) * 15
	time = clamp(time, 60, 450)
	var type = 0
	if (save == -4) type = 1
	if (save == -1) type = 2
	with obj_tv {
		if type != 2 {
			if !ds_list_find_index(global.saveroom, save) || type == 1 {
				controlprompt = prompt
				prompt_timer = time 
				ds_list_add(global.saveroom, save)
			}
		} else {
			controlprompt = prompt
			prompt_timer = 2
			
		}
	}
	return
}