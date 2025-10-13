if place_meeting(x,y,obj_destructibles) || place_meeting(x,y,obj_bigdestructibles) || place_meeting(x,y,obj_metalblock)
	visible = false
	
if !place_meeting(x,y,obj_destructibles) && !place_meeting(x,y,obj_bigdestructibles) && !place_meeting(x,y,obj_metalblock)
	visible = true