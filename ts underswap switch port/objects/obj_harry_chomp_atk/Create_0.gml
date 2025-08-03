event_inherited();
sfx_play(snd_grab);
view_shake(2, 2);
drawState = 0;
larBlend = 16777215;
harBlend = 16777215;
larBlender = 0;
harBlender = 0;
x = obj_larry_monster.x;
step = 0;

if (global.flavor_sprites)
{
    larBlend = obj_larry_monster.image_blend;
    harBlend = obj_harry_monster.image_blend;
}

origHarBlend = harBlend;
origLarBlend = larBlend;
image_xscale = 2;
image_yscale = 2;
armX = 82;
armXStart = armX;
armY = 24;
armYStart = armY;
preShakeAmt = 1;
preShakeX = x;
preShakeY = y;
fakeRandom = [1, -1, -1, 1, -1];
