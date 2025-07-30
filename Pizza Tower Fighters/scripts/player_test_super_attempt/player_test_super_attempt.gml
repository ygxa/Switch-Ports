function player_test_super_attempt()
{
    if (sprite_index != s_test_super_attempt)
    {
        sprite_index = s_test_super_attempt;
        image_speed = 1;
        image_index = 0;
        inv = true;
        unparry = true;
        hsp = 10 * facing;
        audio_play_sound(su_pep_shoulder, 50, false);
        ds_list_clear(HitByAttack);
    }
    
    player_col();
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
                PummelWeed = 6;
                state = (25 << 0);
            }
        }
    }
    
    ds_list_destroy(VarHitByAttackNow);
    
    if (floor(image_index) == (image_number - 1))
    {
        state = (0 << 0);
        mask_index = s_test_idl;
        inv = false;
    }
}
