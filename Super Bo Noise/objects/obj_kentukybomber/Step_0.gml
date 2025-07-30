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

if (bombreset > 0 && state == 136)
    bombreset--;

var player = instance_nearest(x, y, obj_player1);

if (ragebuffer > 0)
    ragebuffer--;

if (player.x > (x - 200) && player.x < (x + 200) && player.y <= (y + 400) && player.y >= (y - 60))
{
    if (x != player.x && state != 131 && bombreset == 0)
    {
        if (state == 136 || state == 128)
        {
            sprite_index = spr_kentukybomber_attack;
            image_index = 0;
            state = 131;
        }
    }
}

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (state == 131 || state == 127)
{
    hsp = 0;
    vsp = 0;
}

if (state != 6)
    depth = 0;

scr_scareenemy();

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
