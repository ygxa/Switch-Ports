var px = x;
var py = y;
var surfXoff, surfYoff;

if (glowAmount != 0)
{
    surfXoff = x - 152;
    surfYoff = y - 116;
    x = 76;
    y = 58;
    
    if (glowSurface == -1 || !surface_exists(glowSurface))
        glowSurface = surface_create(256, 256);
    
    surface_set_target(glowSurface);
    draw_clear_alpha(c_black, 0);
}
else
{
    glowSiner = 0;
    
    if (glowSurface != -1 && surface_exists(glowSurface))
    {
        surface_free(glowSurface);
        glowSurface = -1;
    }
}

actor_shake_visual();

if (swiping)
{
    var ind = floor(swipeIndex);
    var xOff = 0;
    var headY = 0;
    
    switch (swipeDir)
    {
        case 3:
            switch (ind)
            {
                case 1:
                    xOff = -6;
                    break;
                
                case 2:
                    xOff = -8;
                    break;
                
                case 3:
                    xOff = 4;
                    break;
                
                case 4:
                case 5:
                case 6:
                    xOff = 2;
                    break;
            }
            
            draw_sprite_ext(faceSprite, 0, x + 10 + xOff, y + headY, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
            
            if (sweatInd != -1)
                draw_sprite_ext(spr_cbfaceb3_sweat, sweatInd, x + 10 + xOff, y + headY, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
            
            if (faceSprite == spr_cbfaceb3_eyeflash)
                draw_sprite_ext(spr_cbfaceb3_eyeflash_flash, floor(eyeFlashInd), x + 10 + xOff, y + headY, image_xscale, image_yscale, image_angle, c_white, image_alpha);
            
            draw_sprite_ext(spr_cb_swipe_right, ind, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
            break;
        
        case 2:
            switch (ind)
            {
                case 0:
                    xOff = 2;
                    break;
                
                case 1:
                    xOff = 4;
                    break;
                
                case 2:
                    xOff = -8;
                    break;
                
                case 3:
                    xOff = -6;
                    break;
            }
            
            draw_sprite_ext(faceSprite, 0, x + 10 + xOff, y + headY, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
            
            if (sweatInd != -1)
                draw_sprite_ext(spr_cbfaceb3_sweat, sweatInd, x + 10 + xOff, y + headY, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
            
            if (faceSprite == spr_cbfaceb3_eyeflash)
                draw_sprite_ext(spr_cbfaceb3_eyeflash_flash, floor(eyeFlashInd), x + 10 + xOff, y + headY, image_xscale, image_yscale, image_angle, c_white, image_alpha);
            
            draw_sprite_ext(spr_cb_swipe_left, ind, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
            break;
        
        case 1:
            switch (ind)
            {
                case 0:
                    headY = -2;
                    break;
                
                case 1:
                    headY = -6;
                    break;
                
                case 2:
                    headY = 2;
                    break;
                
                case 3:
                    headY = 4;
                    break;
                
                case 4:
                case 5:
                case 6:
                    headY = 2;
                    break;
            }
            
            draw_sprite_ext(faceSprite, 0, x + 10 + xOff, y + headY, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
            
            if (sweatInd != -1)
                draw_sprite_ext(spr_cbfaceb3_sweat, sweatInd, x + 10 + xOff, y + headY, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
            
            if (faceSprite == spr_cbfaceb3_eyeflash)
                draw_sprite_ext(spr_cbfaceb3_eyeflash_flash, floor(eyeFlashInd), x + 10 + xOff, y + headY, image_xscale, image_yscale, image_angle, c_white, image_alpha);
            
            draw_sprite_ext(spr_cb_swipe_down, ind, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
            break;
        
        case 0:
            switch (ind)
            {
                case 0:
                    headY = 2;
                    break;
                
                case 1:
                    headY = 4;
                    break;
                
                case 2:
                    headY = 2;
                    break;
                
                case 3:
                    headY = -6;
                    break;
                
                case 4:
                case 5:
                case 6:
                    headY = -2;
                    break;
            }
            
            draw_sprite_ext(faceSprite, 0, x + 10 + xOff, y + headY, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
            
            if (sweatInd != -1)
                draw_sprite_ext(spr_cbfaceb3_sweat, sweatInd, x + 10 + xOff, y + headY, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
            
            if (faceSprite == spr_cbfaceb3_eyeflash)
                draw_sprite_ext(spr_cbfaceb3_eyeflash_flash, floor(eyeFlashInd), x + 10 + xOff, y + headY, image_xscale, image_yscale, image_angle, c_white, image_alpha);
            
            draw_sprite_ext(spr_cb_swipe_up, ind, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
            break;
    }
}
else
{
    if (sprite_index == spr_cb_shootattack)
        draw_sprite_ext(spr_cb_shootattack_cape, floor(capeIndex), x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    
    if (fightingStance)
    {
        if (sprite_index == spr_cb_fakeattack)
        {
            draw_self();
            draw_sprite_ext(spr_cb_fakeattack_blaster, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
        }
        else
        {
            var headY = cos(shmoveCounter / 4);
            var armRY = sin(shmoveCounter / 5) * 2;
            var armLY = cos(shmoveCounter / 5) * 2;
            var xOff = cos(shmoveCounter / 8) + 1;
            var torsoY = sin(shmoveCounter / 4);
            draw_sprite_ext(spr_cb_fighting_cape, 0, (x - 20) + xOff, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
            draw_sprite_ext(spr_cb_fighting_legs, 0, x - 20, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
            draw_sprite_ext(spr_cb_fighting_torso, 0, (x - 20) + xOff, y + torsoY, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
            draw_sprite_ext(spr_cb_fighting_armr, 0, (x - 20) + xOff, y + armRY, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
            draw_sprite_ext(spr_cb_fighting_arml, 0, (x - 20) + xOff, y + armLY, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
            draw_sprite_ext(faceSprite, 0, ((x + 36) - 20) + xOff, y + headY, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        }
    }
    else if (!shmoving)
    {
        if (sprite_index == spr_cb_sitting)
            draw_sprite_ext(faceSprite, 0, x + 6, y + 16, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        
        draw_self();
        
        if (sprite_index == spr_cb_fakeattack)
            draw_sprite_ext(spr_cb_fakeattack_blaster, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
        else if (sprite_index == spr_cb_cutout)
            draw_sprite_ext(spr_cb_cutout_blaster, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
    }
    else
    {
        var xOff = noHorzBob ? 0 : cos(shmoveCounter / 8);
        var yOff = sin(shmoveCounter / 4);
        var headY = cos(shmoveCounter / 4);
        draw_sprite_ext(spr_cb_cape, 0, x + xOff, y + yOff, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        draw_sprite_ext(spr_cb_legs, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        draw_sprite_ext(spr_cb_body, 1, x + xOff, y + yOff, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        draw_sprite_ext(faceSprite, 0, x + 6 + xOff, y + headY, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        
        if (sweatInd != -1)
            draw_sprite_ext(spr_cbfaceb3_sweat, sweatInd, x + 6 + xOff, y + headY, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        
        if (faceSprite == spr_cbfaceb3_eyeflash)
            draw_sprite_ext(spr_cbfaceb3_eyeflash_flash, floor(eyeFlashInd), x + 6 + xOff, y + headY, image_xscale, image_yscale, image_angle, c_white, image_alpha);
        
        draw_sprite_ext(spr_cb_body, bodyIndex, x + xOff, y + yOff, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    }
    
    if (sprite_index == spr_cb_shootattack)
        draw_sprite_ext(spr_cb_shootattack_blaster, image_index, x, y, image_xscale, image_yscale, image_angle, (attackType == 23) ? #14A9FF : #ED1C24, image_alpha);
}

if (glowAmount != 0)
{
    surface_reset_target();
    var s = sin(glowSiner);
    gpu_set_fog(true, #7777FF, 0, 0);
    var scale = 1.1 + (s * 0.1);
    var extraOffset = ((256 * scale) - 256) * 0.5;
    draw_surface_ext(glowSurface, (x + surfXoff) - extraOffset, (y + surfYoff) - extraOffset, scale, scale, 0, c_white, ((s * 0.15) + 0.3) * glowAmount);
    scale = 1 + (s * 0.1);
    extraOffset = ((256 * scale) - 256) * 0.5;
    draw_surface_ext(glowSurface, (x + surfXoff) - extraOffset, (y + surfYoff) - extraOffset, scale, scale, 0, c_white, ((s * 0.25) + 0.4) * glowAmount);
    gpu_set_fog(false, c_black, 0, 0);
    draw_surface(glowSurface, x + surfXoff, y + surfYoff);
    gpu_set_fog(true, c_white, 0, 0);
    draw_surface_ext(glowSurface, x + surfXoff, y + surfYoff, 1, 1, 0, c_white, ((s * 0.2) + 0.2) * glowAmount);
    gpu_set_fog(false, c_black, 0, 0);
}

x = px;
y = py;

if (global.debug)
{
    if (fightType == 2 && keyboard_check(vk_f3))
    {
        draw_set_color(c_red);
        draw_set_font(fnt_main);
        draw_text(x, y, obj_battlemanager.statsKarmaHandler.karma);
    }
}
