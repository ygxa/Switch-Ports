if (global.bev_subtype == 1)
{
    spared = true;
    
    with (obj_battleheart)
        visible = false;
    
    with (obj_battlemanager)
    {
        spareObjOverride = other.id;
        spareEvOverride = 10;
        battleTriggerEnd();
    }
    
    exit;
}

if (global.bev_subtype == 2)
{
    var hasAttackedPrev = hasAttacked;
    hasAttacked = true;
    attackedThisTurn = true;
    
    if (phaseEnd)
    {
        if (phase == 4)
        {
            if (!vfinalattemptkill)
            {
                vfinalattemptkill = true;
                bt_set_boxtype((0 << 0));
                dx_scene("battles.cb.attempt_kill");
                exit;
            }
            else
            {
                sbOverride = "battles.cb.sb_fight_phase_end";
            }
        }
        else
        {
            dx_scene("battles.cb.dummy_hurt");
            exit;
        }
    }
    
    if (fightType == 2 && phase == 3)
    {
        bt_set_boxtype((0 << 0));
        journal_set_health(16, (2 << 0));
        obj_battlemanager.mainState = (5 << 0);
        dx_scene("battles.cb_g.end_attack");
        exit;
    }
    
    if (fightType == 2 && phase == 2 && !removedMask)
    {
        doShake(6);
        instance_create_xy(x + 30, y + 20, obj_cb_mask_shred);
        instance_create_xy(x + 53, y + 20, obj_cb_mask_shred).hspeed *= -1;
        instance_create_xy(x + 75, y + 20, obj_cb_mask_shred);
        sfx_play_vol(snd_monhurt1, 0.6);
        faceSprite = spr_cbfaceb3_normal;
        removedMask = true;
    }
    
    if (fightType == 0 && !hasAttackedPrev)
        vextrasb = 3;
    
    var o = instance_create_xy(((xstart + offsetUiX) - sprite_xoffset) + floor(sprite_width * 0.5), (y + offsetDmgY) - sprite_yoffset - 38, obj_battledamage);
    o.isMiss = true;
    o.progressMiss = true;
    
    with (o)
    {
        y += 30;
        ystart = y;
        bounceUp();
    }
    
    exit;
}

if (global.bev_subtype == 3)
    actualMissThisTurn = true;

event_inherited();
