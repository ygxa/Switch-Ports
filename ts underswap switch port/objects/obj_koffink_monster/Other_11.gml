switch (global.bev_subtype)
{
    case 0:
        if (funnyAttackBoost == 1)
            attack += 2;
        
        if (funnyDefenseLower == 1)
        {
            defense -= 2;
            funnyDefenseLower = 2;
        }
        else if (funnyDefenseLower == 2)
        {
            defense += 2;
            funnyDefenseLower = 3;
        }
        
        if (vlowhp == 0 || isSpareable)
        {
            if (drawOnGround)
                drawFace = spr_kk_hat_neutral;
            else
                drawFace = spr_kk_face_neutral;
        }
        
        if (vdonefighting || vlowhp != 0)
        {
            obj_battlemanager.attackTime = 0;
            attackType = 0;
            
            if (!vdonefighting)
                sprite_index = spr_kk_body_neutral;
        }
        else
        {
            obj_battlemanager.attackTime = 100;
            
            switch (vturn)
            {
                case 1:
                    attackType = 3;
                    break;
                
                case 2:
                    attackType = 2;
                    break;
                
                case 3:
                    attackType = 4;
                    break;
                
                case 4:
                    attackType = 6;
                    break;
                
                default:
                    var attacks = [];
                    
                    if (hp <= (maxHp / 2) || vconvincestage >= 1)
                    {
                        if (attackType != 8)
                            array_push(attacks, 8);
                        
                        if (attackType != 6)
                            array_push(attacks, 6);
                        
                        if (attackType != 4)
                            array_push(attacks, 4);
                    }
                    else
                    {
                        if (attackType != 10)
                            array_push(attacks, 10);
                        
                        if (attackType != 2)
                            array_push(attacks, 2);
                        
                        if (attackType != 5)
                            array_push(attacks, 5);
                    }
                    
                    attackType = xchoose_array(attacks);
                    break;
            }
            
            if (specialAttack != 0)
            {
                attackType = specialAttack;
                specialAttack = 0;
            }
        }
        
        switch (attackType)
        {
            case 1:
                obj_battlemanager.attackTime = 110;
                break;
            
            case 2:
                obj_battlemanager.attackTime = 230;
                break;
            
            case 3:
                obj_battlemanager.attackTime = 270;
                bt_set_boxtype((4 << 0));
                break;
            
            case 4:
                obj_battlemanager.attackTime = 240;
                break;
            
            case 5:
                obj_battlemanager.attackTime = 180;
                break;
            
            case 6:
                obj_battlemanager.attackTime = 290;
                break;
            
            case 7:
                obj_battlemanager.attackTime = 300;
                bt_set_boxtype((4 << 0));
                break;
            
            case 8:
                obj_battlemanager.attackTime = 276;
                bt_set_boxtype((4 << 0));
                break;
            
            case 10:
                obj_battlemanager.attackTime = 180;
                bt_set_boxtype((4 << 0));
                break;
            
            case 11:
                obj_battlemanager.attackTime = 180;
                bt_set_boxtype((4 << 0));
                break;
            
            case 12:
                obj_battlemanager.attackTime = 220;
                break;
        }
        
        if (vturn >= 5)
            allowDangerRows = true;
        
        attackTime = 0;
        break;
    
    case 1:
        switch (attackType)
        {
            case 0:
                break;
            
            case 1:
                if (attackTime == 0)
                {
                    if (allowDangerRows)
                    {
                        with (obj_battleheart_purple)
                            setDangerRow(xirandom_range(0, 2), 45, 60);
                    }
                    
                    spewBats(choose(0, 1));
                }
                
                break;
            
            case 2:
                if (attackTime == 0)
                {
                    circleBatAngle = 0;
                    
                    if (allowDangerRows)
                    {
                        with (obj_battleheart_purple)
                            setDangerRow(0, 90, 60);
                    }
                    
                    sprite_index = spr_kk_body_crossarms;
                }
                else if (attackTime >= 30 && attackTime <= 90)
                {
                    sprite_index = spr_kk_body_armsout;
                    
                    if ((attackTime % 5) == 0)
                    {
                        var bul = bt_bullet(obj_kk_batbul_circle, x + 88, y + 132, obj_koffink_monster);
                        
                        with (bul)
                        {
                            pitch += ((other.circleBatAngle / 30) * 0.035);
                            direction = other.circleBatAngle;
                            gravity_direction = direction;
                        }
                        
                        circleBatAngle += 30;
                    }
                }
                
                break;
            
            case 3:
                if (attackTime == 0)
                {
                    bt_bullet(obj_kk_fruitbatbul, obj_battleheart.x - 25, obj_battlemanager.boxY1 - 50);
                    
                    if (allowDangerRows)
                    {
                        with (obj_battleheart_purple)
                            setDangerRow(choose(0, 2), 90, 150);
                    }
                    
                    bt_bullet(obj_boogiemen_banana_atk, 0, 0, obj_koffink_monster);
                }
                
                break;
            
            case 4:
                if (attackTime == 0)
                {
                    var bombIdx = irandom(2);
                    hatIndex = 0;
                    flyingBirdIdx = -1;
                    hatBullets = [-4, -4, -4];
                    hatOrder = [0, 1, 2];
                    
                    repeat (3)
                    {
                        if (hatIndex == bombIdx)
                        {
                            bomb = true;
                        }
                        else
                        {
                            bomb = false;
                            
                            if (flyingBirdIdx == -1)
                                flyingBirdIdx = hatIndex;
                        }
                        
                        hatBullets[hatIndex] = bt_bullet(obj_hat_bul, obj_battlemanager.boxX1 + 23 + (hatIndex * 55), obj_battlemanager.boxY1 - 40, obj_koffink_monster);
                        var bul = hatBullets[hatIndex];
                        
                        with (bul)
                        {
                            if (!other.bomb)
                            {
                                if (other.hatIndex == other.flyingBirdIdx)
                                    contentType = 2;
                                else
                                    contentType = 0;
                            }
                            else
                            {
                                contentType = 1;
                            }
                            
                            makeContentObject(contentType);
                            image_index = other.bomb ? 1 : 0;
                            pos = other.hatIndex;
                            damageAmount = obj_koffink_monster.attack;
                        }
                        
                        hatIndex++;
                    }
                    
                    attackGenerated = true;
                }
                else if (attackTime == 30)
                {
                    for (var i = 0; i < array_length(hatBullets); i++)
                    {
                        var bul = hatBullets[i];
                        
                        with (bul)
                        {
                            hideContents();
                            
                            if (pos == 2)
                                goToPosIndex(0);
                            else
                                goToPosIndex(pos + 1);
                        }
                    }
                }
                else if (attackTime == 150)
                {
                    dropHat(hatBullets[2]);
                }
                else if (attackTime == 160)
                {
                    secondHatFirst = choose(0, 1);
                    
                    if (secondHatFirst)
                        dropHat(hatBullets[1]);
                    else
                        dropHat(hatBullets[0]);
                }
                else if (attackTime == 170)
                {
                    if (secondHatFirst)
                        dropHat(hatBullets[0]);
                    else
                        dropHat(hatBullets[1]);
                }
                
                if ((attackTime % 10) == 0 && (attackTime > 30 && attackTime < 150))
                {
                    var ind = irandom(2);
                    var otherInd;
                    
                    switch (ind)
                    {
                        case 0:
                            otherInd = choose(1, 2);
                            break;
                        
                        case 1:
                            otherInd = choose(0, 2);
                            break;
                        
                        case 2:
                            otherInd = choose(0, 1);
                            break;
                    }
                    
                    var temp = hatOrder[ind];
                    hatOrder[ind] = hatOrder[otherInd];
                    hatOrder[otherInd] = temp;
                    
                    if (irandom(1) == 0)
                    {
                        var thirdInd = 0;
                        
                        while (thirdInd == ind || thirdInd == otherInd)
                            thirdInd++;
                        
                        ind = choose(ind, otherInd);
                        temp = hatOrder[ind];
                        hatOrder[ind] = hatOrder[thirdInd];
                        hatOrder[thirdInd] = temp;
                    }
                    
                    for (var i = 0; i < array_length(hatBullets); i++)
                    {
                        with (hatBullets[i])
                            goToPosIndex(other.hatOrder[i]);
                    }
                }
                
                if ((attackTime % 60) == 25 && attackTime < 100)
                {
                    if (allowDangerRows)
                    {
                        with (obj_battleheart_purple)
                            setDangerRow(irandom(2), 30, 30);
                    }
                }
                
                break;
            
            case 5:
                if (attackTime == 0)
                {
                    sprite_index = spr_kk_body_tip;
                    image_speed = 0;
                    image_index = 0;
                }
                else if (attackTime == 10)
                {
                    image_index = 1;
                }
                else if (attackTime == 20)
                {
                    sfx_play(snd_grab, 80, false);
                    sprite_index = spr_kk_body_throw;
                    image_speed = 0;
                    image_index = 0;
                    boomerangBul = bt_bullet(obj_kk_boomerangbul, 168, -10, obj_koffink_monster);
                    boomerangBul.wantSound = !allowDangerRows;
                }
                else if (attackTime == 50 || attackTime == 53 || attackTime == 55)
                {
                    if (attackTime == 55)
                    {
                        view_shake(2, 2);
                        sfx_play(snd_throw);
                        
                        with (boomerangBul)
                        {
                            x = 200;
                            y = 62;
                            hspeed = 50;
                            image_speed = 1;
                        }
                        
                        if (allowDangerRows)
                        {
                            with (obj_battleheart_purple)
                                setDangerRow(2, 30, 60);
                        }
                    }
                    
                    image_index++;
                }
                
                break;
            
            case 8:
                if (attackTime == 0)
                {
                    sprite_index = spr_kk_body_tip;
                    image_speed = 0;
                    image_index = 0;
                }
                else if (attackTime == 10)
                {
                    image_index = 1;
                }
                else if (attackTime == 20)
                {
                    sfx_play(snd_grab, 80, false);
                    sprite_index = spr_kk_body_throw;
                    image_speed = 0;
                    image_index = 0;
                    boomerangBul = bt_bullet(obj_kk_boomerangbul, 168, -10, obj_koffink_monster);
                    boomerangBul.wantSound = false;
                    boomerangBul.special = true;
                    sfx_play(snd_charge);
                }
                else if (attackTime == 50 || attackTime == 53 || attackTime == 55)
                {
                    if (attackTime == 55)
                    {
                        view_shake(2, 2);
                        sfx_play(snd_throw);
                        
                        with (boomerangBul)
                        {
                            x = 200;
                            y = 62;
                            hspeed = 50;
                            image_speed = 1;
                        }
                    }
                    
                    image_index++;
                }
                
                break;
            
            case 6:
                if (attackTime == 0)
                {
                    with (obj_battlemanager)
                        boxTransform = true;
                    
                    instance_create_xy(306, 320, obj_boxbats);
                }
                
                if ((attackTime % 60) == 0)
                {
                    if (allowDangerRows)
                    {
                        with (obj_battleheart_purple)
                            setDangerRow(irandom(2), 30, 30);
                    }
                }
                
                if (attackTime < 260)
                {
                    with (obj_battlemanager)
                    {
                        boxAngleForced = number_approach_smooth(boxAngleForced, 90, 0.15, 0.5);
                        hpBarOffset = number_approach_smooth(hpBarOffset, 210, 0.15, 0.5);
                        var textDest = floor(global.playermaxhp * -1.65) - 46;
                        statsHPTextXOffset = number_approach_smooth(statsHPTextXOffset, textDest, 0.15, 0.5);
                        statsHPTextYOffset = number_approach_smooth(statsHPTextYOffset, -24, 0.15, 0.5);
                    }
                }
                else
                {
                    with (obj_battlemanager)
                    {
                        boxAngleForced = number_approach_smooth(boxAngleForced, 0, 0.15, 0.5);
                        boxTranslateX = number_approach_smooth(boxTranslateX, 0, 0.15, 0.25);
                        boxTranslateY = number_approach_smooth(boxTranslateY, 0, 0.15, 0.25);
                        hpBarOffset = number_approach_smooth(hpBarOffset, 0, 0.15, 0.5);
                        statsHPTextXOffset = number_approach_smooth(statsHPTextXOffset, 0, 0.15, 0.5);
                        statsHPTextYOffset = number_approach_smooth(statsHPTextYOffset, 0, 0.15, 0.5);
                    }
                    
                    with (obj_boxbats)
                        disappear = true;
                    
                    with (obj_bullet_parent)
                        instance_destroy();
                }
                
                if (obj_battlemanager.boxAngleForced > 45)
                {
                    with (obj_battleheart_purple)
                        rotatedControls = true;
                }
                else
                {
                    with (obj_battleheart_purple)
                        rotatedControls = false;
                }
                
                with (obj_battleheart)
                    image_angle = 270 + (90 - obj_battlemanager.boxAngleForced);
                
                if ((attackTime % 30) == 0 && attackTime < 270)
                {
                    var hatY = choose(obj_battlemanager.boxY1 - 30, obj_battlemanager.boxY2 + 30);
                    bt_bullet(obj_kk_hatbul, -90, hatY, obj_koffink_monster);
                }
                
                break;
            
            case 7:
                if (attackTime == 0)
                {
                    side = 0;
                    bt_bullet(obj_boogiemen_banana_atk, 0, 0, obj_koffink_monster);
                }
                else if ((attackTime % 10) == 0 && !instance_exists(obj_koffink_armshake))
                {
                    spewBats(side);
                    side = !side;
                }
                
                break;
            
            case 10:
                if (attackTime == 0)
                {
                    side = 0;
                    bt_bullet(obj_boogiemen_banana_atk, 0, 0, obj_koffink_monster);
                    sprite_index = spr_kk_body_tip;
                    image_speed = 0;
                    image_index = 0;
                }
                else if (attackTime == 10)
                {
                    image_index = 1;
                }
                else if (attackTime == 20)
                {
                    sfx_play(snd_grab, 80, false);
                    sprite_index = spr_kk_body_throw;
                    image_speed = 0;
                    image_index = 0;
                    boomerangBul = bt_bullet(obj_kk_boomerangbul, 168, -10, obj_koffink_monster);
                    boomerangBul.wantSound = true;
                }
                else if (attackTime == 50 || attackTime == 53 || attackTime == 55)
                {
                    if (attackTime == 55)
                    {
                        view_shake(2, 2);
                        sfx_play(snd_throw);
                        
                        with (boomerangBul)
                        {
                            x = 200;
                            y = 62;
                            hspeed = 50;
                            image_speed = 1;
                        }
                    }
                    
                    image_index++;
                }
                
                break;
            
            case 11:
                if (attackTime == 0)
                {
                    side = 0;
                    bt_bullet(obj_boogiemen_banana_atk, 0, 0, obj_koffink_monster);
                    sprite_index = spr_kk_body_tip;
                    image_speed = 0;
                    image_index = 0;
                }
                else if (attackTime == 10)
                {
                    image_index = 1;
                }
                else if (attackTime == 20)
                {
                    sfx_play(snd_grab, 80, false);
                    sprite_index = spr_kk_body_throw;
                    image_speed = 0;
                    image_index = 0;
                    boomerangBul = bt_bullet(obj_kk_boomerangbul, 168, -10, obj_koffink_monster);
                    boomerangBul.wantSound = !allowDangerRows;
                }
                else if (attackTime == 50 || attackTime == 53 || attackTime == 55)
                {
                    if (attackTime == 55)
                    {
                        view_shake(2, 2);
                        sfx_play(snd_throw);
                        
                        with (boomerangBul)
                        {
                            x = 200;
                            y = 62;
                            hspeed = 50;
                            image_speed = 1;
                        }
                        
                        if (allowDangerRows)
                        {
                            with (obj_battleheart_purple)
                                setDangerRow(2, 30, 60);
                        }
                    }
                    
                    image_index++;
                }
                
                break;
            
            case 12:
                if (attackTime == 0)
                {
                    if (allowDangerRows)
                    {
                        with (obj_battleheart_purple)
                            setDangerRow(xirandom_range(0, 2), 45, 60);
                    }
                    
                    side = choose(0, 1);
                    spewBats(side);
                }
                else if ((attackTime % 10) == 0 && !instance_exists(obj_koffink_armshake))
                {
                    if (allowDangerRows)
                    {
                        with (obj_battleheart_purple)
                            setDangerRow(xirandom_range(0, 2), 45, 60);
                    }
                    
                    side = !side;
                    spewBats(side);
                }
                
                break;
        }
        
        attackTime++;
        break;
    
    case 2:
        if (funnyAttackBoost == 1)
        {
            attack -= 2;
            funnyAttackBoost = 2;
        }
        
        image_speed = 1;
        
        if (!vdonefighting)
        {
            if (sprite_index != spr_kk_body_neutral)
            {
                image_index = 0;
                sprite_index = spr_kk_body_neutral;
            }
        }
        
        with (obj_battlemanager)
        {
            boxTransform = false;
            boxTranslateX = 0;
            boxTranslateY = 0;
            boxAngleForced = 0;
            statsHPTextXOffset = 0;
            statsHPTextYOffset = 0;
            hpBarOffset = 0;
        }
        
        with (obj_battleheart_purple)
        {
            clearDangerRow();
            rotatedControls = false;
            image_angle = 0;
        }
        
        if (spewing)
        {
            instance_destroy(obj_koffink_armshake);
            spewTimer = 105;
        }
        
        break;
}
