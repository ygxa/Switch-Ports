function state_player_costumegrab()
{
    move = key_left + key_right;
    hsp = movespeed;
    
    if (move != 0)
    {
        if (abs(movespeed) < 12)
            movespeed = approach(movespeed, move * 12, 1.5);
        else
            movespeed = approach(movespeed, move * abs(movespeed), 1);
        
        dir = move;
    }
    
    if (sprite_index == spr_player_PN_fastfall_bounce_start && sprite_animation_end())
    {
        sprite_index = spr_player_PN_fastfall_bounce;
        image_index = 0;
    }
    
    if (grounded && key_attack && vsp > 0)
    {
        if (dir != 0)
            xscale = dir;
        else
            xscale *= -1;
        
        movespeed = 13;
        instance_create(x, y, obj_jumpdust, 
        {
            playerID: id
        });
        
        if (key_down)
        {
            state = 12;
            image_index = 0;
            mach3Roll = mach3RollMax;
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
        if (dir != 0)
            xscale = dir;
        else
            xscale *= -1;
        
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
    
    if (!can_jump && key_up && !noglider && inputBufferJump > 0 && !key_down && global.playerCharacter == 1 && !global.blastmode)
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
    
    if (key_down)
    {
        if (vsp < 16)
            vsp = 16;
    }
    
    do_grab(78);
    do_taunt(78);
    image_speed = 0.35;
}
