with (obj_arcadepep)
{
    var _diff = global.ArcadeDiffictulty;
    
    if (_diff < 0)
        _diff = 0;
    
    y -= (_diff * 90);
    yoff = _diff * 90;
}

global.ArcadeDiffictulty++;
var diff = global.ArcadeDiffictulty;

if (!audio_is_playing(mu_elevator))
    audio_play_sound(mu_elevator, 1, false);

with (obj_towerarcadeicon)
{
    if (num < (diff - 1))
        instance_destroy();
}
