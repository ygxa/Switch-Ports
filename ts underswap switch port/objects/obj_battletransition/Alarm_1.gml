if (heart.visible)
    counter++;
else
    sfx_play(snd_click);

if (counter > 2)
{
    with (obj_transitionheart)
    {
        if (other.fake)
        {
            visible = false;
        }
        else
        {
            visible = true;
            moving = true;
            sfx_play(snd_battlestart);
        }
    }
    
    showPlayer = false;
}
else
{
    with (obj_transitionheart)
        visible = !visible;
    
    alarm[1] = fake ? 6 : 2;
}
