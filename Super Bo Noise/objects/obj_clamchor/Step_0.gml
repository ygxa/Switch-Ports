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
        var _vsp = 3;
        var face = sign(ystart - y);
        
        if (y != ystart && !scr_solid(x, y + (face * _vsp)))
            y = approach(y, ystart, _vsp);
        
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

var player = instance_nearest(x, y, obj_player1);

if (ragebuffer > 0)
    ragebuffer--;

if (collision_rectangle(x - 100, y - 30, x + 100, y + 600, obj_player1, false, true) > 0 && !scr_solid_line(player) && y == ystart)
{
    if (state != 127 && ragebuffer == 0 && (state == 136 || state == 130))
    {
        event_play_oneshot("event:/SFX/enemies/charge", x, y);
        state = 127;
        sprite_index = spr_clam_attackstart;
        
        if (x != player.x)
            image_xscale = -sign(x - player.x);
        
        ragebuffer = 100;
        image_index = 0;
        image_speed = 0.5;
        flash = 0;
        alarm[4] = 5;
        
        with (instance_create(x, y, obj_tackhitbox))
        {
            sprite_index = spr_clam_hurtbox;
            mask_index = spr_clam_hurtbox;
            ID = other.id;
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
