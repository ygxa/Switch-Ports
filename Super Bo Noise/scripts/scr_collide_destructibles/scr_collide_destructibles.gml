function scr_collide_destructibles()
{
    with (obj_player1)
    {
        if ((state == 94 && sprite_index == spr_null) || state == 58 || state == 167 || state == 33 || state == 189 || state == 271 || state == 200 || (state == 60 && pogochargeactive == 1))
        {
            var arr = [[xscale, 0], [hsp + xscale, 0], [0, vsp + 1], [0, vsp - 1], [0, 1], [0, -1]];
            
            for (var i = 0; i < array_length(arr); i++)
            {
                var b = arr[i];
                scr_destroy_destructibles(b[0], b[1]);
            }
        }
        
        if (state == 7)
        {
            with (instance_place(x + xscale, y, obj_rollblock))
                instance_destroy();
        }
        
        if (state == 195 && place_meeting(x + hsp, y, obj_gustavodestroyable))
        {
            with (instance_place(x + hsp, y, obj_gustavodestroyable))
            {
                gamepad_vibrate_constant(0.8, 0.5);
                instance_destroy();
            }
        }
        
        if (state == 213 || state == 36 || ratmount_movespeed == 12 || state == 104 || state == 67 || state == 106 || state == 82 || state == 261 || state == 203 || state == 82 || state == 44 || state == 195 || state == 45 || state == 23 || state == 55 || state == 186 || state == 72 || state == 126 || state == 96 || state == 22 || sprite_index == spr_barrelroll || state == 43 || state == 123 || state == 49 || state == 67 || state == 40 || state == 50 || state == 7 || state == 21 || state == 155)
        {
            if (place_meeting(x + hsp, y, obj_destructibles))
            {
                with (instance_place(x + hsp, y, obj_destructibles))
                {
                    gamepad_vibrate_constant(0.8, 0.5);
                    instance_destroy();
                }
                
                if (state == 106)
                    machpunchAnim = 0;
            }
        }
        
        if (state == 109 && thrown == true)
        {
            if (place_meeting(x - hsp, y, obj_destructibles))
            {
                with (instance_place(x - hsp, y, obj_destructibles))
                {
                    gamepad_vibrate_constant(0.8, 0.5);
                    instance_destroy();
                }
            }
        }
        
        if ((state == 49 || state == 256 || state == 12 || state == 167 || state == 78 || state == 21 || (state == 56 && bombup_dir == 1)) && vsp > 0)
        {
            if (place_meeting(x, y + 1, obj_destructibles))
            {
                with (instance_place(x, y + 1, obj_destructibles))
                {
                    gamepad_vibrate_constant(0.8, 0.5);
                    instance_destroy();
                }
                
                if (state == 12 || state == 256)
                {
                    with (instance_place(x, y + 1, obj_tntblock))
                    {
                        gamepad_vibrate_constant(0.8, 0.5);
                        instance_destroy();
                    }
                    
                    if (vsp > -11)
                        vsp = -11;
                    
                    jumpstop = 0;
                }
            }
        }
        
        var num = instance_place_list(x, y + 1, obj_destructibleplatform, global.instancelist, 0);
        
        for (var k = 0; k < num; k++)
        {
            with (ds_list_find_value(global.instancelist, k))
            {
                falling = 1;
                
                if (falling == 1)
                    image_speed = 0.35;
            }
        }
        
        ds_list_clear(global.instancelist);
        
        if (vsp <= 0.5 && (state == 94 || state == 194 || state == 123 || state == 106 || state == 267 || state == 60 || (state == 56 && bombup_dir == -1) || state == 82 || state == 39 || state == 11 || state == 99 || state == 24 || state == 123 || (state == 82 && (sprite_index == spr_player_breakdanceuppercut || sprite_index == spr_player_breakdanceuppercutend))))
        {
            var vy = -1;
            
            if (place_meeting(x, y + vy, obj_destructibles))
            {
                with (instance_place(x, y + vy, obj_destructibles))
                {
                    gamepad_vibrate_constant(1, 0.5);
                    instance_destroy();
                    
                    with (other)
                    {
                        if (state != 99 && state != 82 && state != 39)
                            vsp = 0;
                        
                        if (state == 99)
                            vsp = -11;
                    }
                }
            }
        }
        
        if (vsp >= 0 && (state == 110 || state == 78 || state == 113 || state == 199 || (state == 200 && vsp >= 0) || (state == 167 && vsp >= 10)))
        {
            scr_destroy_destructibles(0, vsp + 2);
            scr_destroy_destructibles(0, vsp);
            scr_destroy_destructibles(0, 2);
            scr_destroy_destructibles(0, 1);
        }
        
        if (state == 110 || state == 78 || state == 113 || state == 167)
        {
            if (freefallsmash >= 10 || state == 167)
            {
                scr_destroy_destructibles(0, vsp + 2, obj_metalblock);
                scr_destroy_destructibles(0, vsp, obj_metalblock);
                scr_destroy_destructibles(0, 2, obj_metalblock);
                scr_destroy_destructibles(0, 1, obj_metalblock);
            }
        }
    }
}
