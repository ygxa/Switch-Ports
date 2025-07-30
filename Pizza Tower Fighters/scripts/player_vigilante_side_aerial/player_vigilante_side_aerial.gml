function player_vigilante_side_aerial()
{
    if (sprite_index != s_vigilante_side_aerial)
    {
        abletorecover = 0;
        vsp = 0;
        hsp = 0;
        image_speed = 2.5;
        sprite_index = s_vigilante_side_aerial;
        image_index = 0;
        ds_list_clear(HitByAttack);
    }
    
    mask_index = s_vigilante_side_aerial_col;
    var VarHitByAttackNow = ds_list_create();
    var Hits;
    
    if (object_index == o_player_vigilante)
    {
        if (floor(image_index) == 8)
            image_speed = 1;
        
        Hits = instance_place_list(x, y, O_Player_2, VarHitByAttackNow, false);
    }
    else
    {
        if (floor(image_index) == 8)
            image_speed = 1;
        
        Hits = instance_place_list(x, y, O_Player_1, VarHitByAttackNow, false);
    }
    
    if (punchcooldown > 0)
    {
        punchcooldown--;
    }
    else if (object_index == o_player_vigilante)
    {
        if (floor(image_index) == 14)
        {
            punchcooldown = 10;
            
            with (instance_create_layer(x, y, layer, o_vigi_cowmeat))
            {
                hsp = 7 * other.facing;
                timer = other.facing;
                player = 1;
            }
            
            audio_play_sound(su_vigi_bazooka, 100, false);
            image_speed = 1;
        }
    }
    else if (floor(image_index) == 14)
    {
        punchcooldown = 10;
        
        with (instance_create_layer(x, y, layer, o_vigi_cowmeat))
        {
            hsp = 7 * other.facing;
            timer = other.facing;
            player = 2;
        }
        
        audio_play_sound(su_vigi_bazooka, 100, false);
        image_speed = 1;
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
                    player_hurt(10, 5, -other.facing, 2);
            }
        }
    }
    
    ds_list_destroy(VarHitByAttackNow);
    mask_index = s_vigilante_idle;
    
    if (floor(image_index) == (image_number - 1) || place_meeting(x, y + 1, ObjWall))
    {
        sprite_index = s_vigilante_idle;
        state = (0 << 0);
        accel_final = 0;
        last_h = 0;
    }
}
