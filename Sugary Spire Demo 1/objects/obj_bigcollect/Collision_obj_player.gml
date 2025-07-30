audio_stop_sound(sound_points);
scr_sound(58);
global.collect += 100;
global.pizzameter += 5;
scr_queue_tvanim(467, 50);
create_small_number(x, y, "100");
global.combofreeze = 30;
global.combotime += 5;

repeat (5)
    instance_create((x + random_range(-32, 32)) - 16, (y + random_range(-32, obj_sluggyparry)) - 16, obj_collecteffect);

instance_destroy();
