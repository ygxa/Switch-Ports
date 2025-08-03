if (selected)
{
    if (alpha > 0)
        alpha -= 0.1;
    else
        room_goto(sel ? rm_bugerpant_origins : rm_extras);
}
else if (alpha < 1)
{
    alpha += 0.1;
}
else
{
    if (global.control_left_pressed || global.control_right_pressed)
    {
        sfx_play(snd_squeak);
        sel = !sel;
    }
    
    if (global.control_confirm_pressed)
    {
        sfx_play(snd_select);
        selected = true;
    }
}
