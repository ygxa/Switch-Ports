if (!(state == 17 && !grounded))
    scr_scareenemy();

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

if (hitboxcreate == 0 && state == 17)
{
    hitboxcreate = 1;
    
    with (instance_create(x, y, obj_forkhitbox))
    {
        ID = other.id;
        depth = -1;
        mask_index = spr_sluggy_jumphitbox;
        sprite_index = spr_sluggy_jumphitbox;
    }
}

if (state != 0 && state != 9 && state != 6 && state != 8 && state != 13 && state != 17 && state != 18 && idletimer > 0)
    idletimer--;

if (state != 0 && state != 9 && state != 6 && state != 8 && state != 13 && state != 17 && state != 18 && jumptimer > 0)
    jumptimer--;

var _isplayerpresent = jumptimer <= 0 && (obj_player.x > (x - 250) && obj_player.x < (x + 250) && y <= (obj_player.y + 200) && y >= (obj_player.y - 16));

if (grounded && (_isplayerpresent || (scr_solid(x + (image_xscale * 32), y, true) && !scr_solid(x + (image_xscale * 32), y - 100, true) && !scr_slope_ext(x + (image_xscale * 32), y) && !scr_slope_ext(x, y + 1))))
{
    if (state == 3)
    {
        if (_isplayerpresent)
            image_xscale = -sign(x - obj_player.x);
        
        state = 17;
        jumptimer = 100;
        sprite_index = spr_sluggy_jumpstart;
        image_index = 0;
        movespeed = 0;
        hsp = 0;
        vsp = 0;
    }
}
