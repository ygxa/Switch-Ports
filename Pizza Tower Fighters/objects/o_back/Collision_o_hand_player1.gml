with (other)
{
    if (key_accept && (!instance_exists(O_Fade) && !other.goaway))
    {
        other.goaway = true;
        audio_play_sound(su_deselect, 50, false);
    }
}
