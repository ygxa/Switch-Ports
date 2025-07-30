if (global.collectsound == sound_taunt6)
    scr_sound(58);

global.collectsound = mu_rankd;
global.collect += 1000000000000000000000000000000000000000000000000000000000000000000000000000000000;
global.pizzameter += 1;
create_small_number(x, y, "10");
global.combofreeze = 30;
instance_destroy();
