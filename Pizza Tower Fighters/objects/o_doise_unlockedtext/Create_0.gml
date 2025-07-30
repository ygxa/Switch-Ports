hoverSpeed = 0.1;
hoverHeight = 10;
original_y = y;
time = 0;
global.doiseun = 1;

with (obj_savesystem)
{
    dirty = 1;
    afterarcade = true;
}

audio_play_sound(mu_doiseunlocked, 50, false);
