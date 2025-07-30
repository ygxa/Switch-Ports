function player_faker_sideE()
{
    hsp = 0;
    vsp = 0;
    
    if (sprite_index != s_fakepep_sideE)
    {
        sprite_index = s_fakepep_sideE;
        image_index = 0;
        image_speed = 1;
        ds_list_clear(HitByAttack);
    }
    
    mask_index = s_fakepep_sideEcol;
    var VarHitByAttackNow = ds_list_create();
    var Hits;
    
    if (object_index == o_player_fakepep)
        Hits = instance_place_list(x, y, O_Player_2, VarHitByAttackNow, false);
    else
        Hits = instance_place_list(x, y, O_Player_1, VarHitByAttackNow, false);
    
    if (floor(image_index) == 2 && !audio_is_playing(su_pep_punch))
        audio_play_sound(su_pep_punch, 50, false);
    
    if (image_index > 6)
        image_speed = 0.7;
    
    if (Hits > 0)
    {
        for (var i = 0; i < Hits; i++)
        {
            var HitID = ds_list_find_value(VarHitByAttackNow, i);
            
            if (ds_list_find_index(HitByAttack, HitID) == -1)
            {
                ds_list_add(HitByAttack, HitID);
                
                with (HitID)
                    player_hurt(5, 4, other.facing, 4);
            }
        }
    }
    
    ds_list_destroy(VarHitByAttackNow);
    mask_index = s_fakepep_idle;
    
    if (floor(image_index) == (image_number - 1))
    {
        sprite_index = s_fakepep_idle;
        state = (0 << 0);
        accel_final = 0;
        last_h = 0;
    }
}
