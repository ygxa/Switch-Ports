function player_vigilante_dash_attack()
{
    vsp += grv;
    
    if (accel_final <= 4)
        accel_final += accel;
    
    hsp = accel_final * last_h;
    player_col();
    
    if (sprite_index != s_vigilante_dash_attack)
    {
        last_h = 1 * facing;
        image_speed = 1;
        sprint = false;
        audio_stop_sound(su_vigi_dash);
        audio_play_sound(su_vigi_kick, 50, false);
        sprite_index = s_vigilante_dash_attack;
        image_index = 0;
        ds_list_clear(HitByAttack);
    }
    
    mask_index = s_vigilante_dashattack_col;
    var VarHitByAttackNow = ds_list_create();
    var Hits;
    
    if (object_index == o_player_vigilante)
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
                    player_hurt(5, 13, other.facing, 3);
            }
        }
    }
    
    ds_list_destroy(VarHitByAttackNow);
    mask_index = s_vigilante_idle;
    
    if (floor(image_index) == (image_number - 1))
    {
        sprite_index = s_vigilante_idle;
        state = (0 << 0);
        doublekey = 0;
    }
}
