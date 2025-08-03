doShake(3);
sfx_play_vol(snd_flee, 0.6);
sprite_index = spr_dogboard_fly;
hspeed = 1;
scene_wait_callback(1, function()
{
    scene_camera_unpan(60);
    scene_wait_callback(2, function()
    {
        global.canmove = true;
    }, false);
}, false);
