if (!did && image_index >= 3)
{
    did = true;
    sfx_play(snd_buzzplode);
    view_shake(2, 2);
    
    repeat (7)
        bt_bullet_attack(obj_beenard_pollen, obj_beenard_monster.attack - 2, irandom_range(bbox_left, bbox_right), irandom_range(bbox_top, bbox_bottom));
}

if (image_speed == 1 && floor(image_index) >= (image_number - 1))
{
    image_speed = 0;
    image_index = image_number - 1;
    alarm[0] = 5;
}
