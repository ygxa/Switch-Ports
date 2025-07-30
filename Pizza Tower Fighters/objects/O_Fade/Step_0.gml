isdoor = 0;

if (state == 0)
{
    timer++;
    
    if (timer >= (duration + 2))
    {
        room_goto(targetRoom);
        state = 1;
    }
}
else if (state == 1)
{
    timer--;
    
    if (timer <= 0)
        instance_destroy();
}

alpha = timer / duration;
