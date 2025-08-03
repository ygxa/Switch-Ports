if (!invincible && instance_exists(obj_battledamage) && obj_battledamage.monsterHpTarget == 0)
{
    music_kill_current();
    face = spr_asgface_surprise_still;
    sprite_index = spr_asgb_kneel;
    kneeling = true;
    animatedBody = false;
    xCorrectOverride = true;
    shakeSpeed = 2;
    shakeValue = shakeAmount;
    image_xscale = 2;
    image_yscale = 2;
    offsetUiX = 0;
    offsetDmgY = 100;
    offsetSliceY = 0;
    ignoreSpriteForHPBar = false;
    alarm[10] = 1;
}
