function player_sheen_side_special()
{
    player_col();
    
    if (sprite_index != s_sheen_evil)
    {
        image_speed = 1;
        hsp = 0;
        sprite_index = s_sheen_evil;
        image_index = 0;
        audio_play_sound(su_hate, 50, false);
        ds_list_clear(HitByAttack);
    }
    
    if (hsp != 0)
    {
        facing = sign(hsp);
        direction = facing;
    }
    
    mask_index = s_test_side_specialcol;
    var VarHitByAttackNow = ds_list_create();
    var Hits;
    
    if (object_index == o_player_sheen)
    {
        Hits = instance_place_list(x, y, O_Player_2, VarHitByAttackNow, false);
        
        if (instance_exists(O_Player_2))
        {
            with (O_Player_2)
            {
                with (instance_create_layer(x, y, layer, o_player_noise_explosion))
                    player = 1;
            }
        }
    }
    else
    {
        Hits = instance_place_list(x, y, O_Player_1, VarHitByAttackNow, false);
        
        if (global.P2Cpu == true)
        {
            if (global.CPULVL == 5)
            {
                var _checkforparry = irandom_range(1, 2);
                
                if (_checkforparry == 1 && instance_exists(par_projectile))
                {
                    if (point_distance(x, y, par_projectile.x, par_projectile.y) < 64)
                    {
                        state = (12 << 0);
                        mask_index = s_test_idl;
                        accel_final = hsp * facing;
                        last_h = 1 * facing;
                    }
                }
            }
        }
    }
    
    if (Hits > 0)
    {
        for (var i = 0; i < Hits; i++)
        {
            var HitID = ds_list_find_value(VarHitByAttackNow, i);
            
            if (ds_list_find_index(HitByAttack, HitID) == -1)
            {
                ds_list_add(HitByAttack, HitID);
                
                with (HitID)
                    player_hurt(30, 11, other.facing, 6);
            }
        }
    }
    
    ds_list_destroy(VarHitByAttackNow);
    mask_index = s_sheen_idle;
    
    if (floor(image_index) == (image_number - 1))
    {
        mask_index = s_sheen_idle;
        state = (0 << 0);
        accel_final = hsp * facing;
        last_h = 1 * facing;
    }
}
