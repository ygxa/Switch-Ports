if (!active){
	textletter = 0
	exit;
}
	
input_speed = input_check("jump") || input_check("up")
input_advance = input_check_pressed("jump") || input_check_pressed("up")
ass += 0.05
var painter_sprites = ds_map_find_value(painterExpressionMap, painterMood)
var text = dialogEvents[dialogCurrent]

//disappointing
if text = "Honestly, I'm not sure why you bothered showing up in the first place..."
	painterMood = "upset"

//fine
if text = "It was... adequate, je suppose"
	painterMood = "normal"
if text = "But did you not also sense something more to my paintings? It saddens me that you failed to fully appreciate their depth."
	painterMood = "upset"
if text = "Regardless, confiseur, you performed acceptably..."
	painterMood = "devious"

//perfect
if text = "Not only have you returned all of my precious INK, but you did it with such showmanship too!"
	painterMood = "devious"
if text = "I'm sure you're quite happy too, no?  Don't think I didn't see you lining your pockets while you were busy \"admiring\" my paintings!"
	painterMood = "normal"
if text = "Ha! I jest. You earned it, confiseur. Your performance tonight was beyond reproach!"
	painterMood = "devious"

//fast
if text = "You haven't given me enough time to think about it! I feel that-"
	painterMood = "devious"
if text = "Quit looking at your timepiece, you blasted thing!"
	painterMood = "upset"
if text = "You ought to slow down a little now and then, it might do you some good."
	painterMood = "normal"

//holyshit
if text = "Mon Dieu, my expectations for you have been completely and utterly surpassed!"
	painterMood = "surprised"
if text = "Magnifique! Fantastique! Confiseur, for you I have no more words!"
	painterMood = "devious"
if text = "If only the others could appreciate my art the way you do. C'est la vie..."
	painterMood = "upset"

var newtext = string_replace_all(text, " ", "        ");

if (textletter < string_length(newtext)) {
	textletter = min(textletter + textspeed, string_length(newtext))
	while (textletter < string_length(newtext) && string_char_at(newtext, textletter) == " ") {
		textletter++
	}
	
	var voices = [snd_brainter1, snd_brainter2, snd_brainter3, snd_brainter4, snd_brainter5, snd_brainter6, snd_brainter7, snd_brainter8]
	var talk = irandom(array_length(voices) - 1);
	var fuck = false
	for (var i = 0; i < array_length(voices); i++) {
		if (audio_is_playing(voices[i])){
			fuck = true;
			break;
		}
	}

	if fuck = false && chatty
		audio_play_sound(array_get(voices, talk), 1,0)

	chatty = true
}
else
	chatty = false


if (is_struct(painter_sprites))
{
	if (chatty)
	{
		sprite_index = painter_sprites.talkspr
		image_speed = 0.15
	}
	else
	{
		sprite_index = painter_sprites.idlespr
		
		if (sprite_index != spr_brainpainteridle)
		{
			image_speed = 0
			image_index = 0
		}
		else
		{
			image_speed = 0.15
		}
	}
}

switch (progression)
{
	case 0:
		targetpos.x = xstart
		targetpos.y = ((camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])) - sprite_height) + 4
		
		if (point_distance(x, y, targetpos.x, targetpos.y) <= 0)
		{
			progression = 1
			chatty = true
			textletter = 0
		}
		
		break
	
	case 1:
		typist.in(1, 0)
		targetpos.x = xstart + (60 * sin(global.CurrentTime / 1000))
		targetpos.y = ((camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])) - sprite_height) + 4
		
		if (input_advance && chatty = false)
			event_user(0)
			
		if (input_speed && chatty = true)
			textspeed = 1
		else
			textspeed = 0.5

		break
	
	case 2:
		sprite_index = spr_brainpainteridle
		textletter = 0
		if (!obj_painterhand.visible)
		{
			obj_painterhand.x = targetPlayer.bbox_right
			obj_painterhand.y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 32
			obj_painterhand.visible = true
		}
		else if (obj_painterhand.y > (targetPlayer.y - 32))
		{
			obj_painterhand.y -= 3
		}
		else if (flickpwr < 10)
		{
			if (!sounded)
			{
				event_play_oneshot("event:/SFX/general/painterflick")
				sounded = 1
			}
			
			flickpwr += 0.5
			obj_painterhand.x = lerp(obj_painterhand.x, targetPlayer.bbox_right - 55, 0.3) + random_range(-flickpwr, flickpwr)
			obj_painterhand.y = (targetPlayer.y - 32) + random_range(-flickpwr, flickpwr)
		}
		else
		{
			event_play_oneshot("event:/SFX/player/punch", targetPlayer.x, targetPlayer.y)
			event_play_oneshot("event:/SFX/general/painterflickflying")
			instance_create(targetPlayer.x, targetPlayer.y, obj_bangEffect)
			obj_painterhand.sprite_index = spr_brainpainterhandflick
			finished = true
			targetPlayer.ystart = targetPlayer.y
			progression = 3
			scr_task_notify("Brainy Duds")
			scr_task_notify("Golden Brainy Duds")
			
			with (obj_music)
			{
				if (!is_undefined(global.RoomMusic))
				{
					fmod_studio_event_instance_stop(global.RoomMusic.musicInst, true)
					fmod_studio_event_instance_stop(global.RoomMusic.secretMusicInst, true)
				}
			}
		}		
		break
}

if (progression == 0)
{
	var dir = point_direction(x, y, targetpos.x, targetpos.y)
	x += ceil(lengthdir_x(movespeed, dir))
	y += ceil(lengthdir_y(movespeed, dir))
}
else
{
	x = approach(x, targetpos.x, movespeed)
	y = approach(y, targetpos.y, movespeed)
}
