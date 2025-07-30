if (DestroyedBy.object_index == obj_player)
{
    if (place_meeting(x - DestroyedBy.hsp, y, DestroyedBy))
    {
        if (DestroyedBy.state == 65 || DestroyedBy.state == 66)
        {
            with (DestroyedBy)
            {
                with (other.id)
                {
                    if (hp <= 1)
                        instance_destroy();
                    
                    if (hp > 1)
                    {
                        ShakeBuffer = 5;
                        hp -= 1;
                        instance_create(x, y, obj_bangeffect);
                        instance_create(x, y, obj_slapstar);
                        instance_create(x, y, obj_baddiegibs);
                        camera_shake(3, 3);
                    }
                }
                
                hsp = -xscale * 4;
                vsp = -4;
                mach2 = 0;
                image_index = 0;
                sprite_index = choose(spr_player_blockbreak1, spr_player_blockbreak2, spr_player_blockbreak3, spr_player_blockbreak4, spr_player_blockbreak5, spr_player_blockbreak6, spr_player_blockbreak7);
                state = 54;
            }
        }
        else if (DestroyedBy.state == 15)
        {
            with (DestroyedBy)
            {
                hsp = 0;
                movespeed = 0;
                sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4);
                image_index = 0;
                state = 84;
            }
        }
        else
        {
            instance_destroy();
        }
    }
}
else
{
    instance_destroy();
}
