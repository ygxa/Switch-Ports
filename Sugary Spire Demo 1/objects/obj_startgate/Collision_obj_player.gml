if (sprite_index != spr_exitgateclosed)
{
    with (obj_player)
    {
        if (key_up && grounded && (state == 0 || state == 65 || state == 66 || state == 67) && !instance_exists(obj_fadeout) && state != 58 && state != 59)
        {
            global.levelname = other.level;
            scr_levelstart(global.levelname);
            ini_open("saveData.ini");
            var ranks = ini_read_string("Ranks", string(global.levelname), "none");
            ini_close();
            global.showplaytimer = ranks != "none";
            mach2 = 0;
            obj_camera.chargecamera = 0;
            image_index = 0;
            sprite_index = spr_entergate;
            state = 58;
            targetDoor = other.targetDoor;
            targetRoom = other.targetRoom;
            audio_stop_all();
        }
    }
}
