function clone_faker_reform()
{
    vsp = 0;
    
    if (sprite_index != s_fakepep_reform)
    {
        audio_play_sound(su_fakepep_reform, 50, false);
        sprite_index = s_fakepep_reform;
        image_index = 0;
        image_alpha = 1;
        image_speed = 1;
        ds_list_clear(HitByAttack);
    }
    
    mask_index = s_fakepep_reform_col;
    var VarHitByAttackNow = ds_list_create();
    var Hits;
    
    if (player_marker == o_maker2)
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
                    player_hurt(5, 8, other.facing, 4);
            }
        }
    }
    
    ds_list_destroy(VarHitByAttackNow);
    mask_index = s_fakepep_idle;
    
    if (floor(image_index) == (image_number - 1))
    {
        sprite_index = s_fakepep_idle;
        state = (1 << 0);
    }
}
