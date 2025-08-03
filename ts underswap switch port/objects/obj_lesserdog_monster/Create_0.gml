event_inherited();
depth = 1;
var bn = "battles.lesserdog.";
normalSprite = -1;
hurtSprite = spr_lesserdog_hurt;
dustFilename = "si_ld";
name = dxd_raw(bn + "name");
journalId = 24;
ignoreSpriteForHPBar = true;
offsetUiX = 56;
offsetDmgY = 133;
offsetSliceY = 73;
bt_add_act(bn, "check");
bt_add_act(bn, "call");
bt_add_act(bn, "point");
bt_add_act(bn, "pet");
var wep = items_get_weapon();

if (wep == 0)
    bt_add_act(bn, "fetch");
else if (wep == 7)
    bt_add_act(bn, "shoot");

flavorScene = bn + "flavor";
maxHp = 60;
hp = maxHp;
defense = 0;

if (ruth_started())
    defense += 2;

xpReward = 18;
goldReward = 15;
attack = 6;
mercyResistance = 20;
isFleeAvailable = true;
flavorColor = 12445695;

if (global.flavor_sprites)
    image_blend = flavorColor;

image_xscale = 2;
image_yscale = 2;
headInd = 0;
neckLength = 0;
lastSearch = -1;
doneSearch = false;
tailInd = 0;
addNeckCount = 0;
addNeckSide[0] = 0;
addNeckX[0] = 100;
addNeckLength[0] = 20;
addNeckScale[0] = 2;
addNeckKind = 0;
attackType = -1;
attackTime = 0;
attackSpeed = 0;
vcheck = false;
vcall = 0;
vcalldid = false;
vpet = 0;
vpetdid = false;
vtruepet = 0;
vtruepetdid = false;
vpoint = 0;
vpointdid = false;
vfetch = 0;
vfetchdid = false;
vshoot = 0;
vshootdid = false;
vattacked = false;
helicopter = false;
sb = -4;
