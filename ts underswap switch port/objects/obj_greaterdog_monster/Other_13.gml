event_inherited();
attackType = xchoose(0, 1, 2);

if (vasleep)
    attackType = 0;

if (vout)
{
    attackType = -1;
    obj_battlemanager.endAttackMode();
    bt_set_boxtype((0 << 0));
    exit;
}

if (attackType == 0)
    obj_battlemanager.heartStartY = 290;
else
    obj_battlemanager.heartStartY = 312;
