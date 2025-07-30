function effectMapAdd(argument0 = 1, argument1 = object_index)
{
    if (!visible)
        exit;
    
    with (obj_player)
    {
        if (_player != argument0)
            continue;
        
        var key = array_get_index(vfxobjs, argument1);
        
        if (key == -1)
        {
            ////show_debug_message("{0} not represented in drawn effects list!", object_get_name(argument1));
            exit;
        }
        
        array_push(vfx[key], other);
    }
}
