arrowTimer = (arrowTimer + 1) % 20;

if (selected == -1)
{
    if (fade > 0)
    {
        fade -= 0.1;
    }
    else
    {
        lang_init();
        selected = -2;
        alarm[1] = 1;
    }
    
    exit;
}

if (fade < 1)
    exit;

if (global.control_confirm_pressed)
{
    global.lang = global.lang_array[selected];
    selected = -1;
    sfx_play(snd_select);
    exit;
}

var presel = selected;

if (global.control_up_pressed)
    selected = number_sub_wrap(selected, languageCount - 1, 0);

if (global.control_down_pressed)
    selected = number_add_wrap(selected, languageCount - 1, 0);

if (presel != selected)
    sfx_play(snd_squeak);
