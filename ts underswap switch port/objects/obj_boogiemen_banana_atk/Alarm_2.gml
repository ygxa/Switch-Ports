var success = false;
var attempts = 0;
var _x, _y, angle;

do
{
    angle = random(360);
    _x = irandom_range(obj_battlemanager.boxX1, obj_battlemanager.boxX2);
    _y = irandom_range(obj_battlemanager.boxY1, obj_battlemanager.boxY2);
    x = _x;
    y = _y;
    success = (x >= obj_battlemanager.boxX1 && x <= obj_battlemanager.boxX2 && y >= obj_battlemanager.boxY1 && y <= obj_battlemanager.boxY2) && distance_to_object(obj_battleheart) > 50;
    x += lengthdir_x(bananaLengthCheck / 2, angle);
    y += lengthdir_y(bananaLengthCheck / 2, angle);
    success &= ((x >= obj_battlemanager.boxX1 && x <= obj_battlemanager.boxX2 && y >= obj_battlemanager.boxY1 && y <= obj_battlemanager.boxY2) && distance_to_object(obj_battleheart) > 50);
    x += lengthdir_x(bananaLengthCheck / 2, angle);
    y += lengthdir_y(bananaLengthCheck / 2, angle);
    success &= ((x >= obj_battlemanager.boxX1 && x <= obj_battlemanager.boxX2 && y >= obj_battlemanager.boxY1 && y <= obj_battlemanager.boxY2) && distance_to_object(obj_battleheart) > 50);
    attempts++;
}
until (success || attempts > 100);

if (success)
{
    var monster;
    
    if (instance_exists(obj_koffink_monster))
        monster = obj_koffink_monster;
    else
        monster = obj_harry_monster;
    
    with (bt_bullet(obj_banana_bul, _x, _y, monster))
    {
        image_alpha = 0;
        direction = angle;
        
        if (instance_exists(obj_boogiemen_manager))
        {
            if (obj_boogiemen_manager.shouldMakeHeal && other.bananaCount == other.healNum)
            {
                damageAmount *= -1;
                image_blend = c_lime;
            }
        }
    }
    
    var alarmTime = irandom_range(70, 90);
    
    if (instance_exists(obj_harry_monster))
        alarmTime = alarmTime - (obj_harry_monster.atkSpeed * 20);
    
    alarm[2] = alarmTime;
    bananaCount++;
}
else
{
    alarm[2] = 1;
}

x = (obj_battlemanager.boxX1 + obj_battlemanager.boxX2) / 2;
y = (obj_battlemanager.boxY1 + obj_battlemanager.boxY2) / 2;
