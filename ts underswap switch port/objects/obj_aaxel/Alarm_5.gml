speed = 0;
sprite_index = spr_aaxel_down;
image_speed = 0;
image_index = 0;
lookDirection = 1;
event_user(15);

if (global.tempflag < 2)
{
    music_resume_current();
    music_gain(1, 1000);
}

scene_resume();
