depth = 4;
image_speed = 0.35;
weapon = false;

function shieldGrabbed()
{
    scr_fmod_soundeffectONESHOT("event:/sfx/player/collect/topping", x, y);
    obj_player.shield += 1;
    obj_player.shieldhealth = 3;
    instance_destroy();
    restore_combo();
}
