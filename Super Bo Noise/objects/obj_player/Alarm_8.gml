if (state == 109)
{
    state = 2;
    movespeed = 0;
    
    if (scr_solid(x, y))
    {
        var ty = try_solid(0, 1, 312, 32);
        
        if (ty != -1)
            y += ty;
    }
}
else if (state == 198)
{
    state = 193;
    movespeed = 0;
}
