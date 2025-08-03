if (image_alpha < 1)
    image_alpha += 0.2;

var cam = view_get_camera(0);
var _xv = camera_get_view_x(cam);
var _yv = camera_get_view_y(cam);

if (x < (_xv - 40) || x > (_xv + camera_get_view_width(cam) + 40) || y < (_yv - 40) || y > (_yv + camera_get_view_height(cam) + 40))
    instance_destroy();

var b = instance_place(x, y, obj_ruins_bandage);

if (b != -4 && !b.visible)
{
    b.visible = true;
    sfx_play(snd_dooropen);
    
    with (obj_dodgemode_handler)
    {
        shakeValue = 2;
        alarm[0] = 1;
    }
    
    repeat (3)
        instance_create_xy(x, y - 8, obj_md_dustcloud);
    
    instance_destroy();
}
