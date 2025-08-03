if (obj_battlemanager.attackTimer < 30)
{
    if (image_alpha > 0)
        image_alpha -= 0.2;
}
else if (image_alpha < 1)
{
    image_alpha += 0.1;
}

if (image_alpha < 0.8 && obj_battlemanager.attackTimer > 30)
    exit;

siner += spd;
spd = number_approach_linear(spd, 0.1, 0.0025);
var s = sin(siner);
image_angle = s * 50;

if (s <= -0.5)
    updateSprite(2, s);
else if (s >= 0.5)
    updateSprite(3, s);
else
    updateSprite(1, s);
