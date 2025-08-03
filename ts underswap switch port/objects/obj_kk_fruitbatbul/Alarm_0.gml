if (bananaBul != -4)
{
    with (bananaBul)
    {
        speed = 0;
        gravity = 0;
        sliding = false;
    }
}

bananaTargetRow = irandom(2);
bananaFalling = false;
bananaBul = bt_bullet(obj_kkbanana_bul, x + 25, y + 12, obj_koffink_monster);

with (bananaBul)
{
    speed = 0;
    friction = 0;
}

alarm[1] = 20;
