if (gameover)
    exit;

preControlLock = controlLock;
controlLock |= isBoxMoving;

switch (mainState)
{
    case (1 << 0):
        with (obj_battleheart_purple)
            drawLines = false;
        
        var minX = 0;
        
        if (global.battle_id == 39 && ruth_started())
        {
            with (obj_muffet_monster)
            {
                if (vgfightwebs > 0)
                {
                    minX = 1;
                    
                    if (other.selectionX == 0)
                        other.selectionX = 1;
                }
            }
        }
        
        if (!controlLock)
        {
            var selXBefore = selectionX;
            
            if (global.control_left_pressed)
                selectionX = number_sub_wrap(selectionX, 3, minX);
            
            if (global.control_right_pressed)
                selectionX = number_add_wrap(selectionX, 3, minX);
            
            if (selXBefore != selectionX)
                sfx_play(snd_squeak);
            
            if (!writer.isDone && global.control_cancel_pressed)
            {
                writer.skip = true;
                writer.tryProgress();
            }
            
            if (global.control_confirm_pressed)
            {
                switch (selectionX)
                {
                    case 0:
                        selectedButton = (0 << 0);
                        presentMonsterList();
                        selectionY = clamp(selectionY, 0, monsterNameCount - 1);
                        break;
                    
                    case 1:
                        selectedButton = (1 << 0);
                        presentMonsterList();
                        selectionY = clamp(selectionY, 0, monsterNameCount - 1);
                        break;
                    
                    case 2:
                        var empty = false;
                        var maxY = 0;
                        
                        with (obj_overworldmenu)
                        {
                            updateVars();
                            empty = invItemEmpty;
                            maxY = invItemSize - 1;
                        }
                        
                        if (empty)
                        {
                            if (!audio_is_playing(snd_error))
                                sfx_play(snd_error);
                            
                            endStepLogic();
                            exit;
                        }
                        
                        selectedButton = (2 << 0);
                        currentMaxY = maxY;
                        itemSelectionY = 0;
                        itemStartIndex = 0;
                        selectionY = 0;
                        break;
                    
                    case 3:
                        selectedButton = (3 << 0);
                        var spareAvailable = false;
                        var fleeAvailable = true;
                        
                        for (var i = 0; i < 3; i++)
                        {
                            var mon = monsters[i];
                            
                            if (mon != -4 && mon.isActive)
                            {
                                if (mon.isSpareable)
                                    spareAvailable = true;
                                
                                if (!mon.isFleeAvailable)
                                    fleeAvailable = false;
                            }
                        }
                        
                        if (spareAvailable)
                        {
                            switch (ds_map_find_value(global.flags, "spare_col"))
                            {
                                case 1:
                                    drawableText += "`cp`";
                                    break;
                                
                                case 2:
                                    drawableText = "";
                                    break;
                                
                                default:
                                    drawableText += "`cY`";
                                    break;
                            }
                            
                            drawableText += (dxd_raw("battlesystem.spare") + "`cW`");
                        }
                        else
                        {
                            drawableText = dxd_raw("battlesystem.spare");
                        }
                        
                        if (fleeAvailable)
                        {
                            drawableText += ("#" + dxd_raw("battlesystem.flee"));
                            currentMaxY = 1;
                        }
                        else
                        {
                            currentMaxY = 0;
                        }
                        
                        selectionY = 0;
                        break;
                }
                
                writer.isDone = true;
                selectionX = 0;
                mainState = (2 << 0);
                sfx_play(snd_select);
                endStepLogic();
                exit;
            }
        }
        
        break;
    
    case (2 << 0):
        switch (selectedButton)
        {
            case (0 << 0):
                if (!controlLock)
                {
                    if (subState == 0)
                    {
                        var selYBefore = selectionY;
                        
                        if (global.control_up_pressed)
                            selectionY = number_sub_wrap(selectionY, monsterNameCount - 1);
                        
                        if (global.control_down_pressed)
                            selectionY = number_add_wrap(selectionY, monsterNameCount - 1);
                        
                        if (selYBefore != selectionY)
                            sfx_play(snd_squeak);
                        
                        if (global.control_confirm_pressed)
                        {
                            var currMon = 0;
                            
                            for (var i = 0; i < 3; i++)
                            {
                                var mon = monsters[i];
                                
                                if (currMon == selectionY && mon != -4 && mon.isActive)
                                {
                                    chosenMonster = i;
                                    
                                    if (mon.journalId != -1)
                                        journal_set_desc(mon.journalId, (1 << 0));
                                    
                                    break;
                                }
                                
                                if (mon != -4 && mon.isActive)
                                    currMon++;
                            }
                            
                            chosenMonsterMenuY = selectionY;
                            sfx_play(snd_select);
                            drawableText = "";
                            subState = 1;
                            obj_battleheart.visible = false;
                            spawnWeaponTarget();
                            endStepLogic();
                            exit;
                        }
                        
                        if (global.control_cancel_pressed)
                        {
                            selectionX = selectedButton;
                            selectedButton = (-1 << 0);
                            mainState = (1 << 0);
                            drawableText = "";
                            restartWriter();
                        }
                    }
                }
                
                break;
            
            case (1 << 0):
                if (!controlLock)
                {
                    if (subState == 0)
                    {
                        var selYBefore = selectionY;
                        
                        if (global.control_up_pressed)
                            selectionY = number_sub_wrap(selectionY, monsterNameCount - 1);
                        
                        if (global.control_down_pressed)
                            selectionY = number_add_wrap(selectionY, monsterNameCount - 1);
                        
                        if (selYBefore != selectionY)
                            sfx_play(snd_squeak);
                        
                        if (global.control_confirm_pressed)
                        {
                            var currMon = 0;
                            
                            for (var i = 0; i < 3; i++)
                            {
                                var mon = monsters[i];
                                
                                if (currMon == selectionY && mon != -4 && mon.isActive)
                                {
                                    chosenMonster = i;
                                    break;
                                }
                                
                                if (mon != -4 && mon.isActive)
                                    currMon++;
                            }
                            
                            chosenMonsterMenuY = selectionY;
                            sfx_play(snd_select);
                            var m = monsters[chosenMonster];
                            var s = ds_list_size(m.actStrings);
                            drawableTextBefore = drawableText;
                            drawableText = 
                            {
                                acts: [],
                                text: ""
                            };
                            
                            if (global.battle_id == 39 && !ruth_started())
                            {
                                global.dxformat[0] = _string(m.vpayamount);
                                ds_list_set(m.actStrings, 3, dxd_int("battles.muffet.act_pay"));
                                drawableText.acts = bt_format_acts(m, s);
                                global.dxformat[0] = _string(global.playergold);
                                drawableText.text = dxd_int("battles.muffet.money");
                            }
                            else
                            {
                                drawableText.acts = bt_format_acts(m, s);
                            }
                            
                            currentMaxX = s != 1;
                            currentMaxY = floor((s - 1) * 0.5);
                            selectionX = 0;
                            selectionY = 0;
                            subState = 1;
                            itemCount = s;
                            endStepLogic();
                            exit;
                        }
                        
                        if (global.control_cancel_pressed)
                        {
                            selectionX = selectedButton;
                            selectedButton = (-1 << 0);
                            mainState = (1 << 0);
                            drawableText = "";
                            restartWriter();
                        }
                    }
                    else
                    {
                        var selXBefore = selectionX;
                        var selYBefore = selectionY;
                        
                        if (global.control_left_pressed)
                        {
                            selectionX = number_sub_wrap(selectionX, currentMaxX);
                            
                            if (((2 * selectionY) + selectionX) > (itemCount - 1))
                                selectionX = 0;
                        }
                        
                        if (global.control_right_pressed)
                        {
                            selectionX = number_add_wrap(selectionX, currentMaxX);
                            
                            if (((2 * selectionY) + selectionX) > (itemCount - 1))
                                selectionX = 0;
                        }
                        
                        if (global.control_up_pressed)
                        {
                            selectionY = number_sub_wrap(selectionY, currentMaxY);
                            
                            if (((2 * selectionY) + selectionX) > (itemCount - 1))
                                selectionY = currentMaxY - 1;
                        }
                        
                        if (global.control_down_pressed)
                        {
                            selectionY = number_add_wrap(selectionY, currentMaxY);
                            
                            if (((2 * selectionY) + selectionX) > (itemCount - 1))
                                selectionY = 0;
                        }
                        
                        if (selXBefore != selectionX || selYBefore != selectionY)
                            sfx_play(snd_squeak);
                        
                        if (global.control_confirm_pressed)
                        {
                            var selIndex = (2 * selectionY) + selectionX;
                            
                            repeat ((selIndex + 1) * 2)
                                xrandom_advance();
                            
                            selectionX = 0;
                            selectionY = chosenMonsterMenuY;
                            textEndAutomatically = false;
                            global.bev_subtype = selIndex;
                            
                            with (monsters[chosenMonster])
                            {
                                if (journalId != -1)
                                    journal_set_desc(journalId, (1 << 0));
                                
                                try
                                {
                                    event_user(2);
                                }
                                catch (e)
                                {
                                    debug_error(e);
                                }
                            }
                            
                            dx_instance_run_scene(global.dxinst, ds_list_find_value(monsters[chosenMonster].actScenes, selIndex));
                            mainState = (5 << 0);
                            subState = 0;
                            obj_battleheart.visible = false;
                            sfx_play(snd_select);
                            dx_instance_update(global.dxinst);
                            endStepLogic();
                            exit;
                        }
                        
                        if (global.control_cancel_pressed)
                        {
                            selectionX = 0;
                            selectionY = chosenMonsterMenuY;
                            subState = 0;
                            drawableText = drawableTextBefore;
                        }
                    }
                }
                
                break;
            
            case (2 << 0):
                if (!controlLock)
                {
                    var selYBefore = selectionY;
                    
                    if (global.control_up_pressed)
                        itemSelectionY = number_sub_wrap(itemSelectionY, currentMaxY);
                    
                    if (global.control_down_pressed)
                        itemSelectionY = number_add_wrap(itemSelectionY, currentMaxY);
                    
                    var startIndBefore = itemStartIndex;
                    selectionY = itemSelectionY - itemStartIndex;
                    
                    if (selectionY > 2)
                    {
                        var diff = selectionY - 2;
                        itemStartIndex += diff;
                        selectionY -= diff;
                    }
                    else if (selectionY < 0)
                    {
                        var diff = -selectionY;
                        itemStartIndex -= diff;
                        selectionY += diff;
                    }
                    
                    if (selYBefore != selectionY || itemStartIndex != startIndBefore)
                        sfx_play(snd_squeak);
                    
                    if (global.control_confirm_pressed)
                    {
                        mainState = (5 << 0);
                        sfx_play(snd_select);
                        obj_battleheart.visible = false;
                        selectionY = 0;
                        textEndAutomatically = false;
                        var itemIdToUse = ds_list_find_value(global.inv_item, itemSelectionY);
                        lastItemCounter = 0;
                        
                        if (itemIdToUse == lastItemIdUsed)
                        {
                            timesLastItemUsed++;
                        }
                        else
                        {
                            timesLastItemUsed = 1;
                            lastItemIdUsed = itemIdToUse;
                        }
                        
                        item_use(itemIdToUse, itemSelectionY);
                        endStepLogic();
                        exit;
                    }
                    
                    if (global.control_cancel_pressed)
                    {
                        selectionX = selectedButton;
                        selectionY = 0;
                        selectedButton = (-1 << 0);
                        mainState = (1 << 0);
                        restartWriter();
                    }
                }
                
                break;
            
            case (3 << 0):
                if (!controlLock)
                {
                    var selYBefore = selectionY;
                    
                    if (global.control_up_pressed)
                        selectionY = number_sub_wrap(selectionY, currentMaxY);
                    
                    if (global.control_down_pressed)
                        selectionY = number_add_wrap(selectionY, currentMaxY);
                    
                    if (selYBefore != selectionY)
                        sfx_play(snd_squeak);
                    
                    with (obj_battleheart)
                        event_user(0);
                    
                    if (global.control_confirm_pressed)
                    {
                        if (selectionY == 0)
                        {
                            sfx_play(snd_select);
                            
                            for (var i = 0; i < 3; i++)
                            {
                                var mon = monsters[i];
                                
                                if (mon != -4 && mon.isActive && mon.isSpareable && !mon.fakeSpareable)
                                    bt_spare_monster(mon);
                            }
                            
                            if (spareObjOverride != -4)
                            {
                                try
                                {
                                    with (spareObjOverride)
                                        event_user(other.spareEvOverride);
                                }
                                catch (e)
                                {
                                    debug_error(e);
                                }
                            }
                            else
                            {
                                checkForWin();
                                
                                if (isAnyMonsterLeft)
                                    beginAttackMode();
                            }
                        }
                        else if (fleeSceneOverride != "")
                        {
                            selectionY = 0;
                            sfx_play(snd_select);
                            subState = 0;
                            
                            if (fleeOverrideFall)
                            {
                                mainState = (9 << 0);
                                
                                with (obj_battleheart)
                                {
                                    sprite_index = spr_heartflee_fail;
                                    image_speed = 1;
                                }
                            }
                            else
                            {
                                mainState = (5 << 0);
                                
                                with (obj_battleheart)
                                    visible = false;
                                
                                textEndAutomatically = false;
                                dx_scene(fleeSceneOverride);
                            }
                        }
                        else
                        {
                            var isAbleToFlee = alwaysFlee || ((irandom(100) + (10 * totalTurns)) > 35 || global.equippedarm == -1);
                            
                            if (isAbleToFlee)
                            {
                                mainState = (4 << 0);
                                
                                with (obj_battleheart)
                                {
                                    hspeed = -3;
                                    sprite_index = spr_heartflee;
                                    image_speed = 0.5;
                                }
                                
                                sfx_play(snd_flee);
                                bt_stat_update();
                                ds_map_set(global.flags, "last_fled", true);
                                ds_map_set_post(global.flags, "flees", ds_map_find_value(global.flags, "flees") + 1);
                                
                                if (totalXpReward != 0 || totalGoldReward != 0)
                                {
                                    global.dxformat[0] = _string(totalXpReward);
                                    global.dxformat[1] = _string(totalGoldReward);
                                    drawableText = dxd("battlesystem.fleemsgstat");
                                }
                                else
                                {
                                    drawableText = dxd_raw("battlesystem.fleemsg" + _string(irandom(3)));
                                }
                            }
                            else
                            {
                                mainState = (9 << 0);
                                selectionY = 0;
                                sfx_play(snd_select);
                                subState = 0;
                                
                                with (obj_battleheart)
                                {
                                    sprite_index = spr_heartflee_fail;
                                    image_speed = 1;
                                }
                            }
                        }
                        
                        endStepLogic();
                        exit;
                    }
                    
                    if (global.control_cancel_pressed)
                    {
                        selectionX = selectedButton;
                        selectionY = 0;
                        selectedButton = (-1 << 0);
                        mainState = (1 << 0);
                        drawableText = "";
                        restartWriter();
                    }
                }
                
                break;
        }
        
        break;
    
    case (10 << 0):
        var selXBefore = selectionX;
        
        if (global.control_left_pressed)
            selectionX = number_sub_wrap(selectionX, 3, 0);
        
        if (global.control_right_pressed)
            selectionX = number_add_wrap(selectionX, 3, 0);
        
        if (selXBefore != selectionX)
            sfx_play(snd_squeak);
        
        if (writer != -4 && instance_exists(writer))
        {
            if (!writer.isDone)
            {
                writer.doSkip(nextLine);
                nextLine = false;
            }
            else
            {
                nextLine = true;
            }
        }
        
        if (global.control_confirm_pressed)
        {
            mainState = (5 << 0);
            obj_battleheart.visible = false;
            scene_resume();
        }
        
        break;
    
    case (5 << 0):
        if (writer != -4 && instance_exists(writer))
        {
            if (!controlLock)
            {
                if (!writer.isDone)
                {
                    writer.doSkip(nextLine);
                    nextLine = false;
                }
                else
                {
                    nextLine = true;
                    
                    if (global.control_confirm_pressed || global.insta_stop_next_line || (global.ctoskip && global.control_menu))
                    {
                        global.insta_stop_next_line = false;
                        
                        if (textEndAutomatically)
                        {
                            textEndAutomatically = false;
                            beginAttackMode();
                        }
                        else if (!scene_resume())
                        {
                            beginAttackMode();
                        }
                    }
                }
            }
        }
        
        break;
    
    case (3 << 0):
        if (!controlLock)
        {
            if (!writer.isDone)
            {
                writer.doSkip(nextLine);
                nextLine = false;
            }
            else
            {
                nextLine = true;
                
                if (global.control_confirm_pressed || global.insta_stop_next_line || (global.ctoskip && global.control_menu))
                {
                    global.insta_stop_next_line = false;
                    
                    if (textEndAutomatically)
                    {
                        if (winSceneOverride != "")
                        {
                            mainState = (7 << 0);
                            dx_scene(winSceneOverride);
                        }
                        else
                        {
                            textEndAutomatically = false;
                            controlLock = true;
                            writer.internalStr = "";
                            battleTriggerEnd();
                        }
                    }
                    else
                    {
                        scene_resume();
                    }
                }
            }
        }
        
        break;
    
    case (6 << 0):
        with (obj_battleheart_purple)
        {
            if (!drawLines)
            {
                lineAlpha = 0;
                drawLines = true;
                currRow = floor(numRows / 2);
            }
        }
        
        if (!instance_exists(obj_speechbubble) && (global.battle_id < 28 || !isBoxMoving || startAttackWithBoxMoving))
        {
            with (obj_battleheart_blue)
            {
                soulGrav = 0;
                jumpState = 2;
            }
            
            mainState = (7 << 0);
            
            if (global.battle_id > 0 && global.battle_id < 28)
            {
                if (attackTime != -1)
                    attackTimer = attackTime;
                
                attackFrame = 0;
            }
            
            obj_battleheart.canMove = true;
            
            try
            {
                global.bev_subtype = 0;
                
                for (var i = 0; i < 3; i++)
                {
                    if (monsters[i] != -4)
                    {
                        with (monsters[i])
                        {
                            if (isActive)
                                event_user(1);
                        }
                    }
                }
                
                with (obj_manager_parent)
                    event_user(1);
            }
            catch (e)
            {
                debug_error(e);
            }
            
            if (global.battle_id == 0 || global.battle_id >= 28)
            {
                if (attackTime != -1)
                    attackTimer = attackTime;
                
                attackFrame = 0;
            }
        }
        
        break;
    
    case (7 << 0):
        if (attackTime != -1)
        {
            attackTimer--;
            attackFrame++;
            
            if (attackTimer <= 0)
            {
                endAttackMode();
            }
            else
            {
                try
                {
                    global.bev_subtype = 1;
                    
                    for (var i = 0; i < 3; i++)
                    {
                        if (monsters[i] != -4)
                        {
                            with (monsters[i])
                            {
                                if (isActive)
                                    event_user(1);
                            }
                        }
                    }
                    
                    with (obj_manager_parent)
                        event_user(1);
                }
                catch (e)
                {
                    debug_error(e);
                }
            }
        }
        
        break;
    
    case (9 << 0):
        if (subState == 0)
        {
            with (obj_battleheart)
            {
                if (floor(image_index) >= (image_number - 1))
                {
                    image_speed = 0;
                    image_index = image_number - 1;
                    sfx_play(snd_error);
                    other.subState = 1;
                }
            }
        }
        else if (subState++ >= 15)
        {
            subState = 0;
            
            with (obj_battleheart)
            {
                sprite_index = spr_redsoul;
                image_speed = 0;
                image_index = 0;
            }
            
            if (fleeSceneOverride != "")
            {
                mainState = (5 << 0);
                obj_battleheart.visible = false;
                textEndAutomatically = false;
                dx_scene(fleeSceneOverride);
            }
            else
            {
                beginAttackMode();
            }
        }
        
        break;
}

endStepLogic();
