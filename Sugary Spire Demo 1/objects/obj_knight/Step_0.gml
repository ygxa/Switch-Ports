if (point_in_circle(x, y, obj_player.x + (75 * obj_player.xscale), obj_player.y, 125) && obj_player.inhaling && state != 11)
    state = 11;

if (state == 6 && stunned > 40 && birdcreated == 0)
{
    birdcreated = 1;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state != 6)
    birdcreated = 0;

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (hitboxcreate == 0 && state == 3)
{
    hitboxcreate = 1;
    
    with (instance_create(x, y, obj_forkhitbox))
    {
        ID = other.id;
        depth = -1;
    }
}

if (state != 8)
    depth = 0;

if (state != 6)
    thrown = 0;

if (boundbox == 0 && state != 11)
{
    with (instance_create(x, y, obj_baddiecollisionbox))
    {
        sprite_index = other.sprite_index;
        mask_index = other.mask_index;
        baddieID = other.id;
        other.boundbox = 1;
    }
}

scr_scareenemy();
