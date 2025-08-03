depth = 20;
x = obj_player.x + 1;
y = obj_player.y + 15;
sfx_play(snd_click);
global.canmove = false;
done = false;
started = false;
destroyWhenOutOfView = false;
alarm[0] = 10;

if (instance_number(obj_freefall_hole) > 11)
{
    with (obj_freefall_hole)
        destroyWhenOutOfView = true;
    
    if (true && instance_exists(obj_freefall_trigger_spawnend))
    {
        sfx_play(snd_win);
        
        with (obj_freefall_trigger_spawnend)
            instance_destroy();
    }
}
