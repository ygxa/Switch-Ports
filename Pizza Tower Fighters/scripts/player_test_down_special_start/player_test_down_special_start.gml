function player_test_down_special_start()
{
    hsp = 0;
    vsp += grv;
    player_col();
    
    if (sprite_index != s_test_down_special_start)
    {
        audio_play_sound(su_pep_cool, 50, false);
        sprite_index = s_test_down_special_start;
        image_index = 0;
        image_speed = 1;
        noisebomb = 0;
        ds_list_clear(HitByAttack);
    }
    
    mask_index = s_test_down_special_startcol;
    var VarHitByAttackNow = ds_list_create();
    
    if (punchcooldown > 0)
    {
        punchcooldown--;
    }
    else if (object_index == o_player_default)
    {
        if (floor(image_index) <= 3)
        {
            punchcooldown = 15;
            
            with (instance_create_layer(x, y - 600, layer, o_thunder))
            {
                vsp = 10;
                player = 1;
                firstplayer = player;
            }
        }
    }
    else if (floor(image_index) <= 3)
    {
        with (instance_create_layer(x, y - 600, layer, o_thunder))
        {
            vsp = 10;
            player = 2;
            firstplayer = player;
        }
        
        punchcooldown = 15;
    }
    
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
                    player_hurt(10, 10, -other.facing, 2);
            }
        }
    }
    
    ds_list_destroy(VarHitByAttackNow);
    mask_index = s_test_idl;
    
    if (floor(image_index) == (image_number - 1))
    {
        image_index = 7;
        image_speed = 0;
    }
    
    if (place_meeting(x, y, o_thunder))
    {
        var _thunder = instance_nearest(x, y, o_thunder);
        instance_destroy(_thunder);
        accel_final = 0;
        last_h = 0;
        state = (9 << 0);
    }
}
