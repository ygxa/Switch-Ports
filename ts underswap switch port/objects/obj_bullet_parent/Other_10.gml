if (damageAmount > 0)
{
    var dmg = bt_bullet_damage(damageAmount);
    
    if (instance_exists(obj_battleheart))
        obj_battleheart.damage(id, dmg);
    else
        obj_dodgemode_handler.damage(id, dmg);
}
else
{
    player_health(damageAmount * -1);
    sfx_play(snd_heal);
    event_user(1);
}
