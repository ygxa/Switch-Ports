var playerMoving = global.canmove && obj_player.steps != lastPlayerSteps;
var i = 0;
var n = array_length(playingInstances);

while (i < n)
{
    if (!audio_is_playing(playingInstances[i]))
    {
        array_delete(playingInstances, i, 1);
        i--;
        n--;
    }
    
    i++;
}

if (instance_exists(obj_battletransition))
{
    i = 0;
    n = array_length(playingInstances);
    
    while (i < n)
    {
        if (audio_is_playing(playingInstances[i]))
            audio_stop_sound(playingInstances[i]);
        
        i++;
    }
    
    array_resize(playingInstances, 0);
    global.emitter_sfx_special_bus.effects[0] = undefined;
    global.emitter_sfx_special_bus.effects[1] = undefined;
    global.emitter_sfx_special_bus.effects[2] = undefined;
    audio_emitter_position(global.emitter_sfx_special, 0, 0, 0);
    needToReinstateEffects = true;
}
else
{
    if (needToReinstateEffects)
    {
        global.emitter_sfx_special_bus.effects[0] = reverbEffect;
        global.emitter_sfx_special_bus.effects[1] = lpfEffect;
        global.emitter_sfx_special_bus.effects[2] = delayEffect;
        needToReinstateEffects = false;
    }
    
    if (instance_exists(obj_fader) && obj_fader.toSolid)
    {
        i = 0;
        n = array_length(playingInstances);
        
        while (i < n)
        {
            if (audio_is_playing(playingInstances[i]))
                audio_sound_gain(playingInstances[i], 0, 250);
            
            i++;
        }
        
        reverbEffect.mix = number_approach_linear(reverbEffect.mix, 0, 0.1);
        delayEffect.mix = number_approach_linear(delayEffect.mix, 0, 0.1);
    }
    else
    {
        reverbEffect.mix = number_approach_linear(reverbEffect.mix, 1, 0.1);
        delayEffect.mix = number_approach_linear(delayEffect.mix, 1, 0.1);
        var allowed = true;
        
        if (!playerMoving)
            allowed = false;
        
        if (global.areapopulations[global.currentarea] <= 0)
            allowed = false;
        
        with (obj_encounter_parent)
        {
            if (empty)
                allowed = false;
            
            if (obj_player.steps >= (requiredSteps - 30))
                allowed = false;
        }
        
        if (allowed)
        {
            with (obj_player)
            {
                if (place_meeting(x, y, obj_encounter_nozone))
                    allowed = false;
            }
        }
        
        if (array_length(playingInstances) > 0)
            allowed = false;
        
        timer--;
        
        if (!allowed && timer < 20)
            timer = 20;
        
        if (!allowed && timer > 180)
            timer = 180;
        
        if (timer <= 0)
        {
            timer = irandom_range(120, 360);
            var index = irandom(array_length(sounds) - 1);
            
            if (index == lastRand)
                index = (index + 1) % array_length(sounds);
            
            lastRand = index;
            var pos = audio_get_pan_position(random_range(-0.5, 0.5));
            audio_emitter_position(global.emitter_sfx_special, pos.x, pos.y, pos.z);
            var data = sounds[index];
            var snd = audio_play_sound_ext(
            {
                sound: data.sound,
                priority: 5,
                emitter: global.emitter_sfx_special,
                gain: data.gain
            });
            array_push(playingInstances, snd);
        }
    }
}

lastPlayerSteps = obj_player.steps;
