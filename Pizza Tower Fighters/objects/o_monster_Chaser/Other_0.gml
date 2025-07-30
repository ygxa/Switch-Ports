if (state == monster_chase || state == monster_animatronic)
{
    instance_destroy();
    layer_set_visible("scarylayer", false);
    audio_stop_sound(su_alarm);
    audio_play_sound(su_fakepep_bodyslam_fn, 50, false);
}
