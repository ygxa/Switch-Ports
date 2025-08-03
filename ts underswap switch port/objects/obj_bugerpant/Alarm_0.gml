var f = instance_create(obj_fader);

f.completeCallback = function()
{
    room_goto(rm_bugerpant_square);
};

global.fader_on_room_start = true;
global.canmove = false;
scene_resume();
