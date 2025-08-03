event_inherited();
obj_gamemanager.bindTextHandler(function(argument0)
{
    if (global.dxcontext != global.dxinst)
    {
        var b = -4;
        
        with (obj_speechbubble)
        {
            if (global.dxcontext == dxInstance)
                b = id;
            
            sound = snd_metblip;
            textEffect = 0;
            textType = 0;
            textSpeed = 1;
        }
        
        b.text = format_dialogue_both(argument0, b.visuals.width - 12, global.lang_charwidth_sm, false);
        b.startDialogue();
        return true;
    }
    
    return false;
});
maxHp = 125;
hp = maxHp;
xpReward = 0;
goldReward = 10;
defense = 8;
attack = 5.25;
invincible = true;
hurtSound = snd_mtchurt;
journalId = 13;
var bn = "battles.metta.";
normalSprite = sprite_index;
hurtSprite = spr_mett_body;
dustFilename = "rhkk";
name = dxd_raw(bn + "name");
flavorScene = bn + "flavor";
isFleeAvailable = false;
isRuth = ruth_enabled();

if (isRuth)
    goldReward = 0;

spared = false;
died = false;
fading = false;
availableAttacks = ds_list_create();
ds_list_add(availableAttacks, 0);
ds_list_add(availableAttacks, 2);
ds_list_add(availableAttacks, 1);
path_start(pth_mtcbody, 1, path_action_continue, false);
image_speed = 1;

if (isRuth)
{
    bt_add_act(bn, "act0");
    bt_add_act(bn, "act3");
}
else
{
    bt_add_act(bn, "act0");
    bt_add_act(bn, "act1");
    bt_add_act(bn, "act2");
    bt_add_act(bn, "act3");
}

handSiner = 0;
bodySiner = 0;
verticalOffset = 0;
initX = x;
initY = y;
pose = false;
resetHands = false;
attackFade = 1;
attackType = -1;
attackTime = 0;
attackStage = 0;
attackChoice = 0;
cloth = -4;
stageTime = 0;
leftHand = instance_create_xy(x + 70, y - 10, obj_mett_hand);
leftHand.depth = depth + 1;
rightHand = instance_create_xy(x - 70, y + 20, obj_mett_hand);
rightHand.sprite_index = spr_mett_hand_microphone;
image_xscale = 2;
image_yscale = 2;
waving = true;
face = spr_metfaceb_happy;
leaning = false;
bobbing = true;
shineFrame = 0;
handSpeed = 0.5;
didPause = false;
flavorColor = make_color_rgb(255, 230, 132);
vcheck = 0;
vcheckdid = false;
vpose = 0;
vposedid = false;
vflirt = 0;
vflirtdid = false;
vheckle = 0;
vheckledid = false;
vdotomato = false;
vdidfightnorm = false;
vfight = 0;
vdidfightmiss = false;
vplaydead = 0;
vsawdead = 0;
vhecklespare = 0;
vhpcutoff = global.playermaxhp * 0.25;
vjustdidthing = false;
storedInstance = undefined;
attackHelper = isRuth ? 0 : 80;
