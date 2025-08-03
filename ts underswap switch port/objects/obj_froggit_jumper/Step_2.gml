var groundY;

if (jumpCount == 2)
{
    groundY = ystart;
    
    if ((hspeed > 0 && x > xstart) || (hspeed < 0 && x < xstart))
    {
        x = xstart;
        hspeed = 0;
    }
}
else
{
    groundY = 270;
}

if (vspeed > 0)
{
    if (animUp && y > (groundY - 30))
    {
        image_speed = -1;
        animUp = false;
    }
    
    if (y > groundY)
    {
        gravity = 0;
        speed = 0;
        y = groundY;
        view_shake(2, 2);
        sfx_play(snd_bang);
        
        if (jumpCount != 2)
        {
            var dist = floor((obj_battlemanager.boxX2 - obj_battlemanager.boxX1) / 20);
            
            for (var i = 0; i < 20; i++)
                instance_create_xy(obj_battlemanager.boxX1 + (i * dist) + irandom_range(-10, 10), obj_battlemanager.boxY2 + irandom_range(-10, 10), obj_frogb_fly5);
            
            sfx_play_pitch(snd_buzzplode, 1);
        }
        
        jumpCount++;
        
        if (jumpCount == 1)
            alarm[0] = 20;
        else if (jumpCount == 2)
            alarm[1] = 10;
    }
}
