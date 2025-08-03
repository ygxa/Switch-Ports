image_angle += rotateSpeed;

if (bbox_bottom < 0)
{
    with (obj_battlemanager)
    {
        with (obj_battletarget)
            doFade = true;
        
        checkForWin();
        
        if (isAnyMonsterLeft)
            beginAttackMode();
    }
    
    instance_destroy();
}
else
{
    actor_shake_logic();
}
