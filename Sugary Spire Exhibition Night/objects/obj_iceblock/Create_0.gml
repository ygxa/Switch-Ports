scr_collision_init()
event_perform_object(obj_parent_enemy, ev_create, 0)
state = PlayerState.frozen
canBeStomped = false
canBeGrabbed = false
content = -4
movespeed = 0
baddieID = -4
mach2Bumpable = true
vsp = 50
scr_collision()
starting_image_xscale = image_xscale
