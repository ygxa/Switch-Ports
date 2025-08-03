event_inherited();
contentType = 0;
damageAmount = instance_exists(obj_koffink_monster) ? obj_koffink_monster.attack : obj_harry_monster.attack;
direction = 90;
watchForFloor = false;
spin = false;
parentObj = -4;
followParent = true;
fade = false;
fastExplosion = false;

function setContentType(argument0)
{
    contentType = argument0;
    
    switch (contentType)
    {
        case 0:
        case 2:
            sprite_index = (irandom(500) == 499) ? spr_everyman_bul : spr_duck_bul;
            break;
        
        case 1:
            sprite_index = spr_hat_bomb_lit;
            break;
    }
}

function doContentAction()
{
    gravity = 0.5;
    watchForFloor = true;
    followParent = false;
    var type = contentType;
    
    switch (type)
    {
        case 1:
            sprite_index = spr_hat_bomb;
            break;
        
        case 2:
            y -= 10;
            gravity = 0;
            sprite_index = (sprite_index == spr_everyman_bul) ? spr_everyman_bul_fly : spr_flying_duck;
            image_speed = 0.5;
            hspeed = 2;
            vspeed = -1;
            alarm[0] = 30;
            break;
    }
}

function handleFloorCollision()
{
    watchForFloor = false;
    var type = contentType;
    
    switch (type)
    {
        case 0:
            vspeed = -8;
            hspeed = 0.5 * choose(-1, 1);
            sfx_play(snd_quack, 80, false);
            spin = true;
            break;
        
        case 1:
            with (instance_create_xy(x, y - 24, obj_explosion_bul))
            {
                damageAmount = other.damageAmount;
                image_blend = other.image_blend;
                
                if (other.fastExplosion)
                {
                    fadeSpeed = 0.1;
                    step = 15;
                }
            }
            
            sfx_play(snd_bang, 80, false);
            instance_destroy();
            break;
    }
}
