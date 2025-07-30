if (sprite_index != spr_mortspawn && sprite_index != spr_mortfall)
{
    with (other)
    {
        if (state != 13 && state != 14 && state != 15 && state != 16 && state != 192)
        {
            repeat (6)
                create_debris(x, y, spr_null);
            
            mort = 1;
            instance_create_unique(x, y, obj_mortfollow);
            movespeed = hsp;
            state = 13;
            tv_push_prompt_once(tv_create_prompt("This is the mort powerup text", 2, spr_null, 3), "mort");
            instance_destroy(other);
        }
    }
}
