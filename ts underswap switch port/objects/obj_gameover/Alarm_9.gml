room_persistent = false;
ds_map_clear(global.inst_custom_ids);
audio_kill_all();
global.reset_state_on_room_start = true;
global.resume_scene_on_room_start = undefined;
global.ow_music_reset_volume = 1;
global.delay_thedead_once = false;
global.gameover_special_type = -1;
stats_init(false);
flags_init(false);

if (!persist_load_local(true))
    exit;

if (permadeath)
{
    game_restart_safe();
}
else if (file_exists(_string("file{0}", global.save_variant)) || tempsave_exists())
{
    loadgame(global.save_variant);
    global.savespawn_on_room_start = true;
    global.fader_color_on_room_start = 0;
    global.fader_speed_on_room_start = 0.025;
    room_goto(global.loadedroom);
}
else
{
    ds_map_set(global.flags, "plot", 1);
    room_goto(rm_wake);
}
