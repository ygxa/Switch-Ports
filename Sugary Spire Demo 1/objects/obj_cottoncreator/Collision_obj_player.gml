with (obj_player)
{
    if (state != 85 && state != 94 && state != 74 && state != 95 && state != 112)
    {
        global.combofreeze = 30;
        state = 85;
        
        if (movespeed > 6)
            movespeed = 6;
        
        with (instance_create(x, y, obj_poofeffect))
            color = 2;
        
        sprite_index = spr_cottonidle;
    }
}
