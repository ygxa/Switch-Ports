depth = -10000;
showPlayer = true;
counter = 0;
fake = false;
roomCtx = 0;

if (global.stop_ow_music_into_battle)
{
    if (instance_exists(global.currentmusic) && (global.currentmusic.filename != "thedead" || global.battle_id != 5))
    {
        global.ow_music_reset_volume = music_get_gain();
        music_gain(0, 0);
        music_pause(global.currentmusic);
    }
}
else
{
    global.stop_ow_music_into_battle = true;
}

heart = -4;

with (obj_player)
    other.heart = instance_create_xy(x - 4, y - 4, obj_transitionheart);

if (heart == -4)
    heart = instance_create(obj_transitionheart);

heart.visible = false;
alarm[0] = 35;
alarm[1] = 1;
global.canmove = false;
