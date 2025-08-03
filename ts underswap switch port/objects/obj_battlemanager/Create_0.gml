monsters = array_create(3, -4);
isAnyMonsterLeft = true;
totalXpReward = 0;
totalGoldReward = 0;
isSerious = ruth_enabled();
isGeneralEnemy = false;
attackTimer = 0;
attackTime = 150;
attackFrame = 0;
attackDifficulty = 0;
attackCancelTurnEnd = false;
mainState = (1 << 0);
selectedButton = (0 << 0);
subState = 0;
selectionX = 0;
selectionY = 0;
itemSelectionY = 0;
itemStartIndex = 0;
currentMaxX = 0;
currentMaxY = 0;
boxType = (0 << 0);
boxTypeAttack = (1 << 0);
isBoxMoving = false;
dominantMonsterFlavor = -1;
drawableText = "";
drawableTextBefore = "";
monsterNameCount = 0;
chosenMonster = -1;
chosenMonsterMenuY = -1;
itemCount = 0;
totalTurns = 0;
spareObjOverride = -4;
spareEvOverride = -1;
fleeSceneOverride = "";
fleeOverrideFall = true;
alwaysFlee = false;
winSceneOverride = "";

boxReset = function()
{
    boxDestX1 = global.boxtypes[boxType][3];
    boxDestY1 = global.boxtypes[boxType][2];
    boxDestX2 = global.boxtypes[boxType][1];
    boxDestY2 = global.boxtypes[boxType][0];
    boxX1 = boxDestX1;
    boxY1 = boxDestY1;
    boxX2 = boxDestX2;
    boxY2 = boxDestY2;
    isBoxMoving = false;
};

boxReset();
boxSurfaceTransform = -1;
boxSurfaceCutoff = -1;
boxTransform = false;
boxCutoff = false;
boxSmooth = false;
boxTranslateX = 0;
boxTranslateY = 0;
boxAngle = 0;
boxAngleForced = 0;
boxAngleXCenterOffset = 0;
boxAngleYCenterOffset = 0;
boxObjectsTransform = ds_list_create();
boxObjectsCutoff = ds_list_create();
boxObjectsPost = ds_list_create();
boxCurrentlyDrawing = false;
boxMoveSpeed = 15;
darkenAlpha = 0;
statQueue = ds_map_create();
gameover = false;
drawButtons = true;
drawStats = true;
compactStats = false;
controlLock = false;
stopSongOnBattleEnd = false;
resumeOverworldMusic = false;
destroyBulletsOnAttackEnd = true;
hpBarSurface = -1;
shrinkTextMultiplier = 1;
armorDefenseHelper = 0;
portraitMode = false;
buttonColor = global.area_theme[0];
buttonColorSel = global.area_theme[1];
writer = -4;
nextLine = true;
textDelay = 0;
textSpeed = 1;
textSound = snd_textblip1;
textFont = fnt_main;
text = "";
textEndAutomatically = false;
lastItemIdUsed = -1;
timesLastItemUsed = 0;
lastItemCounter = 0;
hpBarOffset = 0;
statsHPTextXOffset = 0;
statsHPTextYOffset = 0;
instance_create(obj_battlebg);

with (instance_create(obj_battleheart))
    event_user(0);

var f = instance_create(obj_fader);
f.toSolid = false;
f.alpha = 1;

startDialogue = function()
{
    if (writer == -4 || !instance_exists(writer))
    {
        writer = instance_create(obj_writer);
        writer.draw = false;
    }
    
    writer.resume();
    writer.message = text;
    writer.sound = textSound;
    writer.textSpeed = textSpeed;
    
    if (global.lang == "en")
    {
        shrinkTextMultiplier = 1;
    }
    else
    {
        var lb = linebreak_count(text);
        
        if (lb <= 2)
            shrinkTextMultiplier = 1;
        else
            shrinkTextMultiplier = 2.5 / lb;
    }
};

battleTriggerEnd = function()
{
    mainState = (8 << 0);
    drawableText = "";
    var f = instance_create(obj_fader);
    f.fadeSpeed = 0.08;
    f.completeCallback = battleFadeEnd;
};

battleFadeEnd = function()
{
    with (obj_transition_parent)
        event_user(1);
    
    bt_end_music();
    ds_map_set(global.flags, "shk_b", false);
    
    if (global.currentroom == -1)
        global.currentroom = rm_wake;
    
    room_goto(global.currentroom);
    global.currentroom = -1;
    global.reset_state_on_room_start = true;
};

endAttackModeMain = function()
{
    bt_set_boxtype((0 << 0));
    
    with (obj_battleheart)
    {
        canMove = false;
        visible = false;
    }
    
    mainState = (1 << 0);
    isBoxMoving = true;
    attackDifficulty = 0;
    var statList = ds_map_find_value(statQueue, totalTurns);
    
    if (statList)
    {
        for (var i = 0; i < ds_list_size(statList); i++)
        {
            var statArray = ds_list_find_value(statList, i);
            bt_apply_stat_boost(statArray[0], statArray[1] * -1);
        }
        
        ds_map_delete(statQueue, totalTurns);
        ds_list_destroy(statList);
    }
    
    if ((items_get_armor() == 25 && (totalTurns % 3) == 0) || (items_get_armor() == 26 && (totalTurns % 2) == 0))
    {
        player_health(1);
        obj_overworldmenu.alarm[0] = 1;
    }
    
    if (lastItemIdUsed != -1)
    {
        lastItemCounter++;
        
        if (lastItemCounter >= 2)
        {
            lastItemCounter = 0;
            lastItemIdUsed = -1;
            timesLastItemUsed = 0;
        }
    }
    
    bt_group_flavor_update(global.battle_id);
    
    if (dominantMonsterFlavor != -1 && monsters[dominantMonsterFlavor].isActive)
    {
        chosenMonster = dominantMonsterFlavor;
        dominantMonsterFlavor = -1;
    }
    else
    {
        for (chosenMonster = 0; chosenMonster < 3; chosenMonster++)
        {
            if (monsters[chosenMonster] != -4 && monsters[chosenMonster].isActive)
                break;
        }
    }
    
    dx_instance_run_scene(global.dxinst, monsters[chosenMonster].flavorScene);
    dx_instance_update(global.dxinst);
    chosenMonster = -1;
    scene_resume();
};

endAttackMode = function()
{
    global.bev_subtype = 2;
    
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
    
    if (destroyBulletsOnAttackEnd)
        instance_destroy(obj_bullet_parent);
    else
        destroyBulletsOnAttackEnd = true;
    
    if (attackCancelTurnEnd)
    {
        attackCancelTurnEnd = false;
        exit;
    }
    
    endAttackModeMain();
};

checkForWin = function()
{
    isAnyMonsterLeft = false;
    
    for (var i = 0; i < 3; i++)
    {
        var mon = monsters[i];
        
        if (mon != -4 && mon.isActive)
        {
            isAnyMonsterLeft = true;
            break;
        }
    }
    
    if (!isAnyMonsterLeft)
    {
        bt_end_music();
        var origBoxType = boxType;
        bt_set_boxtype((0 << 0));
        
        if (!isBoxMoving && origBoxType == boxType)
        {
            mainState = (3 << 0);
            drawableText = "";
            obj_battleheart.visible = false;
            global.dxformat[0] = _string(totalXpReward);
            global.dxformat[1] = _string(totalGoldReward);
            var winText = dxd("battlesystem.winmsg");
            
            if (bt_stat_update())
                winText += ("#" + dxd_raw("battlesystem.lvlupmsg"));
            
            dialogue_simple_custom(winText);
        }
        else
        {
            alarm[0] = 1;
        }
    }
};

restartWriter = function()
{
    if (writer != -4)
        writer.resume();
};

heartStartX = 312;
heartStartY = 312;
heartStartVisible = true;
startAttackWithBoxMoving = false;
preventAttackMode = false;

beginAttackMode = function()
{
    if (preventAttackMode)
        exit;
    
    bt_set_boxtype(boxTypeAttack);
    mainState = (6 << 0);
    subState = 0;
    selectionX = selectedButton;
    selectedButton = (-1 << 0);
    drawableText = "";
    totalTurns += 1;
    
    with (obj_manager_parent)
        event_user(2);
    
    with (obj_monster_parent)
    {
        if (isActive)
            event_user(3);
    }
    
    with (obj_battleheart)
    {
        x = other.heartStartX;
        y = other.heartStartY;
        visible = other.heartStartVisible;
    }
};

presentMonsterList = function()
{
    drawableText = "";
    monsterNameCount = 0;
    
    for (var i = 0; i < 3; i++)
    {
        if (monsters[i] != -4 && monsters[i].isActive)
        {
            monsterNameCount++;
            var n = monsters[i].name;
            global.dxformat[0] = n;
            
            if (monsters[i].isSpareable)
            {
                switch (ds_map_find_value(global.flags, "spare_col"))
                {
                    case 1:
                        drawableText += "`cp`";
                        break;
                    
                    case 2:
                        break;
                    
                    default:
                        drawableText += "`cY`";
                        break;
                }
            }
            
            drawableText += (dxd("battlesystem.itemname") + "#");
            
            if (monsters[i].isSpareable)
                drawableText += "`c$`";
        }
    }
};

drawButton = function(argument0, argument1, argument2, argument3, argument4, argument5)
{
    if (argument5)
    {
        draw_sprite_ext(argument2, 0, argument0, argument1, 1, 1, 0, buttonColorSel, 1);
        draw_sprite_ext(argument4, 0, argument0, argument1, 1, 1, 0, buttonColorSel, 1);
    }
    else
    {
        draw_sprite_ext(argument2, 0, argument0, argument1, 1, 1, 0, buttonColor, 1);
        draw_sprite_ext(argument3, 0, argument0, argument1, 1, 1, 0, buttonColor, 1);
        draw_sprite_ext(argument4, 0, argument0, argument1, 1, 1, 0, buttonColor, 1);
    }
};

spawnWeaponTarget = function()
{
    var weapon = items_get_weapon();
    
    if (weapon != -1)
    {
        var item = ds_map_find_value(global.items, weapon);
        
        if (struct_exists(item, "target"))
            item.target();
        else
            instance_create_xy(320, 262, obj_battletarget);
    }
    else
    {
        instance_create_xy(320, 262, obj_battletarget);
    }
};

endStepLogic = function()
{
    if (global.battle_id == 39 && mainState == (1 << 0) && ruth_started())
    {
        with (obj_muffet_monster)
        {
            if (vgfightwebs > 0)
            {
                if (other.selectionX == 0)
                    other.selectionX = 1;
            }
        }
    }
    
    with (obj_battleheart)
        event_user(0);
    
    if (boxX1 != boxDestX1 || boxY1 != boxDestY1 || boxX2 != boxDestX2 || boxY2 != boxDestY2)
    {
        isBoxMoving = true;
        
        if (boxTransform && boxSmooth)
        {
            boxX1 = number_approach_smooth(boxX1, boxDestX1, 0.2, 0.5);
            boxY1 = number_approach_smooth(boxY1, boxDestY1, 0.2, 0.5);
            boxX2 = number_approach_smooth(boxX2, boxDestX2, 0.2, 0.5);
            boxY2 = number_approach_smooth(boxY2, boxDestY2, 0.2, 0.5);
        }
        else
        {
            var _x1Diff = boxX1 - boxDestX1;
            
            if (abs(_x1Diff) <= boxMoveSpeed)
                boxX1 = boxDestX1;
            else
                boxX1 -= (sign(_x1Diff) * boxMoveSpeed);
            
            var _y1Diff = boxY1 - boxDestY1;
            
            if ((_x1Diff == 0 && _y1Diff != 0) || _y1Diff < 0)
            {
                if (abs(_y1Diff) <= boxMoveSpeed)
                    boxY1 = boxDestY1;
                else
                    boxY1 -= (sign(_y1Diff) * boxMoveSpeed);
            }
            
            var _x2Diff = boxX2 - boxDestX2;
            
            if (abs(_x2Diff) <= boxMoveSpeed)
                boxX2 = boxDestX2;
            else
                boxX2 -= (sign(_x2Diff) * boxMoveSpeed);
            
            var _y2Diff = boxY2 - boxDestY2;
            
            if (abs(_y2Diff) <= boxMoveSpeed)
                boxY2 = boxDestY2;
            else
                boxY2 -= (sign(_y2Diff) * boxMoveSpeed);
        }
    }
    else
    {
        isBoxMoving = false;
    }
    
    controlLock = preControlLock;
};

bt_group(global.battle_id);
ds_map_set(global.flags, "last_spared", false);
ds_map_set(global.flags, "last_fled", false);
ds_map_set(global.flags, "last_killed", 0);

KarmaHandler = function(argument0, argument1, argument2) constructor
{
    static tick = function()
    {
        var timerLimit = 1;
        
        if (global.difficulty <= 0.5)
            timerLimit = floor(2 + (1 / (6 * clamp(global.difficulty, 0.05, 0.5))));
        
        baseDamageTimer++;
        
        if (baseDamageTimer >= timerLimit)
            baseDamageTimer = 0;
        
        if (karma <= 0.001)
            karma = 0;
        
        if (karma > 0 && global.playerhp == lastHp)
        {
            depleteTimer++;
            var intensity = clamp(karma / karmaLimit, 0, 1);
            
            if (depleteTimer >= floor(power(1.1, 40 * (1 - intensity))))
            {
                depleteTimer = 0;
                karma--;
                global.playerhp--;
            }
            
            if (global.playerhp <= 0)
                global.playerhp = 1;
            
            if (floor(karma) < 0)
                karma = 0;
        }
        else
        {
            depleteTimer = 0;
        }
        
        lastHp = global.playerhp;
        var len = array_length(bulletHitCooldown);
        var hitByAnything = false;
        
        for (var i = 0; i < len; i++)
        {
            if (bulletHitCooldown[i] > 0)
            {
                hitByAnything = true;
                bulletHitCooldown[i]--;
                
                if (bulletHitCooldown[i] == 0)
                    bulletDamageMult[i] = 1;
            }
        }
        
        if (!hitByAnything)
            baseDamageTimer = 0;
    };
    
    static add = function(argument0, argument1)
    {
        argument0 *= karmaMultiplier;
        argument0 *= global.difficulty;
        bulletHitCooldown[argument1] = 3;
        argument0 *= bulletDamageMult[argument1];
        
        if (bulletDamageMult[argument1] > 0.2)
            bulletDamageMult[argument1] -= 0.2;
        
        karma += argument0;
        
        if (karma >= karmaLimit)
            karma = karmaLimit;
        
        if (karma >= (global.playerhp - 1))
            karma = global.playerhp - 1;
    };
    
    karma = 0;
    karmaLimit = argument1;
    karmaMultiplier = argument0;
    depleteTimer = 0;
    bulletDamageMult = array_create(argument2, 1);
    bulletHitCooldown = array_create(argument2, 0);
    lastHp = global.playerhp;
    baseDamageTimer = 0;
};

statsKarmaHandler = undefined;
statsText = "";
statsHPWidth = 0;
statsHPWidth2 = 0;
statsHPKarmaOff = 0;
statsHPKarmaWidth = 0;
statsHP = "";
cachedStatsText = "";

buildCache = function()
{
    if (compactStats)
        cachedStatsText = dxd_raw("battlesystem.onlylv");
    else
        cachedStatsText = dxd_raw("battlesystem.nameandlv");
    
    cachedHPText = dxd_raw("battlesystem.hp");
    cachedItemName = dxd_raw("battlesystem.itemname");
    cachedItemHeal = dxd_raw("items.gen.btinfo_heal");
};

buildCache();

with (obj_monster_parent)
{
    if (journalId != -1)
        journal_set_known(journalId, (0 << 0));
    
    if (override)
        event_user(15);
}
