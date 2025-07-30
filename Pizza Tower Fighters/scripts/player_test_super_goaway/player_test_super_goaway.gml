function player_test_super_goaway()
{
    if (sprite_index != s_test_super_finish)
    {
        audio_stop_sound(su_pep_dash);
        audio_play_sound(su_pep_punch, 50, false);
        sprite_index = s_test_super_finish;
        image_index = 0;
        image_speed = 1;
        accel_final = 8;
        last_h = 1 * -facing;
        ds_list_clear(HitByAttack);
    }
    
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
    mask_index = s_test_super_finish_col;
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
                    player_hurt(25, 5, other.facing, 7);
            }
        }
    }
    
    ds_list_destroy(VarHitByAttackNow);
    mask_index = s_test_idl;
    
    if (floor(image_index) == (image_number - 1))
    {
        state = (0 << 0);
        doublekey = 0;
        sprint = false;
        unparry = false;
        damagenull = false;
    }
}
