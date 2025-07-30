if (mouse_check_button(mb_left) && (!instance_exists(O_Fade) && !goaway))
{
    goaway = true;
    audio_play_sound(su_deselect, 50, false);
}
