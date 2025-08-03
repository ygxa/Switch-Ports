depth = -20;
image_spd = 0.65;
back = false;
image_speed = 0;
image_index = 0;
doonce = false;
sprite_index = spr_mbook_pageflip;
image_xscale = 2;
image_yscale = 2;

trigger = function(argument0)
{
    back = argument0;
    sfx_play(argument0 ? snd_flip2 : snd_flip1);
};
