if (global.hazards != 0)
{
    with (other)
    {
        if (hp < hpmax)
        {
            if (other.soundeffect == 0)
            {
                audio_play_sound(su_ratboy, 50, false);
                other.soundeffect = 9;
                hp += 1;
            }
            else
            {
                other.soundeffect--;
            }
        }
    }
}
