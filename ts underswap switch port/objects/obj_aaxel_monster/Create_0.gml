event_inherited();
var bn = "battles.greasers.aaxel.";
flavorScene = "battles.greasers.flavor";
image_xscale = 2;
image_yscale = 2;
image_speed = 0;
name = dxd_raw(bn + "name");
bt_add_act(bn, "act0");
bt_add_act(bn, "act1");
bt_add_act(bn, "act2");
bt_add_act(bn, "act3");
maxHp = 98;
hp = maxHp;
defense = 2;
xpReward = 52;
goldReward = 15;
attack = 6;
fullMercyResist = true;
mercyResistance = 5;
isFleeAvailable = false;
invincible = true;
offsetDmgY = 150;
face = spr_aaxel_face_neutral;
bobbing = true;
bodySiner = 0;
yOrigin = y;
flavorColor = make_color_rgb(221, 105, 66);

if (global.flavor_sprites)
    image_blend = flavorColor;

vflexdid = false;
vflex = 0;
vinsultdid = false;
vinsult = 0;
vlunchmoney = false;
vdistraught = false;
vmoneystate = 0;
vspeech = -1;
