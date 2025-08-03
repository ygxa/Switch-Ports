obj_gamemanager.setGuiSurface();

if (image != -1)
    draw_sprite_ext(image, 0, 0, 0, 2, 2, 0, c_white, 1);

surface_reset_target();

if (buffer && (global.control_confirm_pressed || global.control_cancel_pressed) && !global.control_menu)
{
    if (!doNotFree)
        global.canmove = true;
    
    instance_destroy();
}
else
{
    global.canmove = false;
}

if (first)
{
    first = false;
    
    if (spec && !doNotFree)
        global.canmove = true;
}
