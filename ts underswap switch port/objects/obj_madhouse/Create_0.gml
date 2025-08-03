event_inherited();
music = -4;
funnycounter = 0;
funnylag = 0;

if (room == rm_star22_chase1)
{
    if (ds_map_find_value(global.flags, "plot") >= 56)
    {
        instance_destroy();
        exit;
    }
}

sceneName = "int.star22.house";
s = instance_create_xy(bbox_left, bbox_top, obj_solid);
s.image_xscale = (bbox_right - bbox_left) / 20;
s.image_yscale = (bbox_bottom - bbox_top) / 20;
revealed = false;
siner = 0;
origXView = 0;
origYView = 0;
fade = 0;
bounceAmount = 0;
center = 0;
shake = false;
siner2 = 0;
chasing = false;
yTarget = 90;
armIndex = 0;
faceIndex = 0;
fallBehind = 0;
approachSpeed = 0.01;
lastvx = 0;
lastvy = -1;
follow = true;
attackTimer = 0;
hardMode = evac(2);
armAlpha = 1;

drawChase = function(argument0)
{
    var mh = obj_madhouse.id;
    
    with (argument0)
    {
        if (room == rm_star22_chase1)
        {
            draw_sprite_ext(spr_madhouse_chase_right_arm_l, floor(mh.armIndex), x + 27, y + 20, image_xscale, image_yscale, 0, c_white, image_alpha * mh.armAlpha);
            draw_sprite_ext(spr_madhouse_chase_right, floor(mh.faceIndex), x, y, image_xscale, image_yscale, 0, c_white, image_alpha);
            draw_sprite_ext(spr_madhouse_chase_right_arm_r, floor(mh.armIndex), x - 2, y + 22, image_xscale, image_yscale, 0, c_white, image_alpha * mh.armAlpha);
        }
        else
        {
            draw_sprite_ext(spr_madhouse_chase_up_arm_l, floor(mh.armIndex), x - 16, y + 10, image_xscale, image_yscale, 0, c_white, image_alpha * mh.armAlpha);
            draw_sprite_ext(spr_madhouse_chase_up_arm_r, floor(mh.armIndex), x + 26, y + 5, image_xscale, image_yscale, 0, c_white, image_alpha * mh.armAlpha);
            draw_sprite_ext(spr_madhouse_chase_up, floor(mh.faceIndex), x, y, image_xscale, image_yscale, 0, c_white, image_alpha);
        }
    }
};

if (room == rm_star23_chase2)
{
    chasing = true;
    revealed = true;
    follow = false;
    x = 140;
    y = room_height + 120;
    yTarget = y;
    music_lcplay("housechase2", false);
}
