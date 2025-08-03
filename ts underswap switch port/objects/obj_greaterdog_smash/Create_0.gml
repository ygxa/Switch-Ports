event_inherited();
fade = false;
image_xscale = 2;
image_yscale = 2;

with (obj_greaterdog_monster)
{
    other.image_blend = image_blend;
    other.depth = depth;
    visible = false;
}

with (instance_create(obj_anyshaker))
{
    object = other.id;
    shakeValue = 2;
    signY = 0;
}

obj_battlemanager.boxTransform = true;
timer = 0;
pounds = 0;
stage = 0;
handY = 0;
accel = 2;
attackType = xchoose(0, 1);

switch (attackType)
{
    case 0:
        sprite_index = spr_greaterdog_dualsmash;
        break;
    
    case 1:
        sprite_index = spr_greaterdog_singlesmash;
        break;
}

sfx_play(snd_grab);
