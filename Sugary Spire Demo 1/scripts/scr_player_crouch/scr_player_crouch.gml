function scr_player_crouch()
{
    move = key_left + key_right;
    
    if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
        hsp = move * movespeed;
    else if (place_meeting(x, y + 1, obj_railh))
        hsp = (move * movespeed) - 5;
    else if (place_meeting(x, y + 1, obj_railh2))
        hsp = (move * movespeed) + 5;
    
    mask_index = spr_crouchmask;
    turning = 0;
    movespeed = 4;
    
    if (!grounded && !key_jump)
    {
        jumpAnim = 0;
        state = 63;
        movespeed = 4;
        crouchAnim = 1;
        image_index = 0;
    }
    
    if (key_jump && grounded && !scr_solid(x, y - 16) && !scr_solid(x, y - 32))
    {
        scr_sound(46);
        vsp = -8;
        state = 63;
        movespeed = 4;
        image_index = 0;
        crouchAnim = 1;
        jumpAnim = 1;
    }
    
    if (grounded && !key_down && !scr_solid(x, y - 16) && !scr_solid(x, y - 32) && !key_jump)
    {
        state = 0;
        movespeed = 0;
        crouchAnim = 1;
        jumpAnim = 1;
        image_index = 0;
        mask_index = spr_player_mask;
    }
    
    if (crouchAnim == 0)
    {
        if (move == 0)
        {
            if (shotgunAnim == 0)
                sprite_index = spr_crouch;
            else
                sprite_index = spr_shotgun_duck;
        }
        
        if (move != 0)
            sprite_index = spr_crawl;
    }
    
    if (crouchAnim == 1)
    {
        if (move == 0)
        {
            if (shotgunAnim == 0)
                sprite_index = spr_couchstart;
            else
                sprite_index = spr_shotgun_goduck;
            
            if (floor(image_index) == (image_number - 1))
                crouchAnim = 0;
        }
    }
    
    if (move != 0)
    {
        xscale = move;
        crouchAnim = 0;
    }
    
    if (key_taunt2 && !scr_solid(x, y - 16) && !scr_solid(x, y - 32))
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
    }
    
    image_speed = 0.3;
}
