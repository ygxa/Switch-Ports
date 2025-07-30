with (other)
{
    if (state != 186 && state != 148 && state != 187 && state != 188)
    {
        xscale = other.image_xscale;
        state = 186;
        tv_push_prompt_once(tv_create_prompt("This is the rocket transformation text", 2, spr_null, 3), "rocket");
        sprite_index = spr_rocketstart;
        image_index = 0;
        
        if (movespeed < 8)
            movespeed = 8;
        
        x = other.x;
        y = other.y + 4;
    }
}
