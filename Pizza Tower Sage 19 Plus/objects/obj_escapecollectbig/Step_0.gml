if place_meeting(x,y,obj_destructibles) || place_meeting(x,y,obj_bigdestructibles) || place_meeting(x,y,obj_metalblock)
	visible = false
	
if !place_meeting(x,y,obj_destructibles) && !place_meeting(x,y,obj_bigdestructibles) && !place_meeting(x,y,obj_metalblock)
	visible = true
	
image_alpha = global.panic ? 1 : 0.5;
mask_index = global.panic ? spr_pizzacollect : spr_masknull;
