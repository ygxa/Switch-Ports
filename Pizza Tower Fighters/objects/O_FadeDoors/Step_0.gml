if (shake > 0)
    shake -= 0.1;

if (shake2 > 0)
    shake2 -= 0.1;

if (shake3 > 0)
    shake3 -= 0.1;

fadealpha += (0.01 * fadedir);

if (fadealpha > 1)
    fadealpha = 1;

if (!closed || opening)
{
    door1x += dooracc;
    door2x -= dooracc;
    dooracc = approach(dooracc, dooraccto, 0.6);
    door1x = clamp(door1x, -650, 0);
    door2x = clamp(door2x, 0, 650);
    
    if (door1x >= 0 && door2x <= 0 && !opening && !closed)
    {
        audio_play_sound(su_fadedooropen, 1, false);
        
        with (instance_create_depth(0, 0, depth - 2, obj_fadedooreffect))
            sprite_index = S_FadeDoorSpark;
        
        with (instance_create_depth(0, 0, depth - 2, obj_fadedooreffect))
            sprite_index = S_FadeDoorSmoke;
        
        door1x = 0;
        closed = true;
        alarm[0] = 200;
        alarm[2] = 180;
        alarm[3] = 190;
        shake = 8;
        shake2 = 8;
        shake3 = 8;
    }
    
    if (door2x > 500 && opening && closed)
        instance_destroy();
    
    p1x += titleacc;
    p1x = clamp(p1x, -1000, 0);
    p2x -= titleacc;
    p2x = clamp(p2x, 0, 1000);
}

switch (pizzafacestate)
{
    case 0:
        if (closed == true)
        {
            pizzafacestate = 1;
            alarm[1] = 40;
        }
        
        break;
    
    case 1:
        pizzafaceangle += 25;
        break;
    
    case 2:
        if (pizzafaceangle < 0)
        {
            pizzafaceangle -= pizzafaceangleacc;
            pizzafaceangleacc = approach(pizzafaceangleacc, pizzafaceangleaccto, 0.25);
        }
        else
        {
            pizzafaceangle = 0;
        }
        
        break;
    
    case 3:
        pizzafaceangleacc = approach(pizzafaceangleacc, pizzafaceangleaccto, 0.5);
        pizzafaceangle += pizzafaceangleacc;
        
        if (door1x < -250)
        {
            pizzafacestate = 4;
            pizzafaceangle = 181;
            pizzafaceangleacc = 2;
            pizzafaceangleaccto = -10;
        }
        
        break;
    
    case 4:
        if (pizzafaceangle > 180)
        {
            pizzafaceangle += pizzafaceangleacc;
            pizzafaceangleacc = approach(pizzafaceangleacc, pizzafaceangleaccto, 0.25);
        }
        else
        {
            pizzafaceangle = 180;
        }
        
        break;
}
