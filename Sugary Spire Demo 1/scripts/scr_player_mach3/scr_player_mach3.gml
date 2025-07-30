function scr_player_mach3()
{
    switch (character)
    {
        case "P":
        case "N":
            if (grounded)
                Sjumpcan_doublejump = true;
            
            if (windingAnim < 2000)
                windingAnim++;
            
            if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
                hsp = xscale * movespeed;
            else if (place_meeting(x, y + 1, obj_railh))
                hsp = (xscale * movespeed) - 5;
            else if (place_meeting(x, y + 1, obj_railh2))
                hsp = (xscale * movespeed) + 5;
            
            mach2 = 100;
            momemtum = 1;
            move = key_right + key_left;
            move2 = key_right2 + key_left2;
            
            if (movespeed < 24 && move == xscale)
            {
                movespeed += 0.05;
                
                if (!instance_exists(obj_crazyruneffect))
                    instance_create(x, y, obj_crazyruneffect);
            }
            else if ((movespeed > 12 && move != xscale) && Dashpad_buffer <= 0)
            {
                movespeed -= 0.05;
            }
            
            crouchslideAnim = 1;
            
            if (!key_jump2 && jumpstop == 0 && vsp < 0.5)
            {
                vsp /= 2;
                jumpstop = 1;
            }
            
            if (grounded && vsp > 0)
                jumpstop = 0;
            
            if (input_buffer_jump < 8 && grounded && !(move == 1 && xscale == -1) && !(move == -1 && xscale == 1) && key_attack)
            {
                scr_sound(46);
                image_index = 0;
                sprite_index = spr_player_mach3jump;
                vsp = -9;
            }
            
            if (sprite_index == spr_player_mach3jump && floor(image_index) == (image_number - 1))
                sprite_index = spr_player_mach4;
            
            if (animation_end() && (sprite_index == spr_player_rollgetup || sprite_index == spr_player_dashpad))
                sprite_index = spr_player_mach4;
            
            if ((movespeed > 20 && sprite_index != spr_player_crazyrun) && sprite_index != spr_player_dive && sprite_index != spr_player_rollgetup)
            {
                flash = 1;
                sprite_index = spr_player_crazyrun;
            }
            
            if (sprite_index == spr_player_crazyrun && !instance_exists(obj_crazyrunothereffect))
                instance_create(x, y, obj_crazyrunothereffect);
            
            if (key_down)
                input_buffer_jump = 10000000000;
            else if (key_jump)
                input_buffer_jump = 0;
            
            if (key_up && sprite_index != spr_player_dashpad && sprite_index != spr_player_dive)
            {
                scr_sound(66);
                sprite_index = spr_player_superjumpprep;
                state = 61;
                hsp = 0;
                image_index = 0;
            }
            
            if ((!key_attack && grounded && sprite_index != spr_player_dashpad) && Dashpad_buffer <= 0)
            {
                scr_sound(17);
                sprite_index = spr_player_machslidestart;
                state = 68;
                image_index = 0;
                mach2 = 0;
            }
            
            if ((move != 0 && xscale != move && grounded) && Dashpad_buffer <= 0)
            {
                scr_sound(52);
                sprite_index = spr_player_machslideboost3;
                flash = 0;
                state = 68;
                image_index = 0;
                mach2 = 100;
            }
            
            if (key_down && !place_meeting(x, y, obj_dashpad) && !grounded && sprite_index != spr_player_dive)
            {
                flash = 0;
                state = 29;
                vsp = 15;
            }
            
            if (key_down && !place_meeting(x, y, obj_dashpad) && grounded)
            {
                flash = 0;
                state = 29;
            }
            
            if (sprite_index == spr_player_dive && grounded)
                sprite_index = spr_player_mach4;
            
            if (!key_down && sprite_index == spr_player_dive && !grounded)
            {
                vsp = 15;
                sprite_index = spr_player_mach4;
            }
            
            if (((!grounded || slopeCheck(x + xscale, y)) && scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_metalblock)) && character == "P")
            {
                wallspeed = clamp(movespeed, 12, 24);
                state = 10;
            }
            else if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_metalblock))
            {
                scr_sound(51);
                
                with (obj_camera)
                {
                    shake_mag = 20;
                    shake_mag_acc = 40 / room_speed;
                }
                
                image_speed = 0.35;
                
                with (obj_baddie)
                {
                    if (bbox_in_camera(view_camera[0]) && grounded)
                    {
                        stun = 1;
                        alarm[0] = 200;
                        ministun = 0;
                        vsp = -5;
                        hsp = 0;
                    }
                }
                
                flash = 0;
                combo = 0;
                sprite_index = spr_player_mach3hitwall;
                state = 69;
                hsp = -2.5 * xscale;
                vsp = -3;
                mach2 = 0;
                image_index = 0;
                instance_create(x + (10 * xscale), y + 10, obj_bumpeffect);
            }
            
            if (!instance_exists(obj_chargeeffect) && sprite_index != spr_player_dive)
                instance_create(x, y, obj_chargeeffect);
            
            if (!instance_exists(obj_superdashcloud) && grounded)
                instance_create(x, y, obj_superdashcloud);
            
            if (sprite_index == spr_player_mach4)
                image_speed = 0.4;
            
            if (sprite_index == spr_player_crazyrun)
                image_speed = 0.55;
            
            if (sprite_index == spr_player_rollgetup)
                image_speed = 0.35;
            
            if (sprite_index == spr_player_dashpad)
                image_speed = 0.3;
            
            if (key_taunt2 && sprite_index != spr_player_dive)
            {
                taunttimer = 20;
                tauntstoredmovespeed = movespeed;
                tauntstoredsprite = sprite_index;
                tauntstoredstate = state;
                state = 43;
                
                if (supertauntcharged == true && key_up)
                {
                    image_index = 0;
                    sprite_index = choose(spr_player_supertaunt1, spr_player_supertaunt2, spr_player_supertaunt3);
                }
                else
                {
                    image_index = irandom_range(0, sprite_get_number(spr_player_taunt));
                    sprite_index = spr_player_taunt;
                }
                
                instance_create(x, y, obj_taunteffect);
                
                with (obj_baddie)
                {
                    if (point_in_rectangle(x, y, obj_player.x - 480, obj_player.y - 270, obj_player.x + 480, obj_player.y + 270))
                        tauntBuffer = true;
                }
            }
            
            if (key_slap2 && !key_down && suplexmove == 0 && shotgunAnim == 0 && global.cane != 1)
            {
                scr_sound(69);
                instance_create(x, y, obj_slaphitbox);
                suplexmove = 1;
                vsp = 0;
                instance_create(x, y, obj_jumpdust);
                image_index = 0;
                sprite_index = spr_suplexdash;
                state = 15;
            }
            
            break;
    }
}
