collectvanish = false
collectboxid = -4
use_palette = true
in_the_void = false
col = 0
depth = 2
global.collected = 0
random_set_seed(global.RandomSeed + x + y)
image_index = irandom_range(0, image_number - 1)
sprite_index = spr_bigcollectclock
random_set_seed(global.RandomSeed)
image_speed = 0.35
gotowardsPlayer = false
laughing = false
