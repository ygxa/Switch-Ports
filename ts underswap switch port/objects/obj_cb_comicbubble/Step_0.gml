if (state == 0)
{
    warningTimer++;
    
    if (warningTimer >= 30)
    {
        state = 1;
        view_shake(2, 2);
        sfx_play(snd_grab);
        
        if (updateCbSprite)
        {
            with (obj_crossbones_monster)
            {
                if (sprite_index == spr_cb_fakeattack)
                {
                    if (image_index == 0)
                        image_index = choose(1, 2);
                    else if (image_index == 1)
                        image_index = choose(0, 2);
                    else
                        image_index = choose(0, 1);
                }
                else
                {
                    sprite_index = spr_cb_fakeattack;
                    image_index = irandom(2);
                }
                
                doShake(4);
            }
        }
    }
}
else
{
    image_xscale += 0.025;
    image_yscale += 0.025;
    
    if (state >= 8)
    {
        image_alpha -= 0.1;
        
        if (image_alpha <= 0)
            instance_destroy();
    }
    else
    {
        state++;
    }
}
