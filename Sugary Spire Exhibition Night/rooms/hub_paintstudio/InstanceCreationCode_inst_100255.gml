if global.basement
	instance_destroy()

if global.betterw2
	targetRoom = hub_paintstudio2
else
	targetRoom = hub_molasses

if (global.GLOBAL_FUN == 66 && chance(1))
	targetRoom = hub_molassesB

sprite_index = lang_get_sprite(spr_hub_molassesdoor)
image_speed = 0.35

