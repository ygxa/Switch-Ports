audio_stop_sound(sound_points);
scr_sound(58);
global.collect += 10;
global.pizzameter += 1;
create_small_number(x + 16, y + 16, "10");
global.combofreeze = 30;
global.combotime += 1;

with (instance_create(x, y, obj_collecteffect))
{
    sprite_index = other.sprite_index;
    choosed = true;
}

instance_destroy();
