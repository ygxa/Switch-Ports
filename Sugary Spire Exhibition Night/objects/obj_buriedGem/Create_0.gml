scr_collision_init()
vsp = 0
grav = 0.5
hsp = 0
dugup = false
depth = 4
image_speed = 0.75
playerID = -4
gemPopID = string("{0}_gem_collectible", string(id))
random_set_seed(global.RandomSeed + x + y)
sprite_index = choose(spr_minesgem1, spr_minesgem2, spr_minesgem3, spr_minesgem4, spr_minesgem5)
random_set_seed(global.RandomSeed)
