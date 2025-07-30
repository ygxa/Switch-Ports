if (state == 82)
{
    with (other)
    {
        if (state != 5 && state != 91 && state != 33 && state != 188)
        {
            gamepad_vibrate_constant(1, 0.85);
            
            if (state != 11)
                tv_push_prompt_once(tv_create_prompt("This is the fireass transformation text", 2, spr_null, 3), "fireass");
            
            state = 11;
            vsp = -25;
            sprite_index = spr_fireass;
            image_index = 0;
            movespeed = hsp;
        }
    }
}
