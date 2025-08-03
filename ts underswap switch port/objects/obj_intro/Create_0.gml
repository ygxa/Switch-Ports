obj_gamemanager.bindTextHandler(function(argument0)
{
    writer.message = format_dialogue_both(argument0, 458, global.lang_charwidth_mdl, false);
    return true;
});
fade = 0;
endbox = false;
introEnd = false;
image_speed = 0;
longyoffset = 0;
longscroll = false;
writer = instance_create(obj_writer);

with (writer)
{
    var off = global.lang_data[global.lang_bound].offsets.intro;
    textx = 120 + off[0];
    texty = 310 + off[1];
    type = 1;
}

syncTime = -1;
syncTimeOut = -1;
syncAlarm = false;
firstDone = false;
hideTextOnFade = false;
dontActuallyFade = false;
slowframe = false;
nextTarget = infinity;

if (global.fader_on_room_start)
{
    global.fader_on_room_start = false;
    overrideFade = 0;
    writer.alpha = 0;
    alarm[4] = 1;
}
else
{
    overrideFade = 1;
}

data_check_integrity_fast();
music_lcplay("intro", false);
dx_instance_run_scene(global.dxinst, "intro");
dx_instance_update(global.dxinst);
