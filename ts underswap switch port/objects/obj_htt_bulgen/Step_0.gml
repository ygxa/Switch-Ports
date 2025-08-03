if (intensity >= 0.5 && !startedBullets)
{
    alarm[0] = max(1, 30 - floor(intensity));
    startedBullets = true;
}
