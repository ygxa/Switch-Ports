if (forceEnd || obj_battlemanager.mainState != (7 << 0))
{
    if (alpha > 0)
        alpha -= spd;
    
    if (alpha <= 0)
    {
        instance_destroy();
        exit;
    }
}
else
{
    if (alpha < maxAlpha)
        alpha += spd;
    
    if (alpha > maxAlpha)
        alpha = maxAlpha;
}

obj_battlemanager.darkenAlpha = alpha;
