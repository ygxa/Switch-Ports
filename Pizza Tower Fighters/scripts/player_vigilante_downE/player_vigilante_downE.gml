function player_vigilante_downE()
{
    if (sprite_index != s_vigilante_downE)
    {
        hsp = 0;
        audio_play_sound(su_vigi_slidedownthingidfkitsucksanditlooksbadAAAA, 50, false);
        sprite_index = s_vigilante_downE;
        image_index = 0;
        ds_list_clear(HitByAttack);
        image_speed = 1;
    }
    
    vsp += grv;
    player_col();
    mask_index = s_vigilante_downEcol;
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
                    player_hurt(10, -3, other.facing, 5);
            }
        }
    }
    
    ds_list_destroy(VarHitByAttackNow);
    mask_index = s_vigilante_idle;
    
    if (floor(image_index) == (image_number - 1))
    {
        sprite_index = s_vigilante_idle;
        state = (0 << 0);
        accel_final = 0;
        last_h = 0;
    }
}
