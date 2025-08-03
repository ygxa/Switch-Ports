event_inherited();

if (!finishedHurt && origX != -1 && x == xstart)
{
    finishedHurt = true;
    
    if (instance_exists(obj_battledamage))
    {
        if (obj_battledamage.monsterHpTarget == 0)
        {
            vsplashing = false;
            
            with (obj_dogaressa_monster)
            {
                x = mainPosX;
                y = mainPosY;
                origX = -1;
                sprite_index = spr_dogaressa;
                normalSprite = spr_dogaressa;
                image_index = 0;
                image_speed = 0;
            }
            
            exit;
        }
    }
    
    sprite_index = spr_dogamy_splash;
    image_index = obj_dogaressa_monster.image_index;
    image_speed = 1;
    x = origX;
    y = origY;
    alarm[10] = -1;
}
