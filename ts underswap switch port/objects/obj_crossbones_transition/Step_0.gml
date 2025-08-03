var size = 64 * animcurve_channel_evaluate(animcurve_get_channel(acv_crossbones_transition, 0), step / duration);

if (step >= duration)
{
    instance_destroy();
    exit;
}

image_xscale = size;
image_yscale = size;

if (!global.lowvfx)
    image_angle += 5;

step += 1;
