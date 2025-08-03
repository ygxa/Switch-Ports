if (!down && global.canmove && place_meeting(x, y, obj_player))
{
    down = true;
    sfx_play(snd_click);
    
    if (func != undefined)
        func();
}
else if (down && release && global.canmove && !place_meeting(x, y, obj_player))
{
    down = false;
}

image_index = down ? 1 : 0;
