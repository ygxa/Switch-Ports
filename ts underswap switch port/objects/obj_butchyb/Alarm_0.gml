if (bodyIndex < 3)
{
    with (bt_bullet_attack(obj_butchyb, damageAmount, xstart, y - 12))
    {
        bodyIndex = other.bodyIndex + 1;
        event_user(2);
    }
}
