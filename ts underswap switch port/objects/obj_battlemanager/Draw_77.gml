if (gameover)
{
    global.gameover_data.snapshotSprite = sprite_create_from_surface(application_surface, 0, 0, 640, 480, false, false, 0, 0);
    global.gameover_data.soulPos = [global.xstore, global.ystore];
    global.gameover_data.boxDims = [boxX1, boxY1, boxX2, boxY2];
    
    if (false || global.debug)
    {
        if (variable_global_exists("PLAYTEST_RESET") && global.PLAYTEST_RESET)
        {
            obj_gamemanager.hideScreen = false;
            music_kill_current();
            global.reset_state_on_room_start = true;
            global.resume_scene_on_room_start = undefined;
            room_goto(global.loadedroom);
            exit;
        }
    }
    
    room_goto(rm_gameover);
}
