if (dir == 1 || dir == 0)
{
    bullets = array_create(16, -4);
    var count = 0;
    var nofreeze = 0;
    var rangeStart, rangeEnd;
    
    if (room == rm_star22_chase1)
    {
        rangeStart = 5;
        rangeEnd = 15;
        count = 2;
    }
    else
    {
        if (room == rm_ruins3 || room == rm_ruins4)
            count = 1;
        
        rangeStart = 0;
        rangeEnd = 15;
    }
    
    var i = irandom_range(rangeStart, rangeEnd);
    
    while (count < 8 && nofreeze < 50)
    {
        nofreeze++;
        
        if (bullets[i] != -4)
        {
            i = irandom_range(rangeStart, rangeEnd);
            continue;
        }
        
        var inst = instance_create_xy(x + 5 + (i * 20), y, object);
        
        if (room == rm_star22_chase1)
            inst.x -= 5;
        
        inst.dir = dir;
        bullets[i] = inst;
        count++;
        i = irandom_range(rangeStart, rangeEnd);
    }
}
else
{
    bullets = array_create(12, -4);
    var count = 0;
    var nofreeze = 0;
    var i = irandom(11);
    
    while (count < 5 && nofreeze < 50)
    {
        nofreeze++;
        
        if (bullets[i] != -4)
        {
            i = irandom(11);
            continue;
        }
        
        var inst = instance_create_xy(x, y + 5 + (i * 20), object);
        inst.dir = dir;
        bullets[i] = inst;
        count++;
        i = irandom(11);
    }
}

sfx_play(snd_sparkle);
