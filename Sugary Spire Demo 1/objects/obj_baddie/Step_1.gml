switch (state)
{
    case 0:
        scr_enemy_idle();
        break;
    
    case 2:
        scr_enemy_turn();
        break;
    
    case 3:
        scr_enemy_walk();
        break;
    
    case 4:
        scr_enemy_land();
        break;
    
    case 5:
        scr_enemy_hit();
        break;
    
    case 1:
        scr_enemy_charge();
        break;
    
    case 6:
        scr_enemy_stun();
        break;
    
    case 10:
        visible = false;
        hsp = 0;
        vsp = 0;
        x = -900;
        y = -200;
        
        if (global.panic)
        {
            if (!instance_exists(escapePortal) && point_in_rectangle(xstart, ystart, obj_player.x - 900, obj_player.y - 250, obj_player.x + 900, obj_player.y + 250))
            {
                escapePortal = instance_create(xstart, ystart, obj_panicPortal);
                escapePortal.drawSprite = sprite_index;
                escapePortal.drawXscale = image_xscale;
                escapePortal.spr_palette = spr_palette;
                escapePortal.paletteselect = paletteselect;
            }
            
            if (instance_exists(escapePortal) && floor(escapePortal.image_index) >= 8)
            {
                instance_create(xstart, ystart, obj_poofeffect);
                visible = true;
                flash = true;
                state = 6;
                vsp = -5;
                squashed = true;
                squashval = 0;
                stunned = 10;
                x = xstart;
                y = ystart;
            }
        }
        
        break;
    
    case 7:
        scr_enemy_throw();
        break;
    
    case 8:
        scr_enemy_grabbed();
        break;
    
    case 9:
        scr_enemy_scared();
        break;
    
    case 11:
        scr_enemy_inhaled();
        break;
    
    case 12:
        scr_enemy_cherrywait();
        break;
    
    case 13:
        scr_enemy_charcherry();
        break;
    
    case 16:
        scr_enemy_slugidle();
        break;
    
    case 17:
        scr_enemy_slugjump();
        break;
    
    case 18:
        scr_enemy_slugparry();
        break;
    
    case 15:
        scr_enemy_kick();
        break;
    
    case 14:
        scr_applejim_bash();
        break;
}

if (y > (room_height + 64))
    instance_destroy();

if (state != 9)
    ScareBuffer = 0;

if (tauntBuffer == true)
{
    if (!instance_exists(tauntBufferEffect))
    {
        with (instance_create(x, y, obj_baddieangrycloud))
        {
            baddieID = other.id;
            other.tauntBufferEffect = id;
        }
    }
    
    if (obj_player.state != 43 && obj_player.state != 90)
    {
        tauntBuffer = false;
        bombreset = 0;
        stunned = 0;
        jumptimer = 0;
        ScareBuffer = 0;
    }
}
