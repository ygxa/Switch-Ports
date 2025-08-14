if inviframes = 0{
	global.playerhp -= damageloss
	damageloss = 0
	inviframes = 1
	alarm[0] = 60
}