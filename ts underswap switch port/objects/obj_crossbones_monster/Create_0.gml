event_inherited();
normalSprite = spr_crossbones_joke;
hurtSprite = -1;
dustFilename = "";
offsetDmgY = 0;
shmoving = true;
shmoveCounter = 0;
freezeShmove = false;
capeIndex = 0;
faceSprite = spr_cbfaceb_normal;
fightingStance = false;
bodyIndex = 0;
superdog = false;
sweatInd = -1;
noHorzBob = false;
slowShmove = false;
eyeFlashInd = 0;
image_xscale = 2;
image_yscale = 2;
depth = 1;
maxHp = 2;
hp = maxHp;
defense = 1;
xpReward = 75;
goldReward = 0;

if (items_get_armor() == 49)
    attack = 6;
else
    attack = 8;

mercyResistance = 20;
fullMercyResist = true;
isFleeAvailable = false;
flavorColor = 16753779;

if (global.flavor_sprites)
    image_blend = flavorColor;

stallTurns = 0;
attackType = -1;
bubbleX = x + sprite_width;
bubbleY = y;
actButtonXOff = 0;
lastActButtonArgs = [];
lastBullet = -4;
bulletCurve = undefined;
boneId = 0;
bones = array_create(512, -4);
currHspeed = 0;
currVspeed = 0;
triggeredShed = false;
needSafeAttackEnd = false;
safeAttackMovingOff = false;
actor_shake_init(true);
karma = false;
fightType = 0;
blasterSprite = spr_gasterblaster_cb;
phase = 1;
turn = 1;
phaseEnd = false;
vflavor = -1;
vflavorstale = true;
vfakeact = 0;
vfakefight = 0;
vfakeitem = 0;
vjoke = 0;
vpose = 0;
vdraw = 0;
vextrasb = 0;
dodgingState = 0;
dodgeSpd = 0;
dodgeDelay = 0;
vattack = -1;
vfinalattemptkill = false;
needsTransitionSb = false;
disableShed = false;
glowAmount = 0;
glowSurface = -1;
glowSiner = 0;
glowTimer = 0;
rematch = false;
hasAttacked = false;
attackedThisTurn = false;
actualMissThisTurn = false;
removedMask = false;
storyNumber = -1;
boxSiner = 0;
boxSinerSpeed = 0;
boxSinerAmplitude = 80;
fightType = cb_fight_type();

if (fightType != 2)
{
    var bn = "battles.cb.";
    bt_add_act(bn, "act_check");
    bt_add_act(bn, "act_joke");
    bt_add_act(bn, "act_pose");
    bt_add_act(bn, "act_draw");
    var wep = items_get_weapon();
    
    if (wep == 0)
        bt_add_act(bn, "act_fetch");
    else if (wep == 7)
        bt_add_act(bn, "act_shoot");
    
    flavorScene = bn + "flavor";
    name = dxd_raw(bn + "name");
    blasterSprite = spr_gasterblaster_cb;
    
    with (obj_battlebg)
    {
        image_index = 7;
        visible = true;
    }
    
    var phase1 = ds_map_find_value(global.flags, "st_cb_battle");
    
    if (phase1 >= 20)
        phase1 = 10;
    
    if (phase1 > 0)
    {
        rematch = true;
        phase = 2;
        fightingStance = true;
        faceSprite = spr_cbfaceb2_normal;
        
        switch (phase1)
        {
            case 1:
                bt_replace_act("battles.cb.", "act_joke", "act_fake_act");
                break;
            
            case 2:
                bt_replace_act("battles.cb.", "act_pose", "act_fake_fight");
                break;
            
            case 3:
                bt_replace_act("battles.cb.", "act_draw", "act_fake_item");
                break;
            
            default:
                bt_replace_act("", ds_list_find_value(actScenes, (phase1 - 10) + 1), "battles.cb.act_fight");
                break;
        }
    }
}
else
{
    var bn = "battles.cb_g.";
    bt_add_act(bn, "act_check");
    flavorScene = bn + "flavor";
    karma = true;
    name = dxd_raw(bn + "name");
    blasterSprite = spr_gasterblaster;
    storyNumber = ds_map_find_value(global.pflags, "cb_endure");
    
    if (storyNumber == 0.5)
        storyNumber = 0;
    
    obj_battlemanager.spareObjOverride = id;
    obj_battlemanager.spareEvOverride = 14;
}

override = true;
sbOverride = -4;

function sendToTheShack()
{
    with (obj_battlemanager)
    {
        bt_set_boxtype((1 << 0));
        mainState = (0 << 0);
    }
    
    with (obj_bullet_parent)
        instance_destroy();
    
    with (obj_speechbubble)
        instance_destroy();
    
    music_gain(0, 1000);
    
    if (needSafeAttackEnd)
    {
        dx_scene("battles.cb.safe_attack_end");
    }
    else
    {
        sprite_index = normalSprite;
        fightingStance = false;
        shmoving = true;
        faceSprite = spr_cbfaceb_normal;
        sbOverride = "battles.cb.to_the_shack";
        speed = 0;
        bodyIndex = 0;
        alarm[0] = 60;
    }
}

specialSb = 0;
specialText = false;
specialTextWriter = -4;
obj_gamemanager.bindTextHandler(function(argument0)
{
    if (specialText)
    {
        var writer = instance_create_xy(80, 220, obj_writer);
        writer.draw = true;
        writer.skippable = false;
        writer.speechBubble = true;
        writer.resume();
        writer.message = argument0;
        writer.sound = -1;
        writer.textSpeed = 1;
        writer.type = 0;
        writer.textx = writer.x;
        writer.texty = writer.y;
        specialTextWriter = writer;
        return true;
    }
    
    if (specialSb >= 1)
    {
        var b = obj_speechbubble.id;
        
        if (b.writer == -4)
        {
            var writer = instance_create(obj_writer);
            writer.draw = false;
            writer.skippable = true;
            writer.speechBubble = true;
            b.writer = writer;
            b.monsterIndex = monsterIndex;
            b.onlyTarget = true;
        }
        
        if (specialSb == 2)
        {
            b.onlyTarget = false;
            b.expectingMore = false;
            
            with (global.dxcontext)
                running = true;
        }
        
        if (specialSb == 4)
        {
            with (b)
            {
                sound = snd_alblip;
                textEffect = 0;
                textType = 9;
                textSpeed = 1;
                text = format_dialogue_both(argument0, sprite_width - 52, global.lang_charwidth_sm, false);
                startDialogue();
            }
        }
        else if (specialSb == 3)
        {
            with (b)
            {
                sound = snd_papblip;
                textEffect = 0;
                textType = 8;
                textSpeed = 1;
                text = format_dialogue_both(argument0, visuals.width - 12, global.lang_charwidth_sm, false);
                startDialogue();
            }
        }
        else if (specialSb == 5)
        {
            with (b)
            {
                sound = -1;
                textEffect = 0;
                textType = 3;
                textSpeed = 1;
                text = format_dialogue_both(argument0, visuals.width - 12, global.lang_charwidth_sm, false);
                startDialogue();
            }
        }
        else
        {
            with (b)
            {
                sound = obj_crossbones_monster.removedMask ? snd_sansblip : snd_cbblip;
                textEffect = 0;
                textType = 7;
                textSpeed = 1;
                text = format_dialogue_both(argument0, visuals.width - 12, global.lang_charwidth_sm, false);
                startDialogue();
            }
        }
        
        return true;
    }
    
    return false;
});
