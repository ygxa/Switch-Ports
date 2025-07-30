function scr_player_jump()
{
    move = key_left + key_right;
    
    if (momemtum == 0)
        hsp = move * movespeed;
    else
        hsp = xscale * movespeed;
    
    if (move != xscale && momemtum == 1 && movespeed != 0)
        movespeed = approach(movespeed, 0, 0.1);
    
    if (movespeed <= 0)
        momemtum = 0;
    
    if ((move == 0 && momemtum == 0) || scr_solid(x + hsp, y))
    {
        movespeed = 0;
        mach2 = 0;
    }
    
    if (move != 0 && movespeed < 7)
        movespeed += 0.5;
    
    if (movespeed > 7)
        movespeed -= 0.1;
    
    if ((scr_solid(x + 1, y) && move == 1) || (scr_solid(x - 1, y) && move == -1))
        movespeed = 0;
    
    if (dir != xscale)
    {
        mach2 = 0;
        dir = xscale;
        movespeed = 0;
    }
    
    if (move == -xscale)
    {
        mach2 = 0;
        movespeed = 0;
        momemtum = 0;
    }
    
    landAnim = 1;
    
    if (!key_jump2 && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
    {
        vsp /= 5;
        jumpstop = 1;
    }
    
    if (ladderbuffer > 0)
        ladderbuffer--;
    
    if (scr_solid(x, y - 1) && jumpstop == 0 && jumpAnim == 1)
    {
        vsp = grav;
        jumpstop = 1;
    }
    
    if (grounded && input_buffer_jump < 8 && !key_down && !key_attack && vsp > 0 && !(sprite_index == spr_player_facestomp || sprite_index == spr_player_freefall))
    {
        scr_sound(46);
        sprite_index = spr_jump;
        
        if (shotgunAnim == 1)
            sprite_index = spr_shotgun_jump;
        
        instance_create_depth(x, y, -6, obj_highjumpcloud2);
        stompAnim = 0;
        vsp = -11;
        state = 57;
        jumpAnim = 1;
        jumpstop = 0;
        image_index = 0;
        freefallstart = 0;
        instance_create_depth(x, y, 0, obj_landcloud);
    }
    
    if (key_attack && grounded && fallinganimation < 40 && !charged)
    {
        mach2 = 0;
        
        if (movespeed < 6)
            movespeed = 6;
        
        sprite_index = spr_mach1;
        jumpAnim = 1;
        state = 65;
        image_index = 0;
    }
    
    if (key_attack && character == "N" && charged)
    {
        sprite_index = spr_pizzano_sjumpprepside;
        image_index = 0;
        movespeed = 0;
        mach2 = 0;
        charged = 0;
        state = 101;
    }
    
    if (key_up && character == "N" && charged)
    {
        alarm[0] = 240;
        sprite_index = spr_pizzano_sjumpprep;
        image_index = 0;
        movespeed = 0;
        mach2 = 0;
        state = 60;
    }
    
    if (key_attack && grounded && fallinganimation < 40 && character == "DEEZNUTS")
    {
        mach2 = 0;
        movespeed = 0;
        sprite_index = spr_null;
        jumpAnim = 1;
        state = 102;
        image_index = 0;
    }
    
    if (grounded && vsp > 0 && !key_attack)
    {
        if (key_attack)
            landAnim = 0;
        
        input_buffer_secondjump = 0;
        state = 0;
        jumpAnim = 1;
        jumpstop = 0;
        image_index = 0;
        freefallstart = 0;
        instance_create_depth(x, y, 0, obj_landcloud);
        scr_sound(63);
        doublejumped = 0;
    }
    
    if (key_jump)
        input_buffer_jump = 0;
    
    if (character == "P")
    {
        if (vsp > 5)
            fallinganimation++;
        
        if ((fallinganimation >= 40 && fallinganimation < 80) && sprite_index != spr_player_candyup)
            sprite_index = spr_player_freefall;
        
        if ((fallinganimation >= 40 && fallinganimation < 80) && sprite_index == spr_player_candyup)
        {
            sprite_index = spr_player_freefall;
            
            if (!instance_exists(obj_candifiedeffect1))
                instance_create(x, y, obj_candifiedeffect1);
        }
        
        if (fallinganimation >= 80)
            sprite_index = spr_player_freefall2;
    }
    
    if (stompAnim == 0)
    {
        if (jumpAnim == 1)
        {
            if (floor(image_index) == (image_number - 1))
                jumpAnim = 0;
        }
        
        if (jumpAnim == 0)
        {
            if (sprite_index == spr_airdash1)
                sprite_index = spr_airdash2;
            
            if (sprite_index == spr_player_suplexdashCancel)
                sprite_index = spr_fall;
            
            if (sprite_index == spr_jump)
                sprite_index = spr_fall;
        }
    }
    
    if (stompAnim == 1)
    {
        if (sprite_index == spr_stompprep && floor(image_index) == (image_number - 1))
            sprite_index = spr_stomp;
    }
    
    if (key_attack && sprite_index != spr_airdash2 && sprite_index != spr_airdash1 && fallinganimation < 40 && sprite_index != spr_playerN_glide && character == "P")
    {
        stompAnim = 0;
        sprite_index = spr_airdash1;
        image_index = 0;
    }
    
    if (key_slap2 && shotgunAnim == 1 && global.ammo > 0)
    {
        global.ammo -= 1;
        vsp -= 11;
        sprite_index = spr_player_shotgunjump1;
        state = 31;
        image_index = 0;
    }
    
    if (move != 0)
        xscale = move;
    
    image_speed = 0.35;
    
    if (key_slap2 && shotgunAnim == 1 && !instance_exists(obj_cutscene_upstairs))
    {
        global.ammo -= 1;
        sprite_index = spr_shotgun_shootair;
        state = 31;
        image_index = 0;
    }
    
    if (key_slap2 && key_up && suplexmove == false)
    {
        grounded = false;
        vsp = -9;
        state = 86;
        suplexmove = true;
        sprite_index = spr_player_uppercutbegin;
        image_index = 0;
        scr_sound(13);
        scr_sound(69);
    }
    
    if ((!key_down && key_slap2 && suplexmove == 0 && shotgunAnim == 0 && global.cane == 0) && character == "P")
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
    
    if ((!key_down && key_slap2 && suplexmove == 0 && shotgunAnim == 0) && sprite_index != spr_airdash1 && sprite_index != spr_airdash2 && character == "N")
    {
        scr_sound(69);
        instance_create(x, y, obj_slaphitbox);
        suplexmove = 1;
        vsp = 0;
        instance_create(x, y, obj_jumpdust);
        image_index = 0;
        sprite_index = spr_pizzano_shoulderbash;
        state = 112;
        movespeed = 10;
    }
    
    if (grounded && (sprite_index == spr_player_facestomp || sprite_index == spr_player_freefall || sprite_index == spr_player_freefall2))
    {
        scr_sound(51);
        
        with (obj_baddie)
        {
            if (bbox_in_camera(view_camera[0]) && grounded)
            {
                vsp = -7;
                hsp = 0;
            }
        }
        
        with (obj_camera)
        {
            shake_mag = 10;
            shake_mag_acc = 30 / room_speed;
        }
        
        image_index = 0;
        sprite_index = spr_player_freefallland;
        state = 72;
        doublejumped = 0;
    }
    
    if (key_taunt2)
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
    
    if (key_down2 && global.cane == 0)
    {
        image_index = 0;
        state = 50;
        sprite_index = spr_player_bodyslamstart;
        vsp = -5;
    }
    
    if (global.cane == 1)
    {
        if (!grounded)
            canrebound = 0;
        
        if (key_down2)
        {
            image_index = 0;
            state = 71;
            sprite_index = spr_caneslam;
            vsp = -18;
        }
        
        if (!key_down && key_slap2 && suplexmove == 0 && shotgunAnim == 0)
        {
            scr_sound(69);
            instance_create(x, y, obj_slaphitbox);
            suplexmove = 1;
            vsp = 0;
            instance_create(x, y, obj_jumpdust);
            image_index = 0;
            sprite_index = spr_canesuplex;
            state = 15;
        }
    }
    
    if (sprite_index == spr_caneslam)
    {
        vsp = 17;
        
        if (!instance_exists(obj_mach3effect))
            instance_create(x, y - 32, obj_mach3effect);
    }
    
    if (key_jump && character == "G" && !grounded && gumbobpropellercooldown == 0)
    {
        state = 109;
        sprite_index = spr_gumbob_propeller_start;
        movespeed = 0;
        vsp = 0;
    }
    
    if (key_jump && character == "N" && !grounded && doublejumped == 0 && !scr_solid(x + xscale, y, true))
    {
        doublejumped = 1;
        vsp = -10;
        sprite_index = spr_pizzano_djump;
    }
    
    if (key_jump && character == "N" && !grounded && scr_solid(x + xscale, y, true))
    {
        hsp = 0;
        vsp = 0;
        state = 113;
        sprite_index = spr_pizzano_wallcling;
    }
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_candytransitionup)
        sprite_index = spr_player_candyup;
}
