if (room == rm_blank)
    exit;

switch (state)
{
    case 128:
        scr_enemy_idle();
        break;
    
    case 130:
        scr_enemy_charge();
        break;
    
    case 132:
        scr_enemy_turn();
        break;
    
    case 136:
        scr_enemy_walk();
        break;
    
    case 138:
        scr_enemy_land();
        break;
    
    case 139:
        scr_enemy_hit();
        break;
    
    case 140:
        scr_enemy_stun();
        break;
    
    case 131:
        scr_pizzagoblin_throw();
        break;
    
    case 6:
        scr_enemy_grabbed();
        break;
    
    case 156:
        scr_enemy_pummel();
        break;
    
    case 157:
        scr_enemy_staggered();
        break;
    
    case 127:
        scr_enemy_rage();
        break;
}

if (state == 140 && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state != 140)
    birdcreated = 0;

if (state == 136 && y > ystart && !scr_solid(x, y - 1))
    y--;

if (state == 136 && y < ystart && !scr_solid(x, y + 1))
    y++;

if (state == 140)
    grav = 0.5;
else
    grav = 0;

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (state != 6)
    depth = 0;

if (state != 130)
    scr_scareenemy();

if (sprite_index == spr_null && floor(image_index) == (image_number - 1))
{
    if (hitboxcreate == 0 && state == 130)
    {
        hitboxcreate = 1;
        
        with (instance_create(x, y, obj_tackhitbox))
            ID = other.id;
    }
    
    sprite_index = spr_null;
    movespeed = 10;
}

var player = instance_nearest(x, y, obj_player1);

if (ragebuffer > 0)
    ragebuffer--;

if (player.x > (x - 400) && player.x < (x + 400) && y <= (player.y + 60) && y >= (player.y - 60) && important == 0)
{
    if (x != player.x && state != 130 && y == ystart && important == 0)
    {
        if (state == 136)
        {
            image_index = 0;
            image_xscale = -sign(x - obj_player1.x);
            state = 130;
            sprite_index = spr_null;
        }
    }
}

if (state == 140 || state == 136)
    movespeed = 0;

if (state != 140)
    thrown = false;

if (boundbox == 0)
{
    with (instance_create(x, y, obj_baddiecollisionbox))
    {
        sprite_index = other.sprite_index;
        mask_index = other.sprite_index;
        baddieID = other.id;
        other.boundbox = 1;
    }
}
