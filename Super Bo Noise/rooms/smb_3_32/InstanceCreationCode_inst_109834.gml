sprite_index = spr_turnipGrassCave;

onPick = function()
{
    var inst = instance_create(x, y, obj_twoliterdog);
    inst.state = 6;
    
    with (obj_player1)
    {
        inst.grabbedby = id;
        grabbingenemy = true;
        baddiegrabbedID = inst;
        state = 81;
        sprite_index = spr_haulingidle;
    }
};
