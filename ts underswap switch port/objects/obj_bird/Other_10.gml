switch (room)
{
    case rm_star12:
        sfx_play_pitch(snd_chirp, random_range(0.8, 0.9));
        break;
    
    default:
        sfx_play(snd_chirp);
        break;
}

rate += 1;

if (rate >= 10)
{
    dx_scene("int.ruined15_birdabuse");
    rate = 0;
}
