if (image_speed == 1)
{
    x = number_approach_smooth(x, targetX, 0.25, 0.5);
    blender = number_approach_smooth(blender, 1, 0.25, 0.005);
    image_blend = merge_color(startBlend, c_white, blender);
    
    if (floor(image_index) >= 9)
    {
        var downSpeed = 14;
        
        if (instance_exists(obj_moldrickb_squish))
        {
            alarm[3] = 5;
            
            with (obj_moldrickb_squish)
            {
                alarm[0] = 1;
                speed = 0;
                vspeed = -8;
            }
            
            downSpeed = 22;
        }
        
        image_index = 9;
        image_speed = 0;
        image_blend = c_white;
        vspeed = downSpeed;
        sfx_play(snd_throw);
        alarm[0] = 5;
    }
}
else if (floor(image_index) >= (image_number - 1))
{
    image_index = image_number - 1;
    image_speed = 0;
}
