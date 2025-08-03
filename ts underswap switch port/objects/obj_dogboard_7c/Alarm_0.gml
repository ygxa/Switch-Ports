sprite_index = spr_dogboard_wakeup;
doShake(1);
instance_create_xy(x + 9, y - 8, obj_exclamation_cosmetic);
sfx_play(snd_exclamation);
alarm[1] = 30;
