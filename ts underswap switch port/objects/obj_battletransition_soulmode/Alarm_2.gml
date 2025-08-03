var _heart = instance_create_xy(heart.x, heart.y, obj_transitionheart);
_heart.depth = obj_battletransition.depth - 10;

with (heart)
    instance_destroy();

with (_heart)
{
    sprite_index = other.swapSpriteCenter2x;
    image_xscale = 0.5;
    image_yscale = 0.5;
    outlineSprite = spr_owheart_outline_center_2x;
    doDrawOutline(true);
    create_shiner(20);
}

heart = _heart;
sfx_play(snd_great_shine, 80, false, true);
sfx_play_pitch(snd_great_shine, 0.8, 81, false, true);
sfx_play_pitch(snd_reverb_impact, 1.5, 82, false, true);
view_shake(2, 1);
var _startDepth = obj_transitionheart.depth;

for (var i = 0; i < 3; i++)
{
    with (instance_create_xy(heart.x, heart.y, obj_afterimage_fader))
    {
        sprite_index = other.swapSpriteCenter2x;
        depth = _startDepth + i;
        image_xscale = 0.5;
        image_yscale = 0.5;
        scaleSpeed = 0.2 * i;
        image_alpha = i;
    }
}
