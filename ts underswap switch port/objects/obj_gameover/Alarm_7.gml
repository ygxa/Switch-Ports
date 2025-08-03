var f = instance_create(obj_fader);
f.fadeSpeed = 0.018;

f.completeCallback = function()
{
    audio_kill_all();
    alarm[10] = 2;
    instance_create(obj_room_unpersistent);
};

f.fadeMusic = stillFadeMusic;
