function player_faker_downE()
{
    hsp = 0;
    vsp = 0;
    
    if (sprite_index != s_fakepep_downE)
    {
        audio_play_sound(su_fakepep_superjump, 50, false);
        sprite_index = s_fakepep_downE;
        image_index = 0;
        image_speed = 1;
        ds_list_clear(HitByAttack);
    }
    
    mask_index = s_fakepep_downEcol;
    var VarHitByAttackNow = ds_list_create();
    var Hits;
    
    if (object_index == o_player_fakepep)
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
                    player_hurt(10, -2, other.facing, 5);
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
