image_speed = 0.35
followQueue = ds_queue_create()
hsp = 0
vsp = 0
grav = 0.23
movespeed = 3
with (obj_player1)
{
    state = (86 << 0)
    sprite_index = spr_bossintro
    image_index = 0
}
sprite_index = spr_noisebomb_intro
instance_create(x, y, obj_taunteffect)
playerid = obj_player1
