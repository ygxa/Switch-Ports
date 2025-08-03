visible = false;

for (var i = 0; i < 8; i++)
{
    var star = instance_create_xy(x, y, obj_gunshot_star);
    star.image_angle = i * 20;
    star.siner = i * 45;
    star.image_blend = image_blend;
}

var aftershot = instance_create_xy(x, y, obj_gunshot_atk2);
aftershot.image_blend = image_blend;
shotNum++;
alarm[4] = 3;
