audio_kill_all();
sfx_play(snd_hurt);

if (is_undefined(global.gameover_data.snapshotSprite) || obj_gamemanager.hideScreen)
{
    obj_gamemanager.hideScreen = false;
    instance_create(obj_heart_gameover);
    instance_destroy();
    exit;
}

alarm[0] = 5;
