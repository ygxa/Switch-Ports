event_inherited();
depth = -5;
var bn = "battles.ruinedknights.karapaes.";
normalSprite = spr_rkb_karapaes;
hurtSprite = spr_rkb_karapaes;
dustFilename = "rhkk";
name = dxd_raw(bn + "name");
image_speed = 0.18;
image_xscale = 2;
image_yscale = 2;
offsetUiX = -22;
bt_add_act(bn, "act0");
bt_add_act(bn, "act1");
bt_add_act(bn, "act2");
maxHp = 50;
hp = maxHp;
defense = 8;
baseDefense = defense;
xpReward = 6;
goldReward = 4;
attack = 4;
fullMercyResist = true;
isFleeAvailable = false;
flavorColor = make_color_rgb(221, 194, 55);

if (global.flavor_sprites)
    image_blend = flavorColor;

killcounter = 0;
justkill = false;
vpraise = 0;
vdidpraise = false;
vrebuke = 0;
vdidrebuke = false;
vdonerebuke = 0;
vsandwich = false;
siner = 4.1887902047863905;
wingsiner = 0;
stopmove = 5;
