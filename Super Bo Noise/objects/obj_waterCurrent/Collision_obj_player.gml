event_inherited();

with (other)
{
    if (state == 63 || state == 148 || state == 210)
        exit;
    
    hsp_carry += lengthdir_x(other.currentMovespeed, other.image_angle);
    vsp_carry += lengthdir_y(other.currentMovespeed, other.image_angle);
}
