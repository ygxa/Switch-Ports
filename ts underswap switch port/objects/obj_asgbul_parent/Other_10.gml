if (damageAmount > 0)
{
    var dmg = bt_bullet_damage(damageAmount);
    
    if (!obj_asgore_monster.isRuth)
    {
        if (obj_asgore_monster.hitsThisTurn++ >= 2)
        {
            if (global.playerhp == 1)
                dmg = 0;
            else
                dmg = 1;
            
            with (obj_asgore_monster)
                weakAttack();
        }
        else if (!obj_asgore_monster.weakAttackTriggered && dmg >= global.playerhp)
        {
            if (global.playerhp == 1)
                dmg = 0;
            else
                dmg = 1;
            
            with (obj_asgore_monster)
            {
                weakAttack();
                weakAttackTriggered = true;
            }
        }
    }
    
    obj_battleheart.damage(id, dmg);
}
else
{
    player_health(damageAmount * -1);
    sfx_play(snd_heal);
    event_user(1);
}
