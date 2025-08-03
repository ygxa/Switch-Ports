if (cancelable && global.control_cancel_pressed)
{
    global.canmove = true;
    instance_destroy();
}
