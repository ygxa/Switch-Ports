if (other.state != 188 && other.state != 63)
{
    if (other.state == 49 || other.state == 40 || other.state == 23)
    {
        repeat (8)
        {
            with (create_debris(x, y, spr_grapedebris))
            {
                vsp = random_range(-5, 0);
                hsp = random_range(-3, 3);
            }
        }
        
        instance_destroy();
    }
    else
    {
        tv_push_prompt_once(tv_create_prompt("This is the cheeseball transformation text", 2, spr_null, 3), "cheeseball");
        other.xscale = image_xscale;
        other.hsp = hsp;
        other.vsp = vsp;
        other.movespeed = 8;
        other.x = x;
        other.y = y;
        other.state = 23;
        other.stop_buffer = other.stop_max;
        
        repeat (8)
        {
            with (create_debris(x, y, spr_grapedebris))
            {
                vsp = random_range(-5, 0);
                hsp = random_range(-3, 3);
            }
        }
        
        instance_destroy();
    }
}
