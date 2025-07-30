function player_vigilante_down_special()
{
    if (sprite_index != s_vigilante_down_special)
    {
        audio_play_sound(su_vigi_shine, 100, false);
        sprite_index = s_vigilante_down_special;
        image_index = 0;
        hsp = 0;
        image_speed = 1;
        ds_list_clear(HitByAttack);
    }
    
    vsp += grv;
    player_col();
    mask_index = s_vigilante_idle;
    var VarHitByAttackNow = ds_list_create();
    var Hits;
    
    if (object_index == o_player_vigilante)
    {
        if (!instance_exists(o_vigi_ds_effect))
            instance_create_layer(x, y + 75, layer, o_vigi_ds_effect);
        
        Hits = instance_place_list(x, y, O_Player_2, VarHitByAttackNow, false);
    }
    else
    {
        if (!instance_exists(o_vigi_ds_effect))
        {
            with (instance_create_layer(x, y + 75, layer, o_vigi_ds_effect))
                target = other;
        }
        
        Hits = instance_place_list(x, y, O_Player_1, VarHitByAttackNow, false);
    }
    
    if (Hits > 0)
    {
        for (var i = 0; i < Hits; i++)
        {
            var HitID = ds_list_find_value(VarHitByAttackNow, i);
            
            if (ds_list_find_index(HitByAttack, HitID) == -1)
            {
                ds_list_add(HitByAttack, HitID);
                
                with (HitID)
                    player_hurt(15, 0, other.facing, 5);
            }
        }
    }
    
    ds_list_destroy(VarHitByAttackNow);
    mask_index = s_vigilante_idle;
    
    if (floor(image_index) == (image_number - 1))
    {
        instance_destroy(o_vigi_ds_effect);
        sprite_index = s_vigilante_idle;
        state = (0 << 0);
        accel_final = 0;
        last_h = 0;
        stupid = 0;
    }
}
