if (obj_harry_monster.isSpareable)
    ds_map_set(global.flags, "st_bp", 60);

with (obj_battlemanager)
{
    checkForWin();
    
    if (isAnyMonsterLeft)
        beginAttackMode();
}
