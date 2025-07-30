function scr_pizzano_twirl()
{
    sprite_index = spr_pizzano_twirl;
    move = key_left + key_right;
    hsp = xscale * movespeed;
    
    if (move == xscale && movespeed < 12)
        movespeed += 0.5;
    else if (move != xscale && movespeed > 0)
        movespeed -= 0.25;
    
    if (grounded && !key_attack)
    {
        state = 0;
        image_index = 0;
        mach2 = 0;
        jumpstop = 0;
    }
    else if (grounded && key_attack)
    {
        state = 66;
        image_index = 0;
        sprite_index = spr_mach;
        jumpstop = 0;
    }
    
    var jumpbad = instance_place(x, y + vsp, obj_baddie);
    
    if (jumpbad)
    {
        instance_destroy(jumpbad);
        vsp = -10;
    }
    
    if (key_slap2 && character == "N" && charged && !key_up)
    {
        flash = 1;
        state = 101;
        sprite_index = spr_pizzano_sjumpprepside;
        image_index = 0;
        movespeed = 0;
        mach2 = 0;
        charged = 0;
    }
    
    if (key_slap2 && key_up && character == "N" && charged)
    {
        flash = 1;
        alarm[0] = 240;
        image_index = 0;
        state = 60;
        sprite_index = spr_pizzano_sjumpprep;
    }
    
    if (key_jump && character == "N" && !grounded && scr_solid(x + xscale, y, true))
    {
        hsp = 0;
        vsp = 0;
        state = 113;
        sprite_index = spr_pizzano_wallcling;
    }
}
