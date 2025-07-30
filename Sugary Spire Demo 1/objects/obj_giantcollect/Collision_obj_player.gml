audio_stop_sound(sound_points);
audio_stop_sound(sound_pizzacoin);
scr_sound(56);
scr_sound(58);
global.collectsound = mu_rankd;
scr_queue_tvanim(467, 200);
global.collect += 1000;
global.pizzameter += 5;
create_small_number(x, y, "1000");
global.combofreeze = 30;
global.combotime = 60;

repeat (15)
    instance_create((x + random_range(-60, 60)) - 16, (y + random_range(-60, obj_gumbobprojectile)) - 16, obj_collecteffect);

instance_destroy();
