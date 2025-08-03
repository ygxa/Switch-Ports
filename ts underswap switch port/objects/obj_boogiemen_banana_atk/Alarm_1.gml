for (var i = 0; i < num_sections; i++)
{
    if (sections[i][0] && random(1) < spawnChance)
    {
        with (bt_bullet(obj_person_bul, obj_battlemanager.boxX2, sections[i][1]))
        {
            x += (floor(sprite_width / 2) - 4);
            hspeed = -other.person_speed;
            
            if (instance_exists(obj_boogiemen_propeller_atk))
                immunity = irandom_range(5, 15);
        }
    }
}

alarm[1] = spawnRate;
