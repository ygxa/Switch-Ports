if (damageAmount < 0)
{
    event_inherited();
    obj_battlemanager.attackTimer = 0;
}
else if (obj_battlemanager.attackTimer > 30)
{
    obj_boogiemen_manager.doLaugh();
}
