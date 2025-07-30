function pizzaface_lunge_land()
{
    if (sprite_index != s_pizzaface_lunge_land)
    {
        sprite_index = s_pizzaface_lunge_land;
        image_index = 0;
        audio_play_sound(su_fakepep_bodyslam_fn, 50, false);
        image_speed = 1;
        ds_list_clear(HitByAttack);
    }
    
    mask_index = s_pizzaface_lunge_land_col;
    var VarHitByAttackNow = ds_list_create();
    var Hits = instance_place_list(x, y, O_Player_1, VarHitByAttackNow, false);
    
    if (Hits > 0)
    {
        for (var i = 0; i < Hits; i++)
        {
            var HitID = ds_list_find_value(VarHitByAttackNow, i);
            
            if (ds_list_find_index(HitByAttack, HitID) == -1)
            {
                ds_list_add(HitByAttack, HitID);
                
                with (HitID)
                    player_hurt(20, 7, other.facing, 7);
            }
        }
    }
    
    ds_list_destroy(VarHitByAttackNow);
    mask_index = s_pizzaface_idle;
    
    if (floor(image_index) == (image_number - 1))
        state = (6 << 0);
}
