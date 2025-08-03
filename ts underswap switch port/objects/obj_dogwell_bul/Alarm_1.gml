dogState = 1;

if (asleep)
{
    sfx_play(snd_exclamation, 0.7);
    instance_create_xy(x - 5, y - 12, obj_exclamation_cosmetic);
}
