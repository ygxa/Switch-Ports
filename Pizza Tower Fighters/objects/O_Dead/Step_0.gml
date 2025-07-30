timerfordust -= 4;

if (timerfordust == 0)
{
    timerfordust = timerfordustmax;
    instance_create_layer(x, y, layer, o_cloudeffect);
}
