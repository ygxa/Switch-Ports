if (global.gamebroke != -1)
    exit;

if (global.timeseconds >= 4294967295)
{
    audio_kill_all();
    global.gamebroke = 0;
    room_goto(rm_gamebroke);
    exit;
}

if (!asset_has_tags(room, ["notingame"], 3))
    global.timeseconds++;

alarm[2] = game_get_speed(gamespeed_fps);
