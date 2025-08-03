switch (global.bev_subtype)
{
    case 0:
        hitsThisTurn = 0;
        var preIntensity = attackIntensity;
        
        if (obj_battlemanager.totalTurns >= 8)
            attackIntensity = 2;
        else if (obj_battlemanager.totalTurns >= 4)
            attackIntensity = 1;
        else
            attackIntensity = 0;
        
        if (isRuth)
            attackIntensity += 3;
        
        vfinaldid = false;
        
        if (vfinal != -1)
        {
            obj_battlemanager.attackTimer = 0;
        }
        else
        {
            if (doRuthAttack)
            {
                attackType = 666;
                doRuthAttack = false;
            }
            else if (cantAttack)
            {
                attackType = -1;
            }
            else if ((attackIntensity != preIntensity && preIntensity != -1) || (obj_battlemanager.totalTurns > 8 && (obj_battlemanager.totalTurns % 3) == 0))
            {
                attackType = 5;
            }
            else
            {
                attackType = xirandom(4);
            }
            
            attackSubtype = 0;
            attackTime = 0;
            attackSide = 0;
            
            if (attackType == 4)
            {
                depth = obj_battlemanager.depth + 1;
                bt_set_boxtype((8 << 0));
            }
        }
        
        break;
    
    case 1:
        if (!obj_battlemanager.isBoxMoving)
            attackTime++;
        else
            obj_battlemanager.attackTimer = 99;
        
        if (attackType == -1)
        {
            obj_battlemanager.attackTimer = 0;
        }
        else if (attackType == 0)
        {
            if (attackTime == 1)
            {
                obj_battlemanager.attackTimer = 300;
                
                with (bt_bullet(obj_asgb_firering, (obj_battlemanager.boxX1 + obj_battlemanager.boxX2) / 2, (obj_battlemanager.boxY1 + obj_battlemanager.boxY2) / 2))
                {
                    switch (other.attackIntensity)
                    {
                        case 1:
                            ringDelay = 45;
                            shrinkSpeed = 4;
                            radius = 300;
                            break;
                        
                        case 2:
                            ringDelay = 30;
                            shrinkSpeed = 4;
                            gap = 8;
                            radius = 160;
                            break;
                        
                        case 3:
                            ringDelay = 30;
                            shrinkSpeed = 3;
                            radius = 192;
                            break;
                        
                        case 4:
                            ringDelay = 25;
                            shrinkSpeed = 4;
                            radius = 210;
                            break;
                        
                        case 5:
                            ringDelay = 30;
                            shrinkSpeed = 2;
                            radius = 240;
                            break;
                    }
                }
            }
        }
        else if (attackType == 1)
        {
            doSniperFlames();
        }
        else if (attackType == 2)
        {
            if (attackTime == 1)
            {
                obj_battlemanager.attackTimer = 330;
                
                with (bt_bullet(obj_asgbul_sweepergen, (obj_battlemanager.boxX1 + obj_battlemanager.boxX2) / 2, (obj_battlemanager.boxY1 + obj_battlemanager.boxY2) / 2))
                {
                    if (irandom(1) == 1)
                    {
                        orbitSpeed *= -1;
                        orbitMult = -1;
                    }
                    
                    switch (other.attackIntensity)
                    {
                        case 0:
                            break;
                        
                        case 1:
                            orbitMult *= 1.15;
                            break;
                        
                        case 2:
                            orbitMult *= 1.3;
                            break;
                        
                        case 3:
                            orbitSpeed *= 1.9;
                            alarm[2] = 210;
                            break;
                        
                        case 4:
                            orbitSpeed *= 2;
                            alarm[2] = 210;
                            break;
                        
                        case 5:
                            orbitSpeed *= 2.1;
                            alarm[2] = 210;
                            break;
                    }
                }
            }
        }
        else if (attackType == 3)
        {
            if (attackTime == 1)
            {
                obj_battlemanager.attackTimer = 210;
                var xOffset = 20;
                var i = 0;
                attackSubtype = irandom(3);
                
                repeat (5)
                {
                    fireFountains[i] = bt_bullet(obj_asgbul_firefountain, obj_battlemanager.boxX1 + xOffset, obj_battlemanager.boxY2);
                    xOffset += 30;
                    i++;
                }
            }
            
            var times;
            
            switch (attackIntensity)
            {
                case 0:
                    times = [60, 120, 180];
                    break;
                
                case 1:
                    times = [55, 110, 165];
                    break;
                
                case 2:
                    times = [50, 100, 150, 200];
                    break;
                
                case 3:
                    times = [45, 90, 135, 180];
                    break;
                
                case 4:
                    times = [40, 80, 120, 160];
                    break;
                
                case 5:
                    times = [35, 70, 105, 140, 175];
                    break;
            }
            
            switch (attackSubtype)
            {
                case 0:
                    if (attackTime == times[0])
                    {
                        fireFountains[0].setState(1);
                        fireFountains[4].setState(1);
                    }
                    else if (attackTime == times[1])
                    {
                        fireFountains[1].setState(1);
                        fireFountains[3].setState(1);
                    }
                    else if (attackTime == times[2])
                    {
                        fireFountains[2].setState(1);
                    }
                    
                    var lenOfTimes = array_length(times);
                    
                    switch (lenOfTimes)
                    {
                        case 4:
                            if (attackTime == times[3])
                            {
                                fireFountains[1].setState(1);
                                fireFountains[3].setState(1);
                            }
                            
                            break;
                        
                        case 5:
                            if (attackTime == times[4])
                            {
                                fireFountains[0].setState(1);
                                fireFountains[4].setState(1);
                            }
                            
                            break;
                    }
                    
                    break;
                
                case 1:
                    if (attackTime == times[0])
                    {
                        fireFountains[0].setState(1);
                        fireFountains[2].setState(1);
                        fireFountains[4].setState(1);
                    }
                    else if (attackTime == times[1])
                    {
                        fireFountains[1].setState(1);
                        fireFountains[3].setState(1);
                    }
                    else if (attackTime == times[2])
                    {
                        fireFountains[0].setState(1);
                        fireFountains[2].setState(1);
                        fireFountains[4].setState(1);
                    }
                    
                    var lenOfTimes = array_length(times);
                    
                    switch (lenOfTimes)
                    {
                        case 4:
                            if (attackTime == times[3])
                            {
                                fireFountains[1].setState(1);
                                fireFountains[3].setState(1);
                            }
                            
                            break;
                        
                        case 5:
                            if (attackTime == times[4])
                            {
                                fireFountains[0].setState(1);
                                fireFountains[2].setState(1);
                                fireFountains[4].setState(1);
                            }
                            
                            break;
                    }
                    
                    break;
                
                case 2:
                    if (attackTime == times[0])
                    {
                        fireFountains[0].setState(1);
                        fireFountains[1].setState(1);
                    }
                    else if (attackTime == times[1])
                    {
                        fireFountains[2].setState(1);
                        fireFountains[3].setState(1);
                    }
                    else if (attackTime == times[2])
                    {
                        fireFountains[4].setState(1);
                        fireFountains[0].setState(1);
                    }
                    
                    var lenOfTimes = array_length(times);
                    
                    switch (lenOfTimes)
                    {
                        case 4:
                            if (attackTime == times[3])
                            {
                                fireFountains[1].setState(1);
                                fireFountains[2].setState(1);
                            }
                            
                            break;
                        
                        case 5:
                            if (attackTime == times[4])
                            {
                                fireFountains[3].setState(1);
                                fireFountains[4].setState(1);
                            }
                            
                            break;
                    }
                    
                    break;
                
                case 3:
                    if (attackTime == times[0])
                    {
                        fireFountains[4].setState(1);
                        fireFountains[3].setState(1);
                    }
                    else if (attackTime == times[1])
                    {
                        fireFountains[2].setState(1);
                        fireFountains[1].setState(1);
                    }
                    else if (attackTime == times[2])
                    {
                        fireFountains[0].setState(1);
                        fireFountains[4].setState(1);
                    }
                    
                    var lenOfTimes = array_length(times);
                    
                    switch (lenOfTimes)
                    {
                        case 4:
                            if (attackTime == times[3])
                            {
                                fireFountains[3].setState(1);
                                fireFountains[2].setState(1);
                            }
                            
                            break;
                        
                        case 5:
                            if (attackTime == times[4])
                            {
                                fireFountains[1].setState(1);
                                fireFountains[0].setState(1);
                            }
                            
                            break;
                    }
                    
                    break;
            }
        }
        else if (attackType == 4)
        {
            if (attackTime == 1)
            {
                if (attackIntensity >= 3)
                    obj_battlemanager.attackTimer = 300;
                else
                    obj_battlemanager.attackTimer = 200;
                
                var xOffset = 12;
                var whichslow = irandom(4);
                var whichfast = irandom(4);
                
                if (whichfast == whichslow)
                {
                    if (whichslow == 0)
                        whichfast = 1;
                    else
                        whichfast = whichslow - 1;
                }
                
                for (var i = 0; i < 5; i++)
                {
                    var fire = bt_bullet(obj_asgbul_bounce, obj_battlemanager.boxX1 + xOffset, random_range(obj_battlemanager.boxY1 + 16, obj_battlemanager.boxY1 + 16));
                    
                    if (whichslow == i)
                        fire.vspeed = random_range(1, 2);
                    else if (whichfast == i)
                        fire.vspeed = random_range(4, 5);
                    else
                        fire.vspeed = random_range(1, 5);
                    
                    fire.vspeed += (attackIntensity + 1) % 3;
                    
                    if (irandom(1) == 0)
                        fire.vspeed *= -1;
                    
                    fire.doIDie = false;
                    
                    if (attackIntensity >= 3)
                    {
                        var secondY = 0;
                        
                        if (fire.y <= ((obj_battlemanager.boxY1 + obj_battlemanager.boxY2) / 2))
                            secondY = fire.y + 21;
                        else
                            secondY = fire.y - 21;
                        
                        var fire_two_electric_boogaloo = bt_bullet(obj_asgbul_bounce, obj_battlemanager.boxX1 + xOffset, secondY);
                        fire_two_electric_boogaloo.vspeed = fire.vspeed * -1;
                        fire_two_electric_boogaloo.image_xscale = 0.5;
                        fire_two_electric_boogaloo.image_yscale = 0.5;
                        fire_two_electric_boogaloo.doIDie = false;
                    }
                    
                    xOffset += 21;
                }
            }
        }
        else if (attackType == 5)
        {
            if (attackTime == 1)
            {
                obj_battlemanager.attackTimer = 300;
                animatedBody = false;
                sprite_index = spr_asgb_cloaked;
                sfx_play(snd_click, 80, false);
                view_flash();
                
                with (bt_bullet(obj_asgbul_spear, x + sprite_width + 2, (y + sprite_height) - 4))
                {
                    repeat (max(1, other.attackIntensity))
                    {
                        side = choose(-1, 0, 1);
                        ds_list_add(sides, side);
                    }
                    
                    timeBetweenActions = 30 - (other.attackIntensity * 4);
                    moveSpeed = 0.5 + (other.attackIntensity * 0.05);
                }
            }
        }
        else if (attackType == 666)
        {
            if (attackTime == 1)
            {
                music_kill_current();
                obj_battlemanager.attackTimer = 930;
                drawSpear = false;
                animatedBody = false;
                sprite_index = spr_asgb_cloaked;
                sfx_play(snd_click, 80, false);
                view_flash();
                
                with (bt_bullet(obj_asgbul_spear, x + sprite_width + 2, (y + sprite_height) - 4))
                {
                    specialAttack = true;
                    ds_list_add(sides, -1);
                    ds_list_add(sides, 0);
                    ds_list_add(sides, 1);
                    ds_list_add(sides, 0);
                    ds_list_add(sides, -1);
                    ds_list_add(sides, 1);
                    ds_list_add(sides, 0);
                    ds_list_add(sides, 1);
                    ds_list_add(sides, -1);
                    side = 0;
                    ds_list_add(sides, 0);
                    timeBetweenActions = 8;
                    moveSpeed = 0.8;
                }
            }
            
            if (attackTime >= 700)
            {
                if (attackTime == 900)
                {
                    instance_destroy(obj_asgbul_eruptor);
                }
                else
                {
                    with (obj_asgbul_eruptor)
                    {
                        if (slow > 0)
                            slow -= 0.0052;
                        else
                            slow = 0;
                    }
                    
                    if (attackTime == 930)
                    {
                        animatedBody = false;
                        sprite_index = spr_asgb_kneel;
                        kneeling = true;
                        xCorrectOverride = true;
                        face = spr_asgface_dark_still;
                        image_xscale = 2;
                        image_yscale = 2;
                        offsetUiX = 0;
                        offsetDmgY = 100;
                        offsetSliceY = 0;
                        ignoreSpriteForHPBar = false;
                    }
                    else if (attackTime == 700)
                    {
                        with (instance_create(obj_fader))
                        {
                            fadeSpeed = 0.0052;
                            fadeMusic = true;
                            maxMusicVolume = 0.8;
                            color = 16777215;
                            destroy = false;
                        }
                    }
                }
                
                with (obj_asgbul_parent)
                    damageAmount = 1;
            }
        }
        
        break;
    
    case 2:
        alarm[6] = 1;
        
        if (attackType == 666)
            instance_destroy(obj_fader);
        
        break;
}
