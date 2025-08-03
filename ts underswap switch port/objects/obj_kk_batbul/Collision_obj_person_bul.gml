with (other)
{
    sfx_play(snd_swoop);
    var spin = instance_create_xy(x, y, obj_person_spin);
    spin.vspeed = 8 * ((other.vspeed > 0) ? 0.5 : -1);
    spin.hspeed = 4 * sign(other.hspeed);
    spin.special = special;
    instance_destroy();
}
