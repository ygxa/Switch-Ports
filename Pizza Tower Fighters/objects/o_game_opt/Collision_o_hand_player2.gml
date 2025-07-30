with (other)
{
    if (key_accept && (!instance_exists(O_Fade) && !other.goaway))
    {
        other.goaway = true;
        audio_play_sound(su_select, 50, false);
    }
}
