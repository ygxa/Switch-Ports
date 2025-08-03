event_inherited();
gravity_direction = 270;
gravity = 0.25;
var destroyBullet = false;
var choice = irandom(9);

switch (choice)
{
    case 7:
        sprite_index = spr_migospb_projectile;
        image_index = irandom(1);
        break;
    
    case 8:
        sprite_index = spr_vegbullet;
        image_index = irandom(5);
        break;
    
    case 9:
        bt_bullet(obj_frogb_fly, x, y, obj_mettalot_monster);
        destroyBullet = true;
        break;
    
    default:
        sprite_index = spr_metb_tomato;
        break;
}

if (destroyBullet)
    instance_destroy();
