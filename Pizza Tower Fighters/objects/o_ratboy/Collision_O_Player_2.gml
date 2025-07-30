if (global.hazards != 0)
{
    with (other)
    {
        if (hp < hpmax)
        {
            if (other.soundeffect == 0)
            {
                audio_play_sound(su_ratboy, 50, false);
                hp += 1;
                other.soundeffect = 9;
            }
            else
            {
                other.soundeffect--;
            }
        }
    }
}
