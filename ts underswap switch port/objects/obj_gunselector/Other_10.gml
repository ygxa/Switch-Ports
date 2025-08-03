var mon = obj_battlemanager.monsters[obj_battlemanager.chosenMonster];
damage = ((global.playerwepat + global.playerat) - mon.defense) + xirandom(4);

if (dir == 0 || dir == 1)
    bonusStrength = abs(distance_to_point(x, obj_guntarget.y + (obj_guntarget.sprite_height * 0.5)) - 7);
else
    bonusStrength = abs(distance_to_point(obj_guntarget.x, y) - 5);

if (bonusStrength <= 2)
{
    damage = round(damage * 2.2);
    isCrit = true;
}
else
{
    var weirdStretchFactor = (550 - (bonusStrength * 14)) / 550;
    damage = round(damage * weirdStretchFactor * 2);
    isCrit = false;
}

sfx_play(snd_click, 80, false);
