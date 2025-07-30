if (timer == 0)
{
    timer = timermax;
    clones--;
    
    if (player == 1 && instance_exists(O_Player_2))
    {
        with (instance_create_layer(O_Player_2.x, O_Player_2.y, layer, o_clone_fakepep))
            player_marker = o_maker2;
    }
    
    if (player == 2 && instance_exists(O_Player_1))
    {
        with (instance_create_layer(O_Player_1.x, O_Player_1.y, layer, o_clone_fakepep))
            player_marker = o_marker;
    }
}

if (timer != 0)
    timer--;

if (clones == 0)
    instance_destroy();
