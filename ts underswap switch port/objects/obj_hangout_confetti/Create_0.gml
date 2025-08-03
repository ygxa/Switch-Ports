sfx_play(snd_dumbvictory);

for (var i = 0; i < 12; i++)
    instance_create_xy(x + xirandom_range(-12, 12), y + xirandom_range(0, 6), obj_confetti_shard);
