function controller_detect()
{
    var gp_num = gamepad_get_device_count();
    
    for (var i = 0; i < gp_num; i++)
    {
        if (gamepad_is_connected(i))
            global.gp[0][i] = true;
        else
            global.gp[0][i] = false;
    }
}
