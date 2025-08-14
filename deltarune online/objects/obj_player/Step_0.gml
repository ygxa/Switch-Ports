scr_input()
scr_collision()

if global.interact != 0
	exit;

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
	movespeed = 2
}
else{
	if !key_run
		image_speed = 0.10;
	else
		image_speed = 0.15;
}

if movev = -1{
	sprite_index = spr_up
	facing = 2	
}
if movev = 1{
	sprite_index = spr_down
	facing = 0	
}
if move = 1{
	sprite_index = spr_right
	facing = 3		
}
if move = -1{
	sprite_index = spr_left
	facing = 1
}

hsp = move * movespeed
vsp = movev * movespeed


if keyboard_check_pressed(vk_escape){	
	character ++
	scr_changecharacter()
}

if !instance_exists(obj_client)
	exit;

var buff = buffer_create(32, buffer_grow, 1);
buffer_seek(buff, buffer_seek_start, 0);
buffer_write(buff, buffer_u8, network.move);
buffer_write(buff, buffer_u16, my_id);
buffer_write(buff, buffer_s16, x);
buffer_write(buff, buffer_s16, y);
buffer_write(buff, buffer_s16, sprite_index);
buffer_write(buff, buffer_s16, image_index);
network_send_packet(obj_client.client, buff, buffer_tell(buff));
buffer_delete(buff);
