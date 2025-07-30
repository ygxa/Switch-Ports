if (room == rm_blank)
    exit;

var playerid = instance_place(x, y - 1, obj_player1);

with (playerid)
{
    if (character == "V")
    {
        scr_hurtplayer(id);
    }
    else if (state != 5 && state != 91 && state != 33 && state != 188)
    {
        var _pindex = (object_index == obj_player1) ? 0 : 1;
        GamepadSetVibration(_pindex, 1, 1, 0.85);
        
        if (state != 11)
            tv_push_prompt_once(tv_create_prompt("This is the fireass transformation text", 2, spr_null, 3), "fireass");
        
        state = 11;
        vsp = -20;
        sprite_index = spr_fireass;
        image_index = 0;
        movespeed = hsp;
    }
}
