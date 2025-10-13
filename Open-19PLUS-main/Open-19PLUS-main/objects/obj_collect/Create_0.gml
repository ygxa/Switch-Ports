event_inherited();
sprite_index = get_collectspr(collect_type.big, obj_player.character);
image_speed = 0.35;
global.collected = 0;
global.collectsound = 0;
depth = -4;
spawn = 0;
activate = 0;
previousmask = spr_sausagecollect;
magnetized = noone;
magnetspeed = 7;

function collectGrabbed()
{
    scr_sound_multiple("event:/sfx/player/collect/topping", x, y);
    
    with (instance_create_depth(x, y, -9999999, obj_collectparticle))
    {
        sprite_index = other.id.sprite_index;
        image_speed = other.image_speed;
        image_index = other.image_index;
        value = 10;
        shake = 4;
    }
    
    add_collect(10);
    
    with (instance_create_depth(x + 16, y, 0, obj_smallnumber))
        number = "10";
    
    with (instance_create_depth(x, y, 0, obj_parryeffect))
        sprite_index = choose(spr_collectsparkleeffect, spr_collectsparkleeffect2);
    
    instance_destroy();
    restore_combo(10);
}
