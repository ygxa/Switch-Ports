event_inherited();
depth = 1;
var bn = "battles.beenard.";
journalId = 20;
hurtSprite = spr_beenard_hurt;
faceSprite = spr_beenardfaceb_neutral;
bodySprite = spr_beenard_body;
dustFilename = "si_b";
ignoreSpriteForHPBar = true;
offsetUiX = 89;
offsetDmgY = 69;
offsetSliceY = 69;

resetName = function()
{
    cmd_formatBeeName();
    name = global.dxformat[0];
};

resetName();
image_speed = 0;
image_xscale = 2;
image_yscale = 2;
sb = -4;
bt_add_act(bn, "act0");
bt_add_act(bn, "act1");
bt_add_act(bn, "act2");
maxHp = 75;
hp = maxHp;
defense = 3;

if (ruth_started())
    defense += 3;

attack = 7;
xpReward = 35;
goldReward = 20;
mercyResistance = 30;
bulletSpeed = 1;
flavorColor = make_color_rgb(250, 255, 102);

if (global.flavor_sprites)
    image_blend = flavorColor;

siner = 0;
yhover = 30;
wingIndex = 0;
hpRatio = 1;
vcheck = false;
vask = 0;
vaskdid = false;
vfalsechoose = 0;
vchoose = 0;
vchoosedid = false;
attackType = 0;
predetermined = 0;
attackTime = 0;
bulletsGenerated = false;
