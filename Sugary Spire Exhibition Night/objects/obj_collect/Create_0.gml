collectvanish = false
collectboxid = -4
use_palette = true
in_the_void = false
depth = 2
random_set_seed(global.RandomSeed + x + y)
image_index = irandom_range(0, image_number - 1)
col = irandom_range(1, 5)
sprite_index = choose(spr_collect1, spr_collect2, spr_collect3, spr_collect4, spr_collect5)
random_set_seed(global.RandomSeed)
image_speed = 0.35
image_alpha = 1
escape = false
global.collected = 0
gotowardsPlayer = false
movespeed = 0
