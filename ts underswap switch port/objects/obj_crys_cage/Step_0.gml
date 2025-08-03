if (randomShake)
{
    randomShakeTimer--;
    
    if (randomShakeTimer <= 0)
    {
        doShake(2);
        sfx_play_vol(snd_swallow, 0.5);
        randomShakeTimer = irandom_range(20, 50);
    }
}

actor_shake_logic();
