for (var i = 0; i < 8; i++)
{
    with (bt_bullet(obj_dogi_jump_star, x, y))
    {
        angle = i * 45;
        
        if (other.blue && (i % 2) == 0)
        {
            image_blend = #14A9FF;
            bulletType = (1 << 0);
        }
    }
}

alarm[1] = 20;
