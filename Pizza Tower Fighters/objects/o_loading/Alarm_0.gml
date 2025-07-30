var len = array_length(tex_list);

if (len > 0)
{
    var tex = array_pop(tex_list);
    
    if (!texture_is_ready(tex))
        texture_prefetch(tex);
}
else if (global.frogger)
{
    instance_create_depth(x, y, depth, obj_frogger);
    instance_destroy();
}
else
{
    room_goto(R_MONOE);
    instance_destroy();
}

alarm[0] = 1;
