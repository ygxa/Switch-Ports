function monster_pat_idle()
{
    image_xscale = facing;
    y += vsp;
    
    if (instance_exists(par_player))
    {
        if (distance_to_object(par_player) < 100)
            state = monster_pat_call;
    }
}
