function scr_collide_destructibles()
{
    if (state == 66 || state == 67 || state == 29 || (state == 85 && (sprite_index == spr_cotton_attack || movespeed >= 8)) || state == 100 || state == 2 || state == 17 || state == 64 || state == 86 || state == 90 || state == 92 || state == 93 || state == 102 || state == 74 || state == 59 || state == 101 || state == 112 || state == 98)
    {
        if (place_meeting(x + hsp, y, obj_destructibles))
        {
            with (instance_place(x + hsp, y, obj_destructibles))
            {
                DestroyedBy = other.id;
                event_user(0);
            }
            
            if (state == 66)
                machpunchAnim = true;
        }
        
        if (place_meeting(x + sign(hsp), y, obj_destructibles))
        {
            with (instance_place(x + sign(hsp), y, obj_destructibles))
            {
                DestroyedBy = other.id;
                event_user(0);
            }
            
            if (state == 66)
                machpunchAnim = true;
        }
        
        if (place_meeting(x + xscale, y, obj_destructibles))
        {
            with (instance_place(x + xscale, y, obj_destructibles))
            {
                DestroyedBy = other.id;
                event_user(0);
            }
            
            if (state == 66)
                machpunchAnim = true;
        }
    }
    
    if (state == 29 || state == 64)
    {
        if (place_meeting(x + sign(hsp), y + sign(vsp), obj_destructibles))
        {
            with (instance_place(x + sign(hsp), y + sign(vsp), obj_destructibles))
            {
                DestroyedBy = other.id;
                event_user(0);
            }
        }
    }
    
    if (state == 85 || state == 95)
    {
        if (sprite_index == spr_cotton_attack || state == 95)
        {
            if (place_meeting(x + sign(hsp) + xscale, y, obj_destructibles))
            {
                with (instance_place(x + sign(hsp) + xscale, y, obj_destructibles))
                {
                    DestroyedBy = other.id;
                    event_user(0);
                }
            }
        }
    }
    
    if ((state == 17 || state == 100 || state == 34 || state == 92 || state == 2) && vsp >= 0)
    {
        if (place_meeting(x, y + vsp, obj_destructibles))
        {
            with (instance_place(x, y + vsp, obj_destructibles))
            {
                DestroyedBy = other.id;
                event_user(0);
            }
        }
    }
    
    if (state == 94)
    {
        if (place_meeting(x, y + vsp, obj_destructibles))
        {
            with (instance_place(x, y + vsp, obj_destructibles))
            {
                DestroyedBy = other.id;
                event_user(0);
            }
        }
        
        if (place_meeting(x, y + 1, obj_destructibles))
        {
            with (instance_place(x, y + 1, obj_destructibles))
            {
                DestroyedBy = other.id;
                event_user(0);
            }
        }
    }
    
    if (state == 10 && vsp < 0)
    {
        if (place_meeting(x, y + vsp, obj_destructibles))
        {
            with (instance_place(x, y + vsp, obj_destructibles))
            {
                DestroyedBy = other.id;
                event_user(0);
            }
        }
    }
    
    if (vsp >= 0 && (state == 92 || (state == 71 || state == 72)))
    {
        if ((place_meeting(x, y + vsp + 2, obj_metalblock) && state == 92) || ((state == 71 || state == 72) && freefallsmash >= 10))
        {
            with (instance_place(x, y + vsp + 2, obj_metalblock))
            {
                with (obj_player)
                {
                    if (place_meeting(x, y + vsp + 2, obj_metalblock) && state != 92)
                    {
                        state = 72;
                        sprite_index = spr_player_bodyslamland;
                        image_index = 0;
                    }
                }
                
                DestroyedBy = other.id;
                event_user(0);
            }
        }
        
        if (place_meeting(x, y + vsp + 2, obj_destructibles))
        {
            with (instance_place(x, y + vsp + 2, obj_destructibles))
            {
                with (obj_player)
                {
                    if (place_meeting(x, y + vsp + 2, obj_bigdestructibles) && state != 92 && freefallsmash <= 10)
                    {
                        state = 72;
                        sprite_index = spr_player_bodyslamland;
                        image_index = 0;
                    }
                }
                
                DestroyedBy = other.id;
                event_user(0);
            }
        }
    }
    
    if (state == 57 || state == 60 || state == 66 || state == 67 || state == 102)
    {
        if (place_meeting(x, y + vsp, obj_destructibles) && vsp < 0)
        {
            with (instance_place(x, y + vsp, obj_destructibles))
            {
                DestroyedBy = other.id;
                event_user(0);
            }
        }
        
        if (place_meeting(x, y - 1, obj_destructibles))
        {
            with (instance_place(x, y - 1, obj_destructibles))
            {
                DestroyedBy = other.id;
                event_user(0);
            }
        }
    }
    
    if (state == 86 && vsp < 0)
    {
        if (place_meeting(x, y + vsp, obj_destructibles))
        {
            with (instance_place(x, y + vsp, obj_destructibles))
            {
                DestroyedBy = other.id;
                event_user(0);
            }
        }
    }
    
    if (state == 15)
    {
        with (obj_bigdestructibles)
        {
            if (place_meeting(x - obj_player.hsp, y, obj_player))
            {
                with (obj_player)
                {
                    hsp = -xscale * 4;
                    vsp = -4;
                    mach2 = 0;
                    image_index = 0;
                    sprite_index = choose(spr_player_blockbreak1, spr_player_blockbreak2, spr_player_blockbreak3, spr_player_blockbreak4, spr_player_blockbreak5, spr_player_blockbreak6, spr_player_blockbreak7);
                    state = 54;
                }
                
                DestroyedBy = other.id;
                event_user(0);
            }
        }
        
        with (obj_destructibles)
        {
            if (place_meeting(x - obj_player.hsp, y, obj_player))
            {
                var _player = instance_nearest(x, y, obj_player);
                DestroyedBy = _player;
                event_user(0);
            }
        }
    }
    
    with (obj_baddie)
    {
        if (place_meeting(x + hsp, y, obj_destructibles) && thrown == 1)
        {
            with (instance_place(x + hsp, y, obj_destructibles))
            {
                DestroyedBy = other.id;
                event_user(0);
            }
        }
        
        if (place_meeting(x + sign(hsp), y, obj_destructibles) && thrown == 1)
        {
            with (instance_place(x + sign(hsp), y, obj_destructibles))
            {
                DestroyedBy = other.id;
                event_user(0);
            }
        }
    }
    
    with (obj_train)
    {
        if (place_meeting(x + hsp, y, obj_destructibles))
        {
            with (instance_place(x + hsp, y, obj_destructibles))
            {
                DestroyedBy = other.id;
                event_user(0);
            }
        }
        
        if (place_meeting(x + sign(hsp), y, obj_destructibles))
        {
            with (instance_place(x + sign(hsp), y, obj_destructibles))
            {
                DestroyedBy = other.id;
                event_user(0);
            }
        }
    }
}
