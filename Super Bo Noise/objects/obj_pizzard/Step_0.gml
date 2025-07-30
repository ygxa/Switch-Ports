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
}

if (state == 140 && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state != 140)
    birdcreated = 0;

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (state != 6)
    depth = 0;

if (state != 140)
    thrown = false;

scr_scareenemy();

if (bombreset > 0)
    bombreset--;

var targetplayer = global.coop ? instance_nearest(x, y, obj_player1) : obj_player1;

if (x != targetplayer.x && state != 131 && bombreset <= 0 && grounded)
{
    if (targetplayer.x > (x - 400) && targetplayer.x < (x + 400) && y <= (targetplayer.y + 20) && y >= (targetplayer.y - 20))
    {
        if ((state == 136 || state == 128) && !scr_solid_line(targetplayer))
        {
            sprite_index = spr_pizzard_shoot;
            image_index = 0;
            image_xscale = -sign(x - targetplayer.x);
            state = 131;
        }
    }
}

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
