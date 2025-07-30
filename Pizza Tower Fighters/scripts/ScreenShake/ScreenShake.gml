function ScreenShake(argument0, argument1)
{
    if (instance_exists(o_camera2))
    {
        with (o_camera2)
        {
            if (argument0 > shake_remain)
            {
                shakeMagnitude = argument0 * global.shaker;
                shake_remain = argument0;
                shakelength = argument1;
            }
        }
    }
    
    if (instance_exists(o_camera1))
    {
        with (o_camera1)
        {
            if (argument0 > shake_remain)
            {
                shakeMagnitude = argument0 * global.shaker;
                shake_remain = argument0;
                shakelength = argument1;
            }
        }
    }
}
