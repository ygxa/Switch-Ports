function pizzaface_lunge()
{
    if (blue_aftereffect <= 0)
    {
        blue_aftereffect = 6;
        
        with (instance_create_depth(x, y, layer, o_afterimage))
        {
            depth = other.depth + 1;
            image_xscale = other.image_xscale;
            image_blend = #C83030;
            sprite_index = other.sprite_index;
            image_alpha = 1.25;
            image_index = other.image_index - 1;
            full = 1;
        }
    }
    else
    {
        blue_aftereffect--;
    }
    
    if (sprite_index != s_pizzaface_lunge)
    {
        sprite_index = s_pizzaface_lunge;
        direction = point_direction(x, y, targetx, targety);
        image_index = 0;
        audio_play_sound(su_pizzaface_lunge, 50, false);
        image_speed = 1;
        ds_list_clear(HitByAttack);
    }
    
    hsp = lengthdir_x(24, direction);
    vsp = lengthdir_y(20, direction);
    facing = sign(hsp);
    mask_index = s_pizzaface_lunge_col;
    var VarHitByAttackNow = ds_list_create();
    var Hits = instance_place_list(x, y, O_Player_1, VarHitByAttackNow, false);
    player_col();
    
    if (Hits > 0)
    {
        for (var i = 0; i < Hits; i++)
        {
            var HitID = ds_list_find_value(VarHitByAttackNow, i);
            
            if (ds_list_find_index(HitByAttack, HitID) == -1)
            {
                ds_list_add(HitByAttack, HitID);
                
                with (HitID)
                    player_hurt(20, 7, other.facing, 7);
            }
        }
    }
    
    ds_list_destroy(VarHitByAttackNow);
    mask_index = s_pizzaface_idle;
    
    if (grounded)
    {
        state = (5 << 0);
        vsp = 0;
        audio_stop_sound(su_pizzaface_lunge);
        hsp = 0;
    }
}
