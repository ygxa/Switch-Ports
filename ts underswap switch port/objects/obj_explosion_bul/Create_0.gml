event_inherited();
image_xscale = 2;
image_yscale = 2;
sprite_index = lang_get_sprite(spr_explosion);
mask_index = spr_explosion_mask;

if (global.lowvfx)
{
    image_speed = 0;
    image_index = 1;
}

step = 0;
collided = false;
fadeSpeed = 0.05;
