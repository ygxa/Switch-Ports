if (!instance_exists(o_monster_Chaser) && !instance_exists(o_patroller))
{
    timer--;
    
    if (timer == 0)
    {
        with (instance_create_layer(x, y, layer, o_patroller))
            facing = other.facer;
        
        timer = timermax + irandom_range(-50, 50);
    }
}
