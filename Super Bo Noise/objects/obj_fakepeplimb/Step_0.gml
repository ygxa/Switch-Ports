if (room == rm_blank)
    exit;

targetplayer = instance_nearest(x, y, obj_player1);

if (ceiling && (state == 102 || state == 82))
    grav = 0;
else if (ceiling && state != 102 && state != 82)
    grav = 0.5;

switch (state)
{
    case 128:
        scr_enemy_idle();
        break;
    
    case 132:
        scr_enemy_turn();
        break;
    
    case 136:
        ceiling = 0;
        state = 102;
        grav = 0.5;
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
    
    case 82:
        hidden = 0;
        cooldown = 100;
        
        if (sprite_index != spr_attack)
        {
            sprite_index = spr_attack;
            image_index = 0;
            
            with (instance_create(x, y, obj_tackhitbox))
            {
                visible = false;
                sprite_index = other.sprite_index;
                other.hitboxID = id;
                ID = other.id;
            }
        }
        else if (floor(image_index) == (image_number - 1))
        {
            image_speed = 0.35;
            state = 102;
            instance_destroy(hitboxID);
            sprite_index = spr_hidden;
        }
        
        break;
    
    case 102:
        if (hidden)
        {
            sprite_index = spr_hidden;
            
            if (targetplayer.x > (x - 200) && targetplayer.x < (x + 200) && targetplayer.y < (y + 300) && targetplayer.y > (y - 300))
            {
                hidden = 0;
                state = 82;
            }
        }
        else
        {
            sprite_index = spr_hidden;
            
            if (cooldown > 0)
                cooldown--;
            else
                state = 82;
        }
        
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

if (hidden)
    invincible = 1;
else
    invincible = 0;

if (state != 6)
    depth = 0;

if (state != 140)
    thrown = false;
