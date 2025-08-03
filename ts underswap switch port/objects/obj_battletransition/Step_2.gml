if (showPlayer)
{
    with (obj_player)
        depth = other.depth - 5;
    
    if (room == rm_ruina_garden)
    {
        with (obj_asgore_ow)
            depth = other.depth - 5;
    }
}
else
{
    with (obj_player)
        depth = 0;
    
    if (room == rm_ruina_garden)
    {
        with (obj_asgore_ow)
            depth = 0;
    }
}
