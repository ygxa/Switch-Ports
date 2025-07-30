if (!audio_is_playing(mu_elevator))
    audio_play_sound(mu_elevator, 1, true);

audio_sound_gain(mu_elevator, 1, 0);

if (audio_is_playing(mu_boogiewoogie))
    audio_stop_sound(mu_boogiewoogie);
