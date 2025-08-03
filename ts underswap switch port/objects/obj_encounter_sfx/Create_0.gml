sounds = [
{
    sound: snd_woodcry,
    gain: 0.6
}, 
{
    sound: snd_woodhurt,
    gain: 0.6
}, 
{
    sound: snd_mordaxcry,
    gain: 0.8
}, 
{
    sound: snd_mordaxhurt,
    gain: 0.7
}];
lastRand = -1;
playingInstances = [];
timer = 120;
lastPlayerSteps = undefined;
fadeOutSfx = false;
needToReinstateEffects = false;
reverbEffect = audio_effect_create(AudioEffectType.Reverb1);
reverbEffect.size = 0.85;
reverbEffect.damp = 1;
global.emitter_sfx_special_bus.effects[0] = reverbEffect;
lpfEffect = audio_effect_create(AudioEffectType.LPF2);
lpfEffect.cutoff = 4000;
global.emitter_sfx_special_bus.effects[1] = lpfEffect;
delayEffect = audio_effect_create(AudioEffectType.Delay);
delayEffect.time = 0.4;
delayEffect.feedback = 0.3;
global.emitter_sfx_special_bus.effects[2] = delayEffect;

deleteSound = function(argument0)
{
    var index = array_find_index(sounds, method(
    {
        soundAsset: argument0
    }, function(argument0)
    {
        return argument0.sound == soundAsset;
    }));
    
    if (index != -1)
        array_delete(sounds, index, 1);
};
