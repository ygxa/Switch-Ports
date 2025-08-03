var f = instance_create(obj_fader);
f.fadeSpeed = 0.02;

f.completeCallback = function()
{
    audio_kill_all();
    alarm[9] = 2;
    instance_create(obj_room_unpersistent);
};

f.fadeMusic = true;
f.destroy = false;

if (!permadeath)
    alarm[8] = 5;
