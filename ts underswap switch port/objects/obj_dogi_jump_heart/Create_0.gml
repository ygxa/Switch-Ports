event_inherited();
x = (obj_battlemanager.boxX1 + obj_battlemanager.boxX2) / 2;
y = (obj_battlemanager.boxY1 + obj_battlemanager.boxY2) / 2;
depth = -100;
blue = irandom(1) == 0;

with (instance_create_xy(x, y, obj_afterimage))
{
    scaleSpeed = 0.1;
    depth = -90;
    sprite_index = other.sprite_index;
}

alarm[0] = 10;
counter = 10;
vol = 1;
pitch = 1;
sfx_play(snd_saber);
view_shake(2, 2);
alarm[2] = 1;
