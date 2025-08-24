scr_input()
scr_collision()


var move = key_right - key_left
var movev = key_down - key_up

if key_run{
	movespeed = approach(movespeed, 3, 0.1)
}
else{
	movespeed = approach(movespeed, 2, 0.1)
}

if move = 0 && movev = 0{
	image_index = 0
	image_speed = 0	
}
else
	image_speed = 0.10;

if movev = -1
	sprite_index = spr_krisup
if movev = 1
	sprite_index = spr_krisdown
if move = 1
	sprite_index = spr_krisright
if move = -1
	sprite_index = spr_krisleft

hsp = move * movespeed
vsp = movev * movespeed