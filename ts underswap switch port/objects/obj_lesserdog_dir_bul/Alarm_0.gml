with (obj_lesserdog_dir_bul)
    visible = false;

with (obj_battleheart)
{
    visible = false;
    canMove = false;
}

with (obj_battlemanager)
{
    mainState = (5 << 0);
    bt_set_boxtype((0 << 0));
    isBoxMoving = true;
}

waitForBox = true;
