active = false;
var done = false;

with (obj_battleheart_blue)
{
    other.active = canDash;
    
    if (dashing)
        done = true;
}

with (obj_crossbones_monster)
{
    if (fightType == 0)
    {
        if (attackType >= 12 && attackType < 100)
            done = true;
    }
    else if (attackType >= 6)
    {
        done = true;
    }
}

active &= (obj_battlemanager.mainState == (7 << 0));

if (done)
{
    instance_destroy();
    exit;
}

if (active)
{
    if (initialDelay > 0)
    {
        initialDelay--;
    }
    else
    {
        timer++;
        
        if (timer >= 30)
            timer = 0;
    }
}
