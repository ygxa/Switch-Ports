if (done)
{
    if (destroyWhenOutOfView && camera_get_view_y(view_camera[0]) > (y + 20))
        instance_destroy();
    
    exit;
}

var stop = false;
var inst;

with (obj_player)
{
    inst = instance_place(x, y, obj_freefall_end);
    
    if (inst != -4)
    {
        stop = true;
        x = clamp(x, inst.minX, inst.maxX);
        y = inst.y - 10;
        vspeed = 0;
        image_alpha = 1;
    }
}

if (stop)
{
    global.canmove = true;
    done = true;
    obj_gamemanager.normalViewSpeed = 4;
    
    if (inst != -4)
    {
        if (inst.randomEncounter)
            bt_random_encounter();
        
        if (inst.destroy)
            instance_destroy(inst);
    }
}
else if (started)
{
    with (obj_gamemanager)
    {
        forceView = false;
        normalViewSpeed = 5;
    }
}
