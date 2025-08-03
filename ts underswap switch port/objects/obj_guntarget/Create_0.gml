depth = -1;
doFade = false;
selectorVisible = false;
selectorIndexCalc = 0;
selectorX = 0;
selectorY = 0;
selectorDir = 4;
selectorSpeed = 0;
selectorDone = false;
selectorSprIndex = 0;
currSelector = -4;
selectorIndex = 0;
damage = -1;
damaging = false;
fadeIn = true;
image_xscale = 1.78;
image_alpha = 0;
dontGoToAttack = false;
bonusStrength = 0;
isCrit = false;
go = ds_map_find_value(global.flags, "targ_gun");

if (!go)
{
    ds_map_set(global.flags, "targ_gun", true);
    image_xscale = 1;
    instance_create(obj_weapon_new).text = dxd_raw("battlesystem.targ_gun");
}

alarm[0] = 6;
