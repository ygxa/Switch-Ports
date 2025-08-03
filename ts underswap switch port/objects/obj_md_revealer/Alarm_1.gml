dio = true;
state = 1;

with (obj_md_monster)
{
    sprite_index = spr_mdbodyf2;
    shakeValue = shakeAmount;
    hurtSprite = -1;
    normalSprite = -1;
    alarm[10] = 1;
}

var cam = view_get_camera(0);
camera_set_view_pos(cam, 200, 48);
camera_set_view_size(cam, 240, 180);
view_flash(0.2);
