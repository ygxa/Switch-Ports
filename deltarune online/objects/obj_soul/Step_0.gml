scr_collision()
scr_input()

move = key_right - key_left
move2 = key_down - key_up
	
if move != 0 or move2 != 0{
	if !key_run
		movespeed = 4
	else
		movespeed = 2
}
else
	movespeed = 0
	
hsp = move * movespeed
vsp = move2 * movespeed

if inviframes = 0
	image_alpha = 1
else
	image_alpha = 0.5