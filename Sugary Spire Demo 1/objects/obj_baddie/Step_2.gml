stuntouch--;
stuntouch = max(0, stuntouch);

if (squashed == true)
{
    squashval = approach(squashval, 0.4, 0.15);
    
    if (squashval >= 0.4)
        squashed = false;
}
else if (squashed == false)
{
    squashval = approach(squashval, 0, 0.05);
}

if (state != 8 && state != 10)
    scr_collide();

if (state == 8)
{
    vsp = 0;
    hsp = 0;
}
