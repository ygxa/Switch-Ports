function state_player_costumebreeze()
{
    static spin_effect = 5;
    
    move = key_left + key_right;
    hsp = movespeed;
    
    if (move != 0)
    {
        if (abs(movespeed) < 12)
            movespeed = approach(movespeed, move * 12, 1.5);
        else
            movespeed = approach(movespeed, move * abs(movespeed), 1);
        
        dir = move;
        dir = move;
        xscale = move;
    }
    else
    {
        movespeed = approach(movespeed, 0, 0.25);
    }
    
    if (grounded && key_attack && vsp > 0)
    {
        movespeed = 13;
        instance_create(x, y, obj_jumpdust, 
        {
            playerID: id
        });
        
        if (key_down)
        {
            state = 12;
            image_index = 0;
            sprite_index = spr_machroll3intro;
            
            if (!grounded)
            {
                sprite_index = spr_dive;
                fmod_studio_event_instance_start(sndDive);
            }
        }
        else
        {
            state = 33;
            sprite_index = spr_mach3player;
        }
    }
    else if (grounded && ((move == 0 && !key_attack) || !key_attack) && vsp > 0)
    {
        movespeed = abs(hsp);
        landAnim = 1;
        
        if (move != 0)
            sprite_index = spr_land2;
        else
            sprite_index = spr_land;
        
        state = 1;
        jumpStop = 0;
        image_index = 0;
        instance_create_depth(x, y, 0, obj_landcloud);
    }
    
    if ((key_up || key_up2) && inputBufferSlap > 0)
    {
        inputBufferSlap = 0;
        dir = xscale;
        movespeed = hsp;
        vsp = grounded ? -18 : -14;
        grav = 0;
        state = 48;
        flash = false;
        sprite_index = spr_uppercutbegin;
        image_index = 0;
        event_play_oneshot("event:/SFX/player/uppercut", x, y);
        
        with (instance_create(x, y, obj_puffEffect))
            sprite_index = spr_highJumpCloud1;
    }
    
    if (key_down && !place_meeting_collision(x, y + vsp))
    {
        create_particle(x, y, spr_groundPoundClouds);
        state = 37;
        image_index = 0;
        sprite_index = spr_player_PN_fastfall;
        movespeed = 0;
        
        if (vsp < 16)
            vsp = 16;
        
        dir = xscale;
        verticalMovespeed = vsp;
        freeFallSmash = 0;
        buffedpoundcancel = 1;
    }
    
    if ((key_attack2 || inputBufferSlap > 0) && !key_up && sprite_index != spr_player_PZ_fall_outOfControl && sprite_index != spr_superspring && sprite_index != spr_player_PN_wallBounce_cancel_start)
    {
        image_index = 0;
        fmod_studio_event_instance_start(sndSuplex);
        
        if (move != 0)
            xscale = move;
        
        sprite_index = spr_player_PN_wallBounce_cancel_start;
        movespeed = 13;
        vsp = -5;
        state = 33;
        
        with (create_particle(x, y, spr_crazyRunHoopEffect))
            image_xscale = other.xscale;
        
        instance_create(x, y, obj_jumpdust);
        inputBufferSlap = 0;
    }
    
    if (!can_jump && key_up && !noglider && inputBufferJump > 0 && !key_down && !global.blastmode)
    {
        fmod_studio_event_instance_start(sndCrouchslide);
        instance_create(x, y, obj_highJumpCloud1, 
        {
            playerID: id
        });
        
        if (!instance_exists(obj_verticalHoopEffect))
        {
            instance_create(x, y, obj_verticalHoopEffect, 
            {
                playerID: id,
                image_angle: 90
            });
        }
        
        inputBufferJump = 0;
        
        if (move != 0)
            xscale = move;
        
        movespeed = abs(hsp);
        nodivejump = 0;
        divejumped = 0;
        gliderminus = 0;
        state = 77;
        sprite_index = spr_player_PN_glider_up_start;
        image_index = 0;
        vsp = -18;
    }
    
    if (spin_effect > 0)
    {
        spin_effect--;
    }
    else
    {
        spin_effect = 5;
        instance_create(x + random_range(5, -5), y + random_range(20, -20), obj_spineffect);
    }
    
    image_speed = 0.5;
    do_taunt(79);
}
