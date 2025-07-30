function player_doise_sideE()
{
    hsp = 0;
    vsp = 0;
    
    if (sprite_index != s_doise_sideE)
    {
        image_speed = 1;
        sprite_index = s_doise_sideE;
        image_index = 0;
        ds_list_clear(HitByAttack);
    }
    
    if (floor(image_index) == 3 && !audio_is_playing(su_noise_glovehit))
        audio_play_sound(su_noise_glovehit, 50, false);
    
    mask_index = s_doise_sideEcol;
    var VarHitByAttackNow = ds_list_create();
    var Hits;
    
    if (object_index == o_player_doise)
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
                    player_hurt(10, 6, other.facing, 6);
            }
        }
    }
    
    ds_list_destroy(VarHitByAttackNow);
    mask_index = s_noise_idle;
    
    if (floor(image_index) == (image_number - 1))
    {
        sprite_index = s_noise_idle;
        state = (0 << 0);
        accel_final = 0;
        last_h = 0;
    }
}
