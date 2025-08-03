event_inherited();
contentType = 0;
pos = 0;
baseX = obj_battlemanager.boxX1 + 23;
destX = x;
destY = y;
healing = false;
fadeTimer = -1;
image_speed = 0;

function goToPosIndex(argument0)
{
    pos = argument0;
    destX = baseX + (pos * 55);
}

function hideContents()
{
    destY = ystart + 40;
}

function showContents()
{
    destY = ystart - 40;
    fadeTimer = 40;
}

function makeContentObject(argument0)
{
    var monster = instance_exists(obj_koffink_monster) ? obj_koffink_monster : obj_harry_monster;
    contentObj = bt_bullet(obj_hat_content_bul, x, y + 40, monster);
    
    with (contentObj)
    {
        parentObj = other;
        setContentType(argument0);
        
        if (instance_exists(obj_boogiemen_manager))
        {
            if (obj_boogiemen_manager.shouldMakeHeal && argument0 == 0)
            {
                image_blend = c_lime;
                damageAmount *= -1;
            }
        }
    }
}
