if ((step % 2) == 0)
    wickIndex = !wickIndex;

if (step > 60)
    wickY = number_approach_smooth(wickY, 7, 0.05, 0.05);

if (step == 70 || step == 75 || step == 80)
{
    sfx_play_pitch(snd_alert, pitch, 80);
    pitch += 0.25;
}

if (step == 85)
    event_user(2);

step++;
