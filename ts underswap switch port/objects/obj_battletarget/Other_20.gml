selectorVisible = false;
global.bev_subtype = 3;

with (obj_battlemanager.monsters[obj_battlemanager.chosenMonster])
    event_user(0);

if (!dontGoToAttack)
    obj_battlemanager.beginAttackMode();

doFade = true;
