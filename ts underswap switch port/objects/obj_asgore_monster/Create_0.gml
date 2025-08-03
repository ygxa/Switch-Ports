event_inherited();
obj_gamemanager.bindTextHandler(undefined, function()
{
    if (notDoneIntro)
    {
        notDoneIntro = false;
        sprite_index = -1;
        animatedBody = true;
        x = 176;
        obj_battlemanager.mainState = (1 << 0);
        
        with (obj_speechbubble)
        {
            expectingMore = false;
            killTimer = -2;
        }
        
        obj_battleheart.visible = true;
        dialogue_simple(ruth_enabled() ? "battles.asgore.intext_g" : "battles.asgore.intext");
        global.currentmusic_stored = global.currentmusic;
        global.currentmusic = -4;
        music_lcplay("asgoreboss", true);
        obj_battlemanager.stopSongOnBattleEnd = true;
        view_flash(undefined, 0);
        return true;
    }
    
    return false;
});
maxHp = 440;
hp = maxHp - ds_map_find_value(global.flags, "ff_asg_dmg");
xpReward = 150;
goldReward = 30;
defense = 1;
attack = 6;
hurtSound = snd_monhurt1;
journalId = 0;
ignoreSpriteForHPBar = true;
offsetUiX = 142;
offsetDmgY = 180;
offsetSliceY = 160;
var bn = "battles.asgore.";
normalSprite = -1;
hurtSprite = -1;
name = dxd_raw(bn + "name");
flavorScene = bn + "flavor";
isRuth = ruth_enabled();

if (isRuth)
    dustFilename = "rh_a2";
else
    dustFilename = "rh_a";

dustY = 32;
isFleeAvailable = !isRuth;
invincible = isRuth;
mercyResistance = 80;
fullMercyResist = true;
shakeAmount = 15;
shakeSpeed = 2;
shakeCmdAmount = 1;
wantShakeCmd = false;
xCorrectOverride = false;
bt_add_act(bn, "act_check");
bt_add_act(bn, "act_talk");
image_xscale = 2;
image_yscale = 2;
vtalk = 0;
vtalkdid = -1;
vask = 0;
vaskdid = -1;
vremind = 0;
vreminddid = -1;
vfinal = -1;
vfinaldid = false;
vfinalbegan = false;
vflavor = -1;
vruth = 0;
vruthfinal = false;
vhug = false;
attackType = -1;
attackSubtype = -1;
attackSide = 0;
attackTime = 0;
doRuthAttack = false;
attackIntensity = -1;
weakAttackTriggered = false;
cantAttack = false;
hitsThisTurn = 0;

weakAttack = function()
{
    var endAttackYet = true;
    
    with (obj_asgbul_spear)
    {
        currSide = ds_list_size(sides) - 1;
        setState(5);
        endAttackYet = false;
        obj_battlemanager.destroyBulletsOnAttackEnd = false;
    }
    
    if (endAttackYet)
        obj_battlemanager.endAttackMode();
};

fireFountains = array_create(5, -4);
obj_battlemanager.spareObjOverride = id;
obj_battlemanager.spareEvOverride = 10;

if (isFleeAvailable)
    obj_battlemanager.alwaysFlee = true;

notDoneIntro = true;
animatedBody = false;
drawSpear = true;
override = true;
siner = 0;
sinerIntensity = 0.7;
step = 0;
capeIndex = 0;
armRY = 82;
armLY = 88;
torsoY = 66;
headY = 0;
capeY = 84;
spearY = 46;
initX = x - 20;
xstart = initX;
initY = y;
initDepth = depth;
xOffset = 0;
kneeling = false;
face = spr_asgface_surprise_still;
flavorColor = global.flavor_sprites ? make_color_rgb(211, 142, 232) : 16777215;
image_blend = flavorColor;
image_speed = 0;

doSniperFlames = function()
{
    if (attackTime == 1)
        obj_battlemanager.attackTimer = 209;
    
    var time = 30;
    
    switch (attackIntensity)
    {
        case 0:
        case 5:
            time = 30;
            break;
        
        case 1:
            time = 25;
            break;
        
        case 2:
            time = 20;
            break;
        
        case 3:
            time = 40;
            break;
        
        case 4:
            time = 35;
            break;
    }
    
    if ((attackTime % time) == 1)
    {
        if (attackIntensity < 3)
        {
            with (bt_bullet(obj_asgbul_firesnipe))
            {
                side = other.attackSide;
                
                if (side == 0)
                {
                    x = -60;
                    target = obj_battlemanager.boxX2;
                }
                else
                {
                    x = 700;
                    target = obj_battlemanager.boxX1;
                }
            }
            
            attackSide = !attackSide;
        }
        else
        {
            var targetType = 1;
            
            repeat (2)
            {
                with (bt_bullet(obj_asgbul_firesnipe))
                {
                    side = other.attackSide;
                    self.targetType = targetType;
                    targetType++;
                    
                    switch (targetType)
                    {
                        case 0:
                            y = obj_battleheart.y + 8;
                            break;
                        
                        case 1:
                            y = obj_battleheart.y - 32;
                            break;
                        
                        case 2:
                            y = obj_battleheart.y + 32;
                            break;
                    }
                    
                    if (y > (obj_battlemanager.boxY2 - 12))
                    {
                        instance_destroy();
                        break;
                    }
                    
                    if (side == 0)
                    {
                        x = -60;
                        target = obj_battlemanager.boxX2;
                    }
                    else
                    {
                        x = 700;
                        target = obj_battlemanager.boxX1;
                    }
                }
            }
            
            attackSide = !attackSide;
        }
    }
};
