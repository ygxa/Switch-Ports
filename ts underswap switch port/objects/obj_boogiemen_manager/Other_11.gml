switch (global.bev_subtype)
{
    case 0:
        obj_battlemanager.attackTimer = 100;
        harryActive = obj_harry_monster.isActive;
        larryActive = obj_larry_monster.isActive;
        harryDepth = obj_harry_monster.depth;
        larryDepth = obj_larry_monster.depth;
        shouldMakeHeal = !isRuth;
        
        if (shouldMakeHeal)
        {
            if (global.playerhp <= 10)
                shouldMakeHeal = (turn % 3) == 2;
            else
                shouldMakeHeal = (turn % 4) == 3;
        }
        
        if (isRuth)
        {
            var arr = [1, 5, 6, 12, 13];
            var exclude = array_get_index(arr, attackType);
            var rand = xirandom_exclude(array_length(arr) - 1, exclude);
            attackType = arr[rand];
        }
        else if (argState <= 1 && array_length(firstAttacks) > 0 && harryActive && larryActive)
        {
            var ind = xirandom(array_length(firstAttacks) - 1);
            attackType = firstAttacks[ind];
            array_delete(firstAttacks, ind, 1);
        }
        else
        {
            var attackList = ds_list_create();
            
            switch (argState)
            {
                case 0:
                case 1:
                    if (larryActive && harryActive)
                    {
                        ds_list_add(attackList, 0);
                        ds_list_add(attackList, 4);
                        ds_list_add(attackList, 6);
                    }
                    
                    if (larryActive)
                        ds_list_add(attackList, 5);
                    
                    if (harryActive)
                        ds_list_add(attackList, 1);
                    
                    ds_list_add(attackList, 2);
                    ds_list_add(attackList, 2);
                    ds_list_add(attackList, 3);
                    break;
                
                default:
                    if (larryActive && harryActive)
                    {
                        if (doneFishPropeller == 0)
                        {
                            doneFishPropeller = 1;
                            ds_list_add(attackList, 11);
                            break;
                        }
                        
                        ds_list_add(attackList, 10);
                        ds_list_add(attackList, 11);
                    }
                    
                    if (larryActive)
                    {
                        ds_list_add(attackList, 3);
                        ds_list_add(attackList, 5);
                    }
                    
                    if (harryActive)
                        ds_list_add(attackList, 1);
                    
                    break;
            }
            
            var attempts = 0;
            var preAttackType = attackType;
            
            do
                attackType = ds_list_find_value(attackList, xirandom(ds_list_size(attackList) - 1));
            until (attempts++ >= 20 || attackType != preAttackType);
            
            ds_list_destroy(attackList);
        }
        
        attackTime = 0;
        attackGenerated = false;
        laughTimer = -1;
        
        if (isRuth && !larryActive)
        {
            attackType = -1;
            bt_set_boxtype((0 << 0));
            obj_battlemanager.boxTypeAttack = (0 << 0);
            obj_battlemanager.attackTime = 30;
        }
        
        switch (attackType)
        {
            case 0:
                bt_set_boxtype((7 << 0));
                break;
            
            case 2:
                bt_set_boxtype((15 << 0));
                break;
            
            case 10:
                bt_set_boxtype((16 << 0));
                break;
            
            case 12:
                bt_set_box_custom_not_instant(180, 166, 460, 390);
                break;
            
            case 13:
                bt_set_box_custom_not_instant(260, 170, 380, 390);
                break;
        }
        
        break;
    
    case 1:
        if (!obj_battlemanager.isBoxMoving || attackGenerated)
            attackTime++;
        
        if (laughTimer > 0)
        {
            laughTimer--;
            
            if (laughTimer == 0)
                endLaugh();
        }
        
        switch (attackType)
        {
            case 0:
                if (attackTime == 0)
                {
                    obj_larry_monster.hspeed += 3;
                    obj_harry_monster.hspeed -= 2;
                }
                else if (attackTime == 1)
                {
                    obj_larry_monster.hspeed = 0;
                    obj_harry_monster.hspeed = 0;
                    obj_battlemanager.attackTimer = 260;
                    var atk = instance_create(obj_boogiemen_propeller_atk);
                    
                    with (atk)
                    {
                        harryActive = other.harryActive;
                        larryActive = other.larryActive;
                    }
                    
                    attackGenerated = true;
                }
                
                break;
            
            case 1:
                if (attackTime == 1)
                {
                    obj_battlemanager.attackTimer = 240;
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
                        
                        hatBullets[hatIndex] = instance_create_xy(obj_battlemanager.boxX1 + 23 + (hatIndex * 55), obj_battlemanager.boxY1 - 40, obj_hat_bul);
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
                            damageAmount = obj_harry_monster.attack;
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
                
                break;
            
            case 2:
                if (attackTime == 1)
                {
                    obj_battlemanager.attackTimer = 270;
                    bt_bullet(obj_boogiemen_banana_atk, 0, 0, obj_harry_monster);
                    attackGenerated = true;
                }
                
                break;
            
            case 3:
                if (attackTime == 1)
                {
                    obj_battlemanager.attackTimer = 150;
                    var bul = bt_bullet(obj_boogiemen_cake_atk, (obj_battlemanager.boxX1 + obj_battlemanager.boxX2) / 2, ((obj_battlemanager.boxY1 + obj_battlemanager.boxY2) / 2) - 20, obj_larry_monster);
                    
                    if (shouldMakeHeal)
                    {
                        with (bul)
                        {
                            image_blend = c_lime;
                            damageAmount *= -1;
                        }
                    }
                    
                    attackGenerated = true;
                }
                
                break;
            
            case 4:
                if (attackTime == 1)
                {
                    obj_battlemanager.attackTimer = 260;
                    var atk = instance_create(obj_boogiemen_fishfood_atk);
                    
                    with (atk)
                    {
                        harryActive = other.harryActive;
                        larryActive = other.larryActive;
                    }
                    
                    attackGenerated = true;
                }
                
                break;
            
            case 5:
                if (attackTime == 1)
                {
                    obj_battlemanager.attackTimer = 140;
                    var i = 0;
                    var bulY = obj_battlemanager.boxY1 + 25 + xirandom(5);
                    
                    repeat (3)
                    {
                        if (i == 1)
                        {
                            var bulX = obj_battlemanager.boxX2 + 40;
                            
                            with (bt_bullet(obj_trashcan_bul, bulX, bulY + xirandom_range(-10, 10), obj_larry_monster))
                            {
                                spillDelay = xirandom_range(5, 35 - floor(obj_larry_monster.atkSpeed * 5));
                                
                                if (obj_boogiemen_manager.shouldMakeHeal)
                                {
                                    image_blend = c_lime;
                                    damageAmount *= -1;
                                }
                            }
                        }
                        else
                        {
                            var bulX = obj_battlemanager.boxX1 - 40;
                            
                            with (bt_bullet(obj_trashcan_bul, bulX, bulY, obj_larry_monster))
                                spillDelay = xirandom_range(20 - floor(obj_larry_monster.atkSpeed * 5), 50 - floor(obj_larry_monster.atkSpeed * 5));
                        }
                        
                        i++;
                        bulY += (50 + xirandom(5));
                    }
                    
                    attackGenerated = true;
                }
                
                break;
            
            case 6:
                if (attackTime == 1)
                {
                    obj_battlemanager.attackTimer = 150;
                    bt_bullet(obj_harry_chomp_atk, 0, 0, obj_harry_monster);
                    obj_harry_monster.visible = false;
                    obj_larry_monster.visible = false;
                    obj_harry_monster.image_alpha = 0;
                    obj_larry_monster.image_alpha = 0;
                    fadeIn = false;
                    attackGenerated = true;
                }
                
                break;
            
            case 10:
                if (attackTime == 0)
                {
                    obj_larry_monster.hspeed += 3;
                }
                else if (attackTime == 1)
                {
                    obj_larry_monster.hspeed = 0;
                    obj_battlemanager.attackTimer = 270;
                    bt_bullet(obj_boogiemen_banana_atk, 0, 0, obj_harry_monster);
                    var atk = instance_create(obj_boogiemen_propeller_atk);
                    
                    with (atk)
                    {
                        harryActive = false;
                        larryActive = other.larryActive;
                        barOffset = 240;
                    }
                    
                    attackGenerated = true;
                }
                
                break;
            
            case 11:
                if (attackTime == 0)
                    obj_larry_monster.hspeed += 3;
                
                if (attackTime == 1)
                {
                    obj_larry_monster.hspeed = 0;
                    obj_battlemanager.attackTimer = 270;
                    var atk = instance_create(obj_boogiemen_propeller_atk);
                    
                    with (atk)
                    {
                        harryActive = false;
                        larryActive = other.larryActive;
                        wantHats = false;
                    }
                    
                    atk = instance_create(obj_boogiemen_fishfood_atk);
                    
                    with (atk)
                    {
                        harryActive = other.harryActive;
                        larryActive = false;
                    }
                    
                    attackGenerated = true;
                }
                
                break;
            
            case 12:
                if (attackTime == 1)
                {
                    obj_battlemanager.attackTimer = 265;
                    attackGenerated = true;
                }
                
                if ((attackTime % 40) == 1 && attackTime < 210)
                    bt_bullet(obj_boogiemen_cake_atk_hard, irandom_range(obj_battlemanager.boxX1 + 40, obj_battlemanager.boxX2 - 40), obj_battlemanager.boxY1 - 30, obj_larry_monster);
                
                break;
            
            case 13:
                if (attackTime == 1)
                {
                    obj_battlemanager.attackTimer = 230;
                    attackGenerated = true;
                    instance_create(obj_boogiemen_harry_bomb_atk);
                }
                
                break;
        }
        
        break;
    
    case 2:
        with (obj_boogiemen_banana_atk)
            instance_destroy();
        
        with (obj_speechbubble)
            instance_destroy();
        
        if (attackType == 6)
        {
            obj_larry_monster.visible = true;
            obj_harry_monster.visible = true;
            fadeIn = true;
        }
        
        endLaugh();
        turn++;
        obj_harry_monster.depth = harryDepth;
        obj_harry_monster.fishedState = 0;
        obj_larry_monster.depth = larryDepth;
        break;
}
