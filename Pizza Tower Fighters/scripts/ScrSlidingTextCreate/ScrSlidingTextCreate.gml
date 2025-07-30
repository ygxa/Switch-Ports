function ScrSlidingTextCreate(argument0)
{
    instance_destroy(obj_slidingtext);
    
    with (instance_create_depth(x, y, -999, obj_slidingtext))
        text = argument0;
}
