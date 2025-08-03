warnSwipe = false;

if (obj_harry_monster.isActive && state == 1)
{
    switch (obj_harry_monster.image_index)
    {
        case 0:
            obj_harry_monster.image_index = 1;
            sfx_play(snd_slice, 80, false);
            
            with (bt_bullet(obj_areahitbox, obj_battlemanager.boxX1, obj_battlemanager.boxY1))
            {
                timer = 2;
                damageAmount = obj_harry_monster.attack;
                destroy = false;
                image_xscale = obj_battlemanager.boxX2 - obj_battlemanager.boxX1;
                image_yscale = 32;
            }
            
            alarm[0] = 2;
            break;
        
        case 1:
            obj_harry_monster.image_index = 2;
            alarm[0] = 12;
            break;
        
        case 2:
            obj_harry_monster.image_index = 0;
            alarm[0] = 2;
            break;
    }
}
