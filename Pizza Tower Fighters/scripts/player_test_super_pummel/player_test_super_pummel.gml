function player_test_super_pummel()
{
    switch (PummelWeed)
    {
        case 1:
            if (sprite_index != s_test_super_pummel1)
            {
                sprite_index = s_test_super_pummel1;
                noisebomb = 1;
                mask_index = s_test_super_pummel1_col;
                ds_list_clear(HitByAttack);
            }
            
            break;
        
        case 2:
            if (sprite_index != s_test_super_pummel6)
            {
                sprite_index = s_test_super_pummel6;
                noisebomb = 1;
                mask_index = s_test_super_pummel1_col;
                ds_list_clear(HitByAttack);
            }
            
            break;
        
        case 3:
            if (sprite_index != s_test_super_pummel3)
            {
                sprite_index = s_test_super_pummel3;
                noisebomb = 1;
                mask_index = s_test_super_pummel1_col;
                ds_list_clear(HitByAttack);
            }
            
            break;
        
        case 4:
            if (sprite_index != s_test_super_pummel4)
            {
                sprite_index = s_test_super_pummel4;
                noisebomb = 1;
                mask_index = s_test_super_pummel1_col;
                ds_list_clear(HitByAttack);
            }
            
            break;
        
        case 5:
            if (sprite_index != s_test_super_pummel5)
            {
                sprite_index = s_test_super_pummel5;
                noisebomb = 1;
                mask_index = s_test_super_pummel1_col;
                ds_list_clear(HitByAttack);
            }
            
            break;
        
        case 6:
            if (sprite_index != s_test_super_pummel2)
            {
                sprite_index = s_test_super_pummel2;
                noisebomb = 1;
                mask_index = s_test_super_pummel1_col;
                hsp = 2 * facing;
                damagenull = true;
                ds_list_clear(HitByAttack);
            }
            
            break;
    }
    
    if (hsp != 0)
        facing = sign(hsp);
    
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
                ScreenShake(6, 25);
                noisebomb = 0;
                ds_list_add(HitByAttack, HitID);
                
                with (HitID)
                {
                    if (other.PummelWeed != 2)
                        player_hurt(5, 2, other.facing, 4);
                    else
                        player_hurt(5, 2, other.facing, 5.5);
                }
                
                instance_create_layer(x, y, "part", o_massivehit);
                
                with (instance_create_layer(x, y, layer, o_gib))
                {
                    vsp = irandom_range(1, -8);
                    speed = irandom_range(8, -8);
                }
                
                with (instance_create_layer(x, y, layer, o_gib))
                {
                    vsp = irandom_range(-1, 8);
                    speed = irandom_range(8, -8);
                }
            }
        }
    }
    
    ds_list_destroy(VarHitByAttackNow);
    mask_index = s_test_idl;
    
    if (floor(image_index) == (image_number - 1))
    {
        if (PummelWeed != 0)
        {
            if (noisebomb == 0)
                PummelWeed--;
            else
                PummelWeed = 0;
        }
        
        if (PummelWeed == 0)
        {
            state = (26 << 0);
            inv = false;
        }
    }
}
