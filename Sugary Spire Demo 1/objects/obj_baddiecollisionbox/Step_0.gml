if (!instance_exists(baddieID))
    instance_destroy();

if (instance_exists(baddieID))
{
    x = baddieID.x;
    y = baddieID.y;
    image_xscale = baddieID.image_xscale;
}

if (instance_exists(baddieID) && place_meeting(x, y, obj_player) && obj_player.cutscene == 0 && obj_player.state != 70)
{
    if (baddieID.state != 8)
    {
        with (obj_player)
        {
            if (instakillmove == 1 && other.baddieID.object_index != obj_pizzaball)
            {
                instance_destroy(other.baddieID);
                instance_destroy(other.id);
                global.hit += 1;
                global.combotime = 60;
                
                if (!grounded && state != 71 && key_jump2)
                {
                    suplexmove = 0;
                    vsp = -11;
                }
            }
            
            if (state == 95 && movespeed <= 8)
            {
                if (!audio_is_playing(sound_bump))
                    scr_sound(4);
                
                other.baddieID.stuntouch = 50;
                other.baddieID.state = 6;
                
                if (other.baddieID.stunned < 100)
                    other.baddieID.stunned = 100;
                
                other.baddieID.image_xscale = -xscale;
                other.baddieID.hsp = -other.baddieID.image_xscale * 5;
                other.baddieID.vsp = -4;
            }
            
            if (instance_exists(other.baddieID) && y < other.baddieID.y && attacking == 0 && state == 57 && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_stompprep)
            {
                scr_sound(40);
                suplexmove = 0;
                
                if (other.baddieID.object_index == obj_pizzaball)
                    global.golfhit += 1;
                
                if (vsp > 0)
                {
                    other.baddieID.squashed = true;
                    other.baddieID.squashval = 0;
                    other.baddieID.stunned = 200;
                    
                    if (x != other.baddieID.x)
                        other.baddieID.image_xscale = -sign(other.baddieID.x - x);
                    
                    image_index = 0;
                    
                    if (key_jump2)
                    {
                        other.baddieID.vsp = -5;
                        other.baddieID.hsp = -other.baddieID.image_xscale * 3;
                        instance_create(x, y + 50, obj_stompeffect);
                        other.baddieID.state = 6;
                        stompAnim = 1;
                        other.baddieID.image_index = 0;
                        vsp = -14;
                        sprite_index = spr_stompprep;
                    }
                    else
                    {
                        other.baddieID.vsp = -5;
                        other.baddieID.hsp = -other.baddieID.image_xscale * 3;
                        instance_create(x, y + 50, obj_stompeffect);
                        other.baddieID.state = 6;
                        stompAnim = 1;
                        other.baddieID.image_index = 0;
                        vsp = -9;
                        sprite_index = spr_stompprep;
                    }
                }
            }
            
            if (instance_exists(other.baddieID) && state == 85 && sprite_index == spr_cotton_attack)
            {
                with (other.baddieID)
                {
                    cottoned = true;
                    alarm[2] = 1;
                    instance_create(x, y, obj_bangeffect);
                    scr_sound(59);
                    hp = 0;
                    thrown = true;
                    hsp = obj_player.xscale * 20;
                    vsp = -6;
                    state = 6;
                    stunned = 500;
                }
            }
            
            if (instance_exists(other.baddieID) && instakillmove == 0 && other.baddieID.vsp > 0 && state != 70 && state != 34 && state != 84 && state != 15)
            {
                if (other.baddieID.stuntouch <= 0)
                {
                    scr_sound(4);
                    other.baddieID.stuntouch = 50;
                    other.baddieID.state = 6;
                    
                    if (other.baddieID.stunned < 100)
                        other.baddieID.stunned = 100;
                    
                    if (x != other.baddieID.x)
                        other.baddieID.image_xscale = -sign(other.baddieID.x - x);
                    
                    other.baddieID.hsp = -other.baddieID.image_xscale * 2;
                    other.baddieID.vsp = -5;
                }
            }
            
            if (instance_exists(other.baddieID) && state == 65)
            {
                if (other.baddieID.object_index == obj_pizzaball)
                    global.golfhit += 1;
                
                global.hit += 1;
                global.combotime = 60;
                instance_create(other.baddieID.x, other.baddieID.y, obj_slapstar);
                instance_create(other.baddieID.x, other.baddieID.y, obj_baddiegibs);
                other.baddieID.flash = 1;
                other.baddieID.hp = 0;
                scr_sound(41);
                instance_create(x, y, obj_bumpeffect);
                other.baddieID.stunned = 200;
                
                if (x != other.baddieID.x)
                    other.baddieID.image_xscale = -sign(other.baddieID.x - x);
                
                other.baddieID.vsp = -5;
                other.baddieID.hsp = -other.baddieID.image_xscale * 5;
                hsp = -xscale * 4;
                vsp = -4;
                machpunchAnim = true;
                
                if (x != other.baddieID.x)
                    other.baddieID.image_xscale = -sign(other.baddieID.x - x);
                
                other.baddieID.state = 6;
                image_index = 0;
                state = 54;
                
                if (other.baddieID.hp == 0 && other.baddieID.object_index != obj_boss)
                {
                    instance_destroy(other.id);
                    instance_destroy(other.baddieID);
                }
                else if (other.baddieID.hp <= 0 && other.baddieID.object_index == obj_boss)
                {
                    other.baddieID.thrown = 1;
                    vsp = -5;
                }
            }
            
            if (instance_exists(other.baddieID) && (state == 66 || state == 101 || state == 112) && other.baddieID.grounded == 1)
            {
                if (other.baddieID.object_index == obj_pizzaball)
                    global.golfhit += 1;
                
                global.hit += 1;
                global.combotime = 60;
                instance_create(other.baddieID.x, other.baddieID.y, obj_slapstar);
                instance_create(other.baddieID.x, other.baddieID.y, obj_baddiegibs);
                other.baddieID.flash = 1;
                other.baddieID.hp = 0;
                scr_sound(41);
                instance_create(x, y, obj_bumpeffect);
                other.baddieID.vsp = -10;
                other.baddieID.hsp = xscale;
                other.baddieID.image_index = 0;
                machpunchAnim = true;
                other.baddieID.stunned = 200;
                other.baddieID.state = 6;
                
                if (!grounded && state != 71 && key_jump2)
                {
                    suplexmove = 0;
                    sprite_index = spr_mach2jump;
                    vsp = -11;
                }
                
                if (other.baddieID.hp == 0 && other.baddieID.object_index != obj_boss)
                {
                    instance_destroy(other.baddieID);
                    instance_destroy(other.id);
                }
                else if (other.baddieID.hp <= 0 && other.baddieID.object_index == obj_boss)
                {
                    other.baddieID.thrown = 1;
                    vsp = -5;
                }
            }
            
            if (instance_exists(other.baddieID) && other.baddieID.state != 1 && attacking == 0 && state != 54 && state != 70 && !y < other.baddieID.y && !y > other.baddieID.y && grabbing == 0 && other.baddieID.state != 6 && state != 15 && state != 2)
            {
                if (x != other.baddieID.x)
                {
                    other.baddieID.image_xscale = -sign(other.baddieID.x - x);
                    xscale = -sign(x - other.baddieID.x);
                }
                
                hsp = -xscale * 8;
                
                if (other.baddieID.object_index == obj_pizzaball)
                    global.golfhit += 1;
                
                vsp = -4;
                other.baddieID.image_xscale = -xscale;
                other.baddieID.hsp = -other.baddieID.image_xscale * 4;
                other.baddieID.vsp = -4;
                
                if (other.baddieID.state == 3 || other.baddieID.state == 2)
                    other.baddieID.state = 6;
                
                if (other.baddieID.state == 87)
                {
                    stunned = 30;
                    other.baddieID.state = 6;
                }
                
                image_index = 0;
                state = 69;
                
                if (other.baddieID.state == 96)
                    other.baddieID.state = 6;
            }
            
            if (state == 15 && other.baddieID.object_index != obj_charcherry)
            {
                scr_sound(59);
                baddiegrabbedID = other.baddieID.id;
                
                with (other.baddieID)
                {
                    state = 8;
                    instance_create(x + (other.xscale * 40), y, obj_punchdust);
                }
                
                if (!key_up)
                {
                    state = 38;
                    sprite_index = spr_player_haulingstart;
                    image_index = 0;
                }
                else
                {
                    state = 34;
                    sprite_index = spr_player_piledriverstart;
                    
                    if (grounded)
                        vsp = -12;
                    else
                        vsp = -6;
                    
                    grounded = false;
                    image_index = 0;
                    image_speed = 0.35;
                }
            }
        }
    }
}

if (!instance_exists(baddieID))
    instance_destroy();
