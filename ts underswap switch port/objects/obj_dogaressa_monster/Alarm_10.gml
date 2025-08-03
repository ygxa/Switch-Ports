event_inherited();

if (!finishedHurt && origX != -1 && x == xstart)
{
    finishedHurt = true;
    
    if (instance_exists(obj_battledamage))
    {
        if (obj_battledamage.monsterHpTarget == 0)
        {
            with (obj_dogamy_monster)
            {
                vsplashing = false;
                x = mainPosX;
                y = mainPosY;
                origX = -1;
                sprite_index = spr_dogamy;
                normalSprite = spr_dogamy;
                image_index = 0;
                image_speed = 0;
            }
            
            exit;
        }
    }
    
    sprite_index = spr_dogaressa_splash;
    image_index = obj_dogamy_monster.image_index;
    image_speed = 1;
    x = origX;
    y = origY;
    alarm[10] = -1;
}
