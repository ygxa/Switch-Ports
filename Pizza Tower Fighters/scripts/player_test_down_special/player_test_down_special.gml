function player_test_down_special()
{
    hsp = 0;
    vsp += grv;
    player_col();
    
    if (sprite_index != s_test_down_special)
    {
        audio_play_sound(su_pep_sword, 50, false);
        sprite_index = s_test_down_special;
        image_index = 0;
        image_speed = 1;
        ds_list_clear(HitByAttack);
    }
    
    mask_index = s_test_down_specialcol;
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
                    player_hurt(12, -3, other.facing, 4.5);
            }
        }
    }
    
    ds_list_destroy(VarHitByAttackNow);
    mask_index = s_test_idl;
    
    if (floor(image_index) == (image_number - 1))
    {
        accel_final = 0;
        last_h = 0;
        state = (0 << 0);
    }
}
