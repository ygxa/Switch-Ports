if (noDamage)
{
    event_user(1);
    exit;
}

with (obj_battlemanager)
{
    if (statsKarmaHandler != undefined)
    {
        if (statsKarmaHandler.baseDamageTimer == 0)
            obj_battleheart.damage(other.id, 1);
        
        statsKarmaHandler.add(5, 0);
        exit;
    }
}

event_inherited();
