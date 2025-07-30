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
    
    case 19:
        scr_enemy_ghostpossess();
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

scr_scareenemy();

if (ragedash > 0 && state == 127)
    ragedash--;

if (ragedash == 0 && state == 127)
{
    state = 136;
    sprite_index = walkspr;
    ragecooldown = 100;
}

if (ragecooldown > 0)
    ragecooldown--;

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (hitboxcreate == 0 && state == 136)
{
    hitboxcreate = 1;
    
    with (instance_create(x, y, obj_tackhitbox))
        ID = other.id;
}

if (state != 6)
    depth = 0;

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
