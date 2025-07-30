if (room == rm_blank)
    exit;

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
        
        if (!instance_exists(coneID))
        {
            coneID = instance_create(x, y, obj_patrolcone);
            coneID.baddieID = id;
        }
        
        if (alarm[5] != -1)
        {
            sprite_index = spr_patroller_idle;
            hsp = 0;
        }
        
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
    
    case 137:
        if (grounded && vsp > 0)
        {
            image_speed = 0.35;
        }
        else
        {
            image_speed = 0;
            image_index = 0;
        }
        
        if (floor(image_index) == (image_number - 1))
        {
            state = 136;
            sprite_index = walkspr;
        }
        
        break;
}

if (cooldown > 0)
    cooldown--;

if (state == 136)
{
    if (!patrolfound)
    {
        if (cooldown <= 0 && alarm[5] == -1 && instance_exists(coneID) && coneID.collision)
        {
            patroltimer = patroltimermax;
            patrolfound = 1;
            alarm[5] = 60;
        }
    }
    else if (alarm[5] == -1)
    {
        alarm[5] = 60;
    }
}

if (state == 136 && point_in_camera(x, y, view_camera[0]))
{
    var p = 0;
    
    with (obj_player1)
    {
        if (state == 86 && sprite_index == spr_taunt)
            p = 1;
    }
    
    if (p)
    {
        patroltimer = 0;
        alarm[5] = 1;
    }
}

if (state == 82)
{
    hsp = 0;
    
    if (floor(image_index) == (image_number - 1))
    {
        state = 136;
        sprite_index = walkspr;
        cooldown = 100;
    }
}

if (state == 140 || state == 6 || state == 139)
    alarm[5] = -1;

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
