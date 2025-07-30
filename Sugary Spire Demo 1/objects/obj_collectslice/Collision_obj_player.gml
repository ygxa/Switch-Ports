global.collect += 25;
global.combofreeze = 30;
global.combotime += 3;
create_small_number(x, y, "25");
audio_stop_sound(sound_points);
scr_sound(58);

repeat (3)
    instance_create((x + random_range(-5, 5)) - 16, (y + random_range(-5, obj_ridetest3)) - 16, obj_collecteffect);

instance_destroy();
