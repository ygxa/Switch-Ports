if (fadeIn)
{
    image_alpha += 0.05;
    
    if (image_alpha >= 1)
        fadeIn = false;
}

if (fadeOut)
{
    image_alpha -= 0.05;
    var blendMult = 1 - image_alpha;
    obj_asgore_monster.image_blend = make_color_rgb(color_get_red(obj_asgore_monster.flavorColor) * blendMult, color_get_green(obj_asgore_monster.flavorColor) * blendMult, color_get_blue(obj_asgore_monster.flavorColor) * blendMult);
    
    if (image_alpha == 0.95)
        obj_asgore_monster.animatedBody = true;
    
    if (image_alpha <= 0)
    {
        instance_destroy();
        obj_battlemanager.endAttackMode();
    }
}

if (specialX != -1)
{
    x = number_approach_smooth(x, specialX, 0.25, 0.5);
    y = number_approach_smooth(y, specialY, 0.25, 0.5);
}
else
{
    yOffset = number_approach_smooth(yOffset, yOffsetToApproach, moveSpeed, 0.5);
    image_angle = number_approach_smooth(image_angle, angleToApproach, moveSpeed, 0.5);
    x = obj_asgore_monster.x + (obj_asgore_monster.sprite_width / 2) + 2;
    y = ((obj_asgore_monster.y + (obj_asgore_monster.sprite_height / 2)) - 4) + yOffset;
}

if (fadeGray != 0)
{
    if (fadeGray < 1)
        fadeGray += 0.1;
    
    image_blend = merge_color(#ED1C24, #444444, fadeGray);
}
