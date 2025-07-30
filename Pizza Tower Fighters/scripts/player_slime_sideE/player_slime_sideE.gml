function player_slime_sideE()
{
    if (accel_final <= 4)
        accel_final += accel;
    
    hsp = accel_final * facing;
    player_col();
    vsp = 0;
    
    if (hsp != 0)
        image_xscale = sign(hsp);
    
    if (sprite_index != s_cheese_attack)
    {
        sprite_index = s_cheese_attack;
        image_index = 0;
        ds_list_clear(HitByAttack);
    }
    
    mask_index = s_cheese_attack_col;
    var VarHitByAttackNow = ds_list_create();
    var Hits;
    
    if (object_index == o_cheeseslime)
        Hits = instance_place_list(x, y, O_Player_1, VarHitByAttackNow, false);
    else
        Hits = instance_place_list(x, y, O_Player_2, VarHitByAttackNow, false);
    
    if (Hits > 0)
    {
        for (var i = 0; i < Hits; i++)
        {
            var HitID = ds_list_find_value(VarHitByAttackNow, i);
            
            if (ds_list_find_index(HitByAttack, HitID) == -1)
            {
                ds_list_add(HitByAttack, HitID);
                
                with (HitID)
                    player_hurt(1, 8, other.facing, 5);
            }
        }
    }
    
    ds_list_destroy(VarHitByAttackNow);
    mask_index = s_pizzaboy;
    
    if (floor(image_index) == (image_number - 1))
    {
        sprite_index = s_cheese_idle;
        state = (0 << 0);
        accel_final = 0;
        last_h = 0;
    }
}
