if (animatedBody)
{
    siner += (sinerIntensity / 15);
    
    if (siner >= (2 * pi))
        siner -= (2 * pi);
    
    capeIndex += 0.05;
    
    if (capeIndex >= 2)
        capeIndex -= 2;
    
    var s = sin(siner);
    headY += (s * 0.3);
    spearY += (s * 0.3);
    torsoY += (s * 0.2);
    capeY += (s * 0.05);
    var c = cos(siner);
    armLY += (c * 0.1);
    armRY += (c * 0.1);
}
else if (sprite_index == spr_asgb_tridentreveal && image_speed == 1)
{
    if (floor(image_index) >= 12)
    {
        image_speed = 0;
        image_index = 12;
        alarm[0] = 30;
    }
    else
    {
        x = number_approach_smooth(x, 136, 0.4, 0.5);
    }
}

if ((x + xOffset) > 0.5 && !notDoneIntro && !xCorrectOverride)
    x = number_approach_smooth(x, initX + xOffset, 0.4, 0.5);

if (instance_exists(obj_speechbubble) && instance_exists(obj_speechbubble.writer) && !obj_speechbubble.writer.isDone && sprite_index != spr_asgb_tridentreveal)
    image_speed = 0.2;
else if (floor(image_index) == 0 && sprite_index != spr_asgb_tridentreveal)
    image_speed = 0;
