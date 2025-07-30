function scr_hurtplayer(argument0 = 147)
{
    if (argument0.state != 90 && argument0.state != 70)
    {
        with (argument0)
        {
            if ((state == 17 || state == 18 || state == 11) && cutscene == 0)
                continue;
            
            if (sprite_index == spr_player_supertaunt1 || sprite_index == spr_player_supertaunt2 || sprite_index == spr_player_supertaunt3)
                continue;
            
            if (state == 98)
            {
                sprite_index = spr_player_mach3hitwall;
                state = 69;
                hsp = 2.5 * xscale;
                vsp = -3;
                mach2 = 0;
                image_index = 0;
                instance_create(x, y, obj_bombexplosionharmless);
                
                for (var i = 0; i < (sprite_get_number(spr_minecartdebris) - 1); i++)
                {
                    with (instance_create(x + irandom_range(-9, 9), y + irandom_range(-9, obj_gnome), obj_debris))
                    {
                        sprite_index = spr_minecartdebris;
                        image_index = i;
                        vsp = floor(random_range(-5, -9));
                        hsp = floor(random_range(-5, 7));
                    }
                }
            }
            else if (state == 20 && hurted == 0)
            {
            }
            else if (state == 8)
            {
            }
            else if (state == 5 || state == 7)
            {
            }
            else if (state != 70 && state != 43 && hurted == 0 && cutscene == 0 && state != 69 && state != 93)
            {
                scr_sound(74);
                global.hurtcounter += 1;
                state = 70;
                alarm[8] = 60;
                alarm[7] = 120;
                hurted = 1;
                
                if (xscale == other.image_xscale)
                    sprite_index = spr_hurtjump;
                else
                    sprite_index = spr_hurt;
                
                movespeed = 8;
                vsp = -5;
                timeuntilhpback = 300;
                global.combotime = clamp(global.combotime - 0.25, 0, 60);
                var _oldcollect = global.collect;
                
                if (global.collect > 100)
                    global.collect -= 100;
                else
                    global.collect = 0;
                
                var _repeat = clamp(round((_oldcollect - global.collect) / 10), 0, 15);
                
                if (global.collect > 0)
                {
                    create_small_number(x, y, string(global.collect - _oldcollect), 1);
                    
                    repeat (_repeat)
                        instance_create(x, y, obj_pizzaloss);
                }
                else if (argument0.shotgunAnim == 1)
                {
                    argument0.shotgunAnim = 0;
                }
                
                instance_create(x, y, obj_spikehurteffect);
                image_index = 0;
                flash = 1;
                global.style -= 15;
            }
        }
    }
}
