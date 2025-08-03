event_inherited();
depth = 2;
flavorScene = "battles.boogie.flavor";
var bn = "battles.boogie.h_";
name = dxd_raw(bn + "name");
hurtSprite = spr_harry_hurt;
normalSprite = spr_harry_hurt;
isFleeAvailable = false;
hp = 70;
maxHp = hp;
defense = 2;
attack = 5;
invincible = true;
mercyResistance = 20;
fullMercyResist = true;

if (ruth_enabled())
{
    xpReward = 35;
    goldReward = 1;
    defense += 7;
    isSpareable = true;
    bt_add_act(bn, "check");
}
else
{
    xpReward = 0;
    bt_add_act(bn, "check");
    bt_add_act(bn, "talk");
    bt_add_act(bn, "pickon");
    bt_add_act(bn, "lunch");
}

atkSpeed = 1;
bodySiner = 0;
forceDrawSelf = false;
shake = false;
faceSprite = spr_harryfaceb_0;
dustFilename = "si_h";
dustX = 28;
dustY = 32;
image_xscale = 2;
image_yscale = 2;

if (global.flavor_sprites)
{
    image_blend = make_color_rgb(121, 151, 150);
    flavorColor = image_blend;
}

fishedState = 0;
mywriter = -4;
vtalk = 0;
vtalkdid = false;
vpickon = 0;
vpickondid = false;
vlunch = 0;
vlunchdid = false;
vtrust = false;
vwasdowned = false;
vpushed = false;
vhashealed = false;
isRuth = ruth_enabled();
cloudShakeAmt = 0;
eyesShake = 0;
baseDoBarHeal = doBarHeal;

doBarHeal = function(argument0)
{
    vhashealed = true;
    
    with (baseDoBarHeal(argument0))
        minHpDisplay = 4;
};
