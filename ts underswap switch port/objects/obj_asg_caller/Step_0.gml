if (global.canmove)
{
    timer++;
    
    if (timer >= 9000)
    {
        timer = 0;
        dx_scene("phone.asg_wait");
        
        if (ds_map_find_value(global.flags, "rh_asg_wait") >= 6)
            instance_destroy();
    }
}
