image_speed = 0.1
movebuffer = 50
tgt_x = x
tgt_y = y
depth = 120
range = 100
var _seed = global.RandomSeed
random_set_seed(xstart + (ystart * 2))
type = choose(0, 1)
random_set_seed(_seed)
idle_spr = type ? spr_firefly1 : spr_firefly2
taunt_spr = type ? spr_firefly1_taunt : spr_firefly2_taunt
lightIndex = 4
yoffset = wave(-3, 3, 3, 60)
