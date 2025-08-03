var f = instance_create(obj_fader);

f.completeCallback = function()
{
    global.scene_on_room_start_override = true;
    ds_map_clear(global.inst_custom_ids);
    room_goto(rm_star23_chase2);
};

global.fader_on_room_start = true;
