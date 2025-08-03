spewTimer++;

if (spewTimer == 1)
{
    sprite_index = (spewSide == 0) ? spr_kk_body_lookr : spr_kk_body_lookl;
    var arm;
    
    if (sprite_index == spr_kk_body_lookr)
        arm = instance_create_xy(xstart + 8, ystart + 68, obj_koffink_armshake);
    else
        arm = instance_create_xy(xstart + 138, ystart + 64, obj_koffink_armshake);
    
    with (arm)
        sprite_index = (other.spewSide == 0) ? spr_kk_armshaker : spr_kk_armshakel;
}
else if (spewTimer == 46)
{
    sprite_index = (spewSide == 0) ? spr_kk_body_spewr : spr_kk_body_spewl;
    spewXShake = 1;
    floating = false;
}

if (spewTimer == 106)
{
    floating = true;
    spewXShake = 0;
    sprite_index = spr_kk_body_neutral;
    spewing = false;
    spewTimer = 0;
    soulTransDiannex = false;
    instance_destroy(obj_koffink_armshake);
    alarm[0] = -1;
}
else
{
    alarm[0] = 1;
}
