event_inherited();
depth = 1;
var bn = "battles.greaterdog.";
normalSprite = spr_greaterdog;
hurtSprite = spr_greaterdog_hurt;
dustFilename = "si_gd";
name = dxd_raw(bn + "name");
journalId = 26;
asleepAmount = 0;
bt_add_act(bn, "check");
bt_add_act(bn, "call");
bt_add_act(bn, "pull");
bt_add_act(bn, "sing");
bt_add_act(bn, "pet");
var wep = items_get_weapon();

if (wep == 0)
    bt_add_act(bn, "fetch");
else if (wep == 7)
    bt_add_act(bn, "shoot");

flavorScene = bn + "flavor";
maxHp = 105;
hp = maxHp;
defense = 4;

if (ruth_started())
    defense += 2;

xpReward = 80;
goldReward = 40;
attack = 6;
mercyResistance = 20;
isFleeAvailable = true;
obj_battlemanager.alwaysFlee = true;
flavorColor = 13604505;
fullMercyResist = true;

if (global.flavor_sprites)
    image_blend = flavorColor;

image_xscale = 2;
image_yscale = 2;
image_speed = 0;
attackSpeed = 0;
attackType = -1;
attackTime = 0;
vout = false;
vasleep = false;
vsing = 0;
vsingdid = false;
vcall = 0;
vcalldid = false;
vcallout = 0;
voutpet = 0;
voutpetdid = false;
vfetch = 0;
vfetchdid = false;
vshoot = 0;
vshootdid = false;
vprepull = 0;
vpull = 0;
ded = false;
