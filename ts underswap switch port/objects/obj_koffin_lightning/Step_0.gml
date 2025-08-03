actor_shake_logic();
timer--;

if (timer <= 0)
{
    image_alpha -= fadeSpeed;
    
    if (image_alpha <= 0)
        instance_destroy();
}
