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

if (bombreset > 0)
    bombreset--;

if (((obj_player.x > (x - 400) && obj_player.x < (x + 400)) && (y <= (obj_player.y + 60) && y >= (obj_player.y - 60))) && obj_player.state != 85 && obj_player.state != 94 && obj_player.state != 74 && obj_player.state != 95 && obj_player.state != 112)
{
    if (state != 7 && bombreset <= 0 && obj_player.state != 85)
    {
        if (state == 3 || state == 0)
        {
            image_index = 0;
            state = 7;
            
            if (x != obj_player.x)
                image_xscale = -sign(x - obj_player.x);
            
            sprite_index = spr_throw;
        }
    }
}

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

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
