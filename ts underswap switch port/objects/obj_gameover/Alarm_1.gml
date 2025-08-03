backLayerAlpha += 0.08;
backLayerYOff /= 1.75;

if (backLayerAlpha >= 1)
{
    alarm[2] = 15;
    backLayerAlpha = 1;
    backLayerYOff = 0;
}
else
{
    alarm[1] = 4;
}
