global.canmove = true;
global.ui_force_side = -1;
global.currentnpc = -4;
global.currentinteract = -4;

if (obj_overworldui.state == (1 << 0))
{
    obj_overworldui.state = (0 << 0);
    obj_overworldui.choice = 0;
}
else if (obj_overworldui.state != (0 << 0))
{
    global.canmove = false;
}

if (global.dxinst.currentScene != undefined)
{
    with (obj_gamemanager)
    {
        waitTimer = 0;
        waitInst = undefined;
        waitCallback = undefined;
    }
    
    dx_instance_stop_scene(global.dxinst);
}

ds_map_clear(global.inst_custom_ids);

if (room == rm_testtext)
{
    with (obj_testtext)
    {
        if (running)
            keyboard_string = detected;
    }
}

alarm[0] = 1;
