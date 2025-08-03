event_inherited();
depth = 1;
flavorScene = "battles.boogie.flavor";
var bn = "battles.boogie.l_";
name = dxd_raw(bn + "name");
hurtSprite = spr_larry_hurt;
normalSprite = spr_larry_hurt;
offsetDmgY = 180;
isFleeAvailable = false;
hp = 80;
maxHp = hp;
defense = 4;
attack = 3;
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
image_xscale = 2;
image_yscale = 2;
image_speed = 0;

if (global.flavor_sprites)
{
    image_blend = make_color_rgb(85, 193, 129);
    flavorColor = image_blend;
}

bodyDrawCounter = 0;
faceSprite = spr_larryfaceb_0;
forceDrawSelf = false;
vtalk = 0;
vtalkdid = false;
vpickon = 0;
vpickondid = false;
vlunch = 0;
vlunchdid = false;
vtrust = false;
vwasdowned = false;
vhealcount = 0;
vhashealed = false;

shake = function(argument0, argument1, argument2)
{
    x = argument0 + (argument2 * xchoose(-1, 1));
    y = argument1 + (argument2 * xchoose(-1, 1));
};

isRuth = ruth_enabled();
cloudShakeAmt = 0;
flips = 0;
baseDoBarHeal = doBarHeal;

doBarHeal = function(argument0)
{
    vhashealed = true;
    
    with (baseDoBarHeal(argument0))
        minHpDisplay = 4;
};

drawMountain = false;
