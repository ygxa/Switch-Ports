x = number_approach_smooth(x, obj_aaxel_monster.x, 0.4, 0.5);
y = number_approach_smooth(y, obj_aaxel_monster.y, 0.4, 0.5);
blender = number_approach_smooth(blender, 0, 0.4, 0.005);
image_blend = merge_color(startBlend, c_white, blender);

if (blender != 0)
{
    alarm[2] = 1;
}
else
{
    obj_aaxel_monster.visible = true;
    obj_battlemanager.attackTime = 5;
    obj_battlemanager.attackTimer = 5;
    instance_destroy();
}
