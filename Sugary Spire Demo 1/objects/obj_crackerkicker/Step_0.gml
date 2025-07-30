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

if (((obj_player.x > (x - 80) && obj_player.x < (x + 80)) && (y <= (obj_player.y + 100) && y >= (obj_player.y - 100))) && bombreset == 0)
{
    if (state == 3)
    {
        movespeed = 0;
        bombreset = 100;
        image_index = 0;
        sprite_index = spr_crackerkicker_kick;
        image_xscale = -sign(x - obj_player.x);
        state = 9;
    }
}

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (state != 8)
    depth = 0;

if (state != 6)
    thrown = 0;

if (boundbox == 0)
{
    with (instance_create(x, y, obj_baddiecollisionbox))
    {
        sprite_index = other.sprite_index;
        mask_index = other.mask_index;
        baddieID = other.id;
        other.boundbox = 1;
    }
}

if (state == 4 || state == 3)
    movespeed = 1;

if ((obj_player.x > (x - 400) && obj_player.x < (x + 400)) && (y <= (obj_player.y + 60) && y >= (obj_player.y - 60)))
{
    if (state != 88 && obj_player.state == 67)
    {
        state = 88;
        sprite_index = scaredspr;
        
        if (x != obj_player.x)
            image_xscale = -sign(x - obj_player.x);
        
        movespeed = 0;
        hsp = 0;
        image_index = 0;
    }
}
