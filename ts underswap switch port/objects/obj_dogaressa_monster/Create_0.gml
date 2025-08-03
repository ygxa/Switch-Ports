event_inherited();
depth = 1;
var bn = "battles.dogi.";
normalSprite = spr_dogaressa;
hurtSprite = spr_dogaressa_hurt;
dustFilename = "si_dr";
name = dxd_raw(bn + "name2");
offsetUiX = 44;
offsetDmgY = 40;
offsetSliceY = 0;
image_xscale = 2;
image_yscale = 2;
image_speed = 0;
bt_add_act(bn, "check", "dogaressa.check");
bt_add_act(bn, "point", "dogaressa.point");
bt_add_act(bn, "splash", "dogaressa.splash");
bt_add_act(bn, "shout");
var wep = items_get_weapon();

if (wep == 0)
    bt_add_act(bn, "fetch", "dogaressa.fetch");
else if (wep == 7)
    bt_add_act(bn, "shoot", "dogaressa.shoot");

flavorScene = bn + "flavor";
maxHp = 108;
hp = maxHp;
defense = 4;

if (ruth_started())
    defense += 2;

xpReward = 30;
goldReward = 20;
attack = 6;
mercyResistance = 20;
fullMercyResist = true;
isFleeAvailable = false;
flavorColor = make_color_rgb(123, 123, 234);

if (global.flavor_sprites)
    image_blend = flavorColor;

colorSlide = 0;
transformable = false;
attackType = -1;
attackVariant = 0;
stage = 0;
returnX = 0;
returnY = 0;
siner = 0;
returnDepth = 0;
vshout = 0;
vspecific = 0;
vpoint1 = 0;
vfetch = 0;
vshoot = 0;
origX = -1;
origY = -1;
mainPosX = x;
mainPosY = y;
finishedHurt = false;
currIndex = 0;
