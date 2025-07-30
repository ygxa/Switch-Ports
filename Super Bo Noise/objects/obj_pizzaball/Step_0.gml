if (room == rm_blank)
    exit;

if (state == 136 && grounded && vsp > 0 && obj_player1.state == 113)
    scr_pizzaball_go_to_thrown(0, -10);

switch (state)
{
    case 128:
        scr_enemy_idle();
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
        scr_pizzaball_hit();
        break;
    
    case 150:
        scr_pizzaball_golf();
        break;
    
    case 158:
        scr_pizzaball_thrown();
        break;
    
    case 140:
        scr_pizzaball_go_to_thrown(0, vsp * 0.5);
        break;
    
    case 131:
        scr_pizzagoblin_throw();
        break;
    
    case 6:
        scr_pizzaball_grabbed();
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

if ((state == 136 || state == 128) && sit)
{
    hsp = 0;
    sprite_index = spr_pizzaball_idle1;
}

if (state != 136)
    sit = 0;

if (state == 140 && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state == 158 && !instance_exists(pointerID))
{
    pointerID = instance_create(x, y, obj_objecticontracker);
    pointerID.sprite_index = spr_icon_pizzaball;
    pointerID.objectID = id;
}

if (state != 140)
    birdcreated = 0;

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

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

if (state == 158)
{
    with (instance_place(x + xscale, y, obj_destructibles))
        instance_destroy();
    
    with (instance_place(x + hsp + xscale, y, obj_destructibles))
        instance_destroy();
    
    with (instance_place(x, y + vsp + 1, obj_destructibles))
        instance_destroy();
    
    with (instance_place(x, (y + vsp) - 1, obj_destructibles))
        instance_destroy();
    
    with (instance_place(x, y + 1, obj_destructibles))
        instance_destroy();
    
    with (instance_place(x, y - 1, obj_destructibles))
        instance_destroy();
}
