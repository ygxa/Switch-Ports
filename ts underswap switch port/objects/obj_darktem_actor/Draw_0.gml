if (forceShake)
{
    var _x = x;
    var _y = y;
    var _a = image_alpha;
    
    if (irandom(1) == 0)
    {
        x += irandom(1);
        y += irandom(1);
    }
    
    draw_self();
    x = _x;
    y = _y;
}
else if (shake && obj_overworldui.currentCharacter == talkChar)
{
    var _x = x;
    var _y = y;
    var _a = image_alpha;
    gpu_set_fog(true, c_white, 0, 0);
    
    if (irandom(1) == 0)
    {
        x += irandom(1);
        y += irandom(1);
    }
    
    image_alpha = _a * ((sin(siner) * 0.3) + 0.5);
    draw_self();
    image_alpha = _a;
    x = _x;
    y = _y;
    gpu_set_fog(false, c_black, 0, 0);
    
    if (irandom(1) == 0)
    {
        x += irandom(1);
        y += irandom(1);
    }
    
    draw_self();
    x = _x;
    y = _y;
    siner += 0.05;
    
    if (siner >= (2 * pi))
        siner -= (2 * pi);
}
else
{
    draw_self();
}
