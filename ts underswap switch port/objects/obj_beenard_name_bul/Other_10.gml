sfx_play(snd_ding, 80, false);
ds_map_set(global.flags, "bee_name", nameIdx);

with (obj_beenard_monster)
    resetName();

alarm[0] = 30;
