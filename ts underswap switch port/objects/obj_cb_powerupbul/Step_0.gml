if (image_xscale > 2 && fadingState == 0)
{
    image_index = 1;
    fadingState = 1;
    alarm[0] = 20;
    scaleSpeed = 0;
    vspeed = 0;
    
    with (obj_battleheart)
    {
        if (object_index == obj_battleheart)
        {
            with (instance_create_xy(x, y, obj_battleheart_blue))
            {
                canMove = other.canMove;
                invincibilityTimer = other.invincibilityTimer;
                moveSpeed = other.moveSpeed;
                baseMoveSpeed = other.baseMoveSpeed;
                disableSlow = other.disableSlow;
                wasMoving = other.wasMoving;
                image_speed = other.image_speed;
                canDash = true;
                sfx_play(snd_create, 80, false);
                cutoff = false;
                create_shiner(20);
            }
            
            instance_destroy();
            exit;
        }
    }
    
    with (obj_battleheart_blue)
    {
        canDash = !canDash;
        sfx_play(snd_create, 80, false);
        cutoff = false;
        create_shiner(20);
    }
}
else
{
    image_xscale += scaleSpeed;
    image_yscale += scaleSpeed;
}
