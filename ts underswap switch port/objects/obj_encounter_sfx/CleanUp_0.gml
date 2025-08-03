var i = 0;
var n = array_length(playingInstances);

while (i < n)
{
    if (audio_is_playing(playingInstances[i]))
        audio_stop_sound(playingInstances[i]);
    
    i++;
}

if (global.emitter_sfx_special_bus != undefined)
{
    global.emitter_sfx_special_bus.effects[0] = undefined;
    reverbEffect = undefined;
    global.emitter_sfx_special_bus.effects[1] = undefined;
    lpfEffect = undefined;
    global.emitter_sfx_special_bus.effects[2] = undefined;
    delayEffect = undefined;
}

if (global.emitter_sfx_special != undefined)
    audio_emitter_position(global.emitter_sfx_special, 0, 0, 0);
