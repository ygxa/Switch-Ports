function player_test_upE()
{
    hsp = 0;
    vsp = 0;
    
    if (sprite_index != s_test_upE)
    {
        sprite_index = s_test_upE;
        image_index = 0;
        ds_list_clear(HitByAttack);
    }
    
    if (floor(image_index) == 4 && !audio_is_playing(su_pep_punch))
        audio_play_sound(su_pep_punch, 50, false);
    
    mask_index = s_test_upEcol;
    var VarHitByAttackNow = ds_list_create();
    var Hits;
    
    if (object_index == o_player_default)
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
                    player_hurt(10, 14, other.facing, 1);
            }
        }
    }
    
    ds_list_destroy(VarHitByAttackNow);
    mask_index = s_test_idl;
    
    if (floor(image_index) == (image_number - 1))
    {
        sprite_index = s_test_idl;
        state = (0 << 0);
        accel_final = 0;
        last_h = 0;
    }
}
