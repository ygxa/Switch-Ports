pausedmusic = global.music;

if (global.panic == 1 && obj_pause.pause == 0 && room != timesuproom)
{
    if (!audio_is_playing(mu_escape))
    {
        audio_stop_all_music();
        global.music = scr_music(87);
        pausedmusic = 87;
    }
}
else if (global.panic == 0 && room == timesuproom)
{
    audio_stop_sound(global.music);
}

if (room != hub_room1 && room != outer_room2)
    fadeoff = audio_sound_get_track_position(global.music) / audio_sound_length(global.music);
else
    fadeoff = 0;

var _oldGummyBear = GummyBear;

if (instance_exists(obj_gummyharry) && !global.panic && audio_is_playing(global.harrymusic))
{
    with (obj_gummyharry)
        other.GummyBear = bbox_in_camera(view_camera[0]);
    
    if (_oldGummyBear != GummyBear)
    {
        switch (GummyBear)
        {
            case 0:
                audio_sound_gain(global.harrymusic, 0.25 * global.musicVolume, 2000);
                audio_sound_gain(global.music, global.musicVolume, 2000);
                break;
            
            case 1:
                audio_sound_gain(global.harrymusic, global.musicVolume, 2000);
                audio_sound_gain(global.music, 0.15 * global.musicVolume, 2000);
                break;
        }
    }
}
else if (!global.panic)
{
    audio_sound_gain(global.music, global.musicVolume, 2000);
    audio_sound_gain(global.harrymusic, 0, 2000);
    
    if (audio_sound_get_gain(global.harrymusic) <= 0)
        audio_stop_sound(global.harrymusic);
}
else
{
    audio_sound_gain(global.music, global.musicVolume, 0);
    audio_stop_sound(global.harrymusic);
}
