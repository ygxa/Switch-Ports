function scr_player_tackle()
{
    collide_destructibles = function(_h, _v)
    {
        scr_destroy_horizontal(_h);
    };
    
    combo = 0;
    mach2 = 0;
    start_running = 1;
    jumpAnim = 1;
    dashAnim = 1;
    landAnim = 0;
    moveAnim = 1;
    stopAnim = 1;
    crouchslideAnim = 1;
    crouchAnim = 1;
    
    if (floor(image_index) == (image_number - 1) && sprite_index != spr_player_punchblock && sprite_index != spr_kungfu1 && sprite_index != spr_kungfu2 && sprite_index != spr_kungfu3)
        image_speed = 0;
    
    if (pummelpunch)
    {
        vsp = 0;
        
        if (pummeltimer == -6)
            state = states.normal;
        
        if (input_check_pressed("attack"))
            input_buffer_pummel = 0;
        
        if (input_check("down") && grounded && !pummeltimer)
        {
            suplexmove = 0;
            sprite_index = spr_crouchslip;
            machhitAnim = 0;
            state = states.crouchslide;
            movespeed = 15;
        }
        
        if (input_buffer_pummel != 6 && !pummeltimer)
        {
            suplexmove = 1;
            state = states.lunge;
            image_index = 0;
            sprite_index = spr_player_ragelunge;
            momemtum = 1;
            movespeed = 14;
        }
        
        pummeltimer--;
        
        if (!instance_exists(obj_pummeleffect))
            instance_create_depth(x + (xscale * 30), y, -5, obj_pummeleffect);
    }
    else
    {
        hsp = xscale * movespeed;
        
        if (floor(image_index) == (image_number - 1))
        {
            state = states.normal;
            shieldhurt = 0;
        }
        
        if (shieldhurt)
        {
            alarm[5] = 2;
            alarm[7] = 50;
        }
        
        if (movespeed > 0)
            movespeed -= 0.5;
        
        if (movespeed < 0)
            movespeed += 0.5;
        
        if (character == "P")
            image_speed = 0.35;
    }
}
