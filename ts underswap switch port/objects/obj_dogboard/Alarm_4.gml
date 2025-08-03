cutscene = true;
var f = instance_create(obj_fader);
f.fadeSpeed = 0.006060606060606061;
f.color = 16777215;
f.destroy = false;
sfx_play(snd_cymbal);

if (!is_undefined(global.soundstore) && audio_is_playing(global.soundstore))
    audio_sound_gain(global.soundstore, 0, 500);

alarm[7] = 60;
alarm[8] = 120;
