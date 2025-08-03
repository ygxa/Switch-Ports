if (bodyCollisions)
{
    with (obj_battlemanager)
    {
        if (statsKarmaHandler != undefined)
        {
            if (statsKarmaHandler.baseDamageTimer == 0)
                obj_battleheart.damage(other.id, 1);
            
            statsKarmaHandler.add(other.karma, 0);
            exit;
        }
    }
    
    event_inherited();
}
