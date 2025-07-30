if (room == rm_blank)
    exit;

targetplayer = instance_nearest(x, y, obj_player1);
wastedhits = 8 - elitehit;

if (elitehit <= 2)
    attackpool = [176, 132, 74, 74, 74];
else if (elitehit <= 4)
    attackpool = [176, 176, 176, 132];
else if (elitehit <= 6)
    attackpool = [132];

switch (state)
{
    case 136:
        scr_noise_walk();
        break;
    
    case 94:
        scr_noise_jump();
        break;
    
    case 82:
        scr_noise_punch();
        break;
    
    case 176:
        scr_noise_shield();
        break;
    
    case 74:
        scr_noise_pistol();
        break;
    
    case 139:
        scr_enemy_hit();
        break;
    
    case 140:
        scr_enemy_stun();
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

if (state != 110 && state != 113)
    hit = 0;

if (state == 140)
{
    movespeed = 0;
    
    if (thrown)
    {
        savedthrown = true;
        placedtraps = 0;
        jumpbuffer = 1;
        attacked = 0;
        
        with (obj_noisetrap)
            instance_destroy();
    }
    
    if (grounded && vsp > 0 && savedthrown)
    {
        stunned = 1;
        idle_timer = 1;
    }
}
else
{
    savedthrown = false;
}

if (state == 140 && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state == 94 || (state == 176 && substate == 94))
{
    use_collision = 0;
    x += hsp;
    y += vsp;
    
    if (vsp < 20)
        vsp += grav;
}
else
{
    use_collision = 1;
}

if ((state == 74 && substate == 68) || (state == 176 && substate == 176) || (state == 136 && (!placedtraps || (!obj_player1.brick && !instance_exists(obj_brickball)))) || state == 82 || state == 140 || !use_collision)
    invincible = 1;
else
    invincible = 0;

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
