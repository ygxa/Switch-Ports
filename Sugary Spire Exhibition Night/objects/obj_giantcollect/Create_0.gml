collectvanish = false
collectboxid = -4
in_the_void = false
depth = 2
global.collected = 0
image_speed = 0.35
random_set_seed(global.RandomSeed + x + y)
image_index = irandom_range(0, image_number - 1)
sprite_index = choose(spr_giantcollect1, spr_giantcollect2, spr_giantcollect3, spr_giantcollect4)
random_set_seed(global.RandomSeed)
