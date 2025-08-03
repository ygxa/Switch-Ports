shake = 3;
step = 0;
image_alpha = 0;
state = 0;
image_speed = 0;
depth = -98;
drawHeart = true;

setState = function(argument0)
{
    switch (argument0)
    {
        case 0:
            alarm[0] = 360;
            break;
        
        case 1:
            image_index = 1;
            sfx_play(snd_soulsnap);
            shake = 0;
            alarm[0] = 40;
            break;
        
        case 2:
            sfx_play(snd_soulshatter);
            drawHeart = false;
            var shard = instance_create_xy(x - 2, y, obj_heart_shard);
            shard.sprite_index = spr_heartshard_desaturate;
            shard = instance_create_xy(x, y + 3, obj_heart_shard);
            shard.sprite_index = spr_heartshard_desaturate;
            shard = instance_create_xy(x + 2, y + 6, obj_heart_shard);
            shard.sprite_index = spr_heartshard_desaturate;
            shard = instance_create_xy(x + 8, y, obj_heart_shard);
            shard.sprite_index = spr_heartshard_desaturate;
            shard = instance_create_xy(x + 10, y + 3, obj_heart_shard);
            shard.sprite_index = spr_heartshard_desaturate;
            shard = instance_create_xy(x + 12, y + 6, obj_heart_shard);
            shard.sprite_index = spr_heartshard_desaturate;
            
            with (obj_asgore_monster)
                alarm[2] = 120;
            
            break;
    }
};

setState(0);

with (obj_battlebg)
    visible = false;

with (obj_battlemanager)
    visible = false;

with (obj_battleheart)
    instance_create_xy(x, y, obj_battleheart_squirm);
