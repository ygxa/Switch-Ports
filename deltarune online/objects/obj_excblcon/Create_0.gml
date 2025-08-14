alarm[0] = 20;
image_speed = 0.1;

function scr_marker(argument0, argument1, argument2)
{
    thismarker = instance_create(argument0, argument1, obj_marker);
    
    with (thismarker)
    {
        sprite_index = argument2;
        image_speed = 0;
    }
    
    return thismarker;
}

function scr_doom(argument0, argument1)
{
    with (instance_create_depth(0, 0, 0, obj_doom))
    {
        alarm[0] = argument1;
        target = argument0;
    }
}
