function player_noise_dash_attack()
{
    if (sprite_index != s_noise_dashattack)
    {
        audio_stop_sound(su_noise_dash);
        audio_play_sound(su_noise_tornado, 50, false);
        sprite_index = s_noise_dashattack;
        image_index = 0;
        image_speed = 1;
        noisebomb = 45;
        ds_list_clear(HitByAttack);
    }
    
    noisebomb -= 1;
    
    if (accel_final > 0)
        accel_final -= accel;
    
    if (accel_final < accel)
    {
        accel_final = 0;
        last_h = 0;
    }
    
    hsp = accel_final * last_h;
    vsp += grv;
    player_col();
    mask_index = s_noise_dashattack_col;
    var VarHitByAttackNow = ds_list_create();
    var Hits;
    
    if (object_index == o_player_noise)
        Hits = instance_place_list(x, y, O_Player_2, VarHitByAttackNow, false);
    else
        Hits = instance_place_list(x, y, O_Player_1, VarHitByAttackNow, false);
    
    if (Hits > 0)
    {
        for (var i = 0; i < Hits; i++)
        {
            var HitID = ds_list_find_value(VarHitByAttackNow, i);
            
            if (ds_list_find_index(HitByAttack, HitID) == -1)
            {
                ds_list_add(HitByAttack, HitID);
                
                with (HitID)
                    player_hurt(10, 5, other.facing, 5);
            }
        }
    }
    
    ds_list_destroy(VarHitByAttackNow);
    mask_index = s_noise_idle;
    
    if (noisebomb == 0)
    {
        sprite_index = s_noise_idle;
        state = (0 << 0);
        audio_stop_sound(su_noise_tornado);
        doublekey = 0;
        sprint = false;
    }
}
