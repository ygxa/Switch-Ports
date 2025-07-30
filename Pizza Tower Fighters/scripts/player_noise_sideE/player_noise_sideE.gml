function player_noise_sideE()
{
    vsp += grv;
    
    if (object_index == o_player_noise2 && global.P2Cpu == true)
    {
        if (accel_final <= accel_max)
            accel_final += accel;
        
        hsp = accel_final * facing;
    }
    else if (image_index > 4)
    {
        if (accel_final <= accel_max)
            accel_final += accel;
        
        hsp = accel_final * last_h;
    }
    
    player_col();
    
    if (sprite_index != s_noise_sideE)
    {
        image_speed = 1;
        audio_play_sound(su_noise_spin, 50, false);
        sprite_index = s_noise_sideE;
        image_index = 0;
        ds_list_clear(HitByAttack);
    }
    
    mask_index = s_noise_sideE_col;
    var VarHitByAttackNow = ds_list_create();
    var Hits;
    
    if (object_index == o_player_noise)
    {
        Hits = instance_place_list(x, y, O_Player_2, VarHitByAttackNow, false);
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
                        mask_index = s_noise_idle;
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
                    player_hurt(10, 8, other.facing, 7);
            }
        }
    }
    
    ds_list_destroy(VarHitByAttackNow);
    mask_index = s_noise_idle;
    
    if (floor(image_index) == (image_number - 1))
    {
        image_speed = 1;
        sprite_index = s_noise_idle;
        state = (0 << 0);
    }
}
