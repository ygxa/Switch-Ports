event_inherited();
var bn = "battles.kk.";
bt_add_act(bn, "act_check");
bt_add_act(bn, "act_remind");
bt_add_act(bn, "act_convince");
flavorScene = bn + "flavor";
name = dxd_raw(bn + "name");
normalSprite = sprite_index;
hurtSprite = spr_kk_body_hurt;
dustFilename = "";
offsetUiX = -10;
offsetDmgY = 200;
image_xscale = 2;
image_yscale = 2;
depth = 1;
maxHp = 250;
hp = maxHp;
defense = 2;
attackIntensity = 1;
xpReward = 75;
goldReward = 0;

if (items_get_armor() == 49)
    attack = 6;
else
    attack = 8;

mercyResistance = 20;
fullMercyResist = true;
isFleeAvailable = false;
invincible = true;
flavorColor = 4609481;

if (global.flavor_sprites)
    image_blend = flavorColor;

shakeForDiannex = false;
funnyAttackBoost = 0;
funnyDefenseLower = 0;
attackType = -1;
siner = 0;
vturn = 0;
vcheckdid = false;
vremind = 0;
vreminddid = false;
vconvince = 0;
vconvincedid = false;
vremindstage = 0;
vconvincestage = 0;
vbeganactpath = 0;
vflavorprogress = 0;
vdonefighting = false;
vgoldcheck = false;
vlowhp = 0;
obj_battlemanager.armorDefenseHelper = 3;
attackType = 0;
attackTime = 0;
allowDangerRows = false;
specialAttack = 0;
circleBatAngle = 0;
boomerangBul = -4;
floating = true;
drawFace = spr_kk_face_neutral;
drawOnGround = false;
side = 0;
spewSide = 0;
spewing = false;
spewXShake = 0;
spewXStart = xstart;
soulTransDiannex = false;
transitionTimer = 0;
spewTimer = 0;
wheelFlown = false;

function makeSoulPurple(argument0 = false)
{
    if (argument0)
        soulTransDiannex = true;
    
    transitionTimer = 0;
    spewBats(0);
    alarm[1] = 60;
}

function spewBats(argument0)
{
    spewSide = argument0;
    spewTimer = 0;
    spewing = true;
    alarm[0] = 1;
}

function dropHat(argument0)
{
    with (argument0)
    {
        showContents();
        
        with (contentObj)
            doContentAction();
    }
    
    sfx_play(snd_click, 80, false);
}
