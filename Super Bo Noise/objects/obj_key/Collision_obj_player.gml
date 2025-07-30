if (room == rm_blank)
    exit;

if (global.key_inv)
    exit;

with (other)
{
    if (state != 53 && state != 188 && state != 18 && state != 49 && state != 23 && state != 35 && state != 26 && state != 50 && state != 40 && state != 109 && state != 51)
    {
        instance_destroy(other);
        global.key_inv = 1;
        key_particles = 1;
        alarm[7] = 30;
        event_play_oneshot("event:/SFX/misc/collecttoppin");
        state = 92;
        image_index = 0;
        global.heattime = 60;
    }
}
