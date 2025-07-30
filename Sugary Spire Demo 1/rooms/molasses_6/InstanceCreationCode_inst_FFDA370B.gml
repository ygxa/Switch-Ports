condition = function()
{
    return place_meeting(x, y, obj_player) && obj_player.state == 72;
};

output = function()
{
    inst_2465D69C.alarm[1] = 5;
    inst_F5735B1B.alarm[1] = 10;
    inst_083013EC.alarm[1] = 1;
};
