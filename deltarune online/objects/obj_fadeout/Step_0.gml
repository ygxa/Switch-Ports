if fadein = false{
	alpha += 0.1
	if (alpha = 1)
	{
	    fadein = true
		room_goto(targetRoom)
	}
}

if fadein = true{
	alpha -= 0.1
	if (alpha = 0)
		instance_destroy()
}