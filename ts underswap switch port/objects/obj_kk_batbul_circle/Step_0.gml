event_inherited();

if (timer == 30)
{
    gravity = 0;
    speed = 0;
    direction += 180;
    ybob = y;
    circleY = ybob;
    state = 1;
}
else if (timer > 30 && timer <= 44)
{
    y = number_approach_smooth(y, circleY + 175, 0.5, 0.005);
    ybob = y;
}
else if (timer == (swoopTime - 30))
{
    image_blend = c_white;
}
else if (timer == swoopTime)
{
    speed = 6;
    state = 2;
    alarm[1] = 40;
    sfx_play_pitch(snd_realsqueak, pitch);
}

if (state == 1)
    y = ybob + (10 * sin(siner));

siner += 0.25;
timer++;
