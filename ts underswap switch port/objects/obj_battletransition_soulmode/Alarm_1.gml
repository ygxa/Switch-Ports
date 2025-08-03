showPlayer = false;

if (heart.visible)
    counter++;
else
    sfx_play(snd_click);

if (counter > 3)
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
            sprite_index = other.swapSprite;
            image_xscale = 1;
            image_yscale = 1;
            doDrawOutline(false);
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
