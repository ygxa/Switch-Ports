if (fadeIn)
{
    if (obj_larry_monster.isActive && obj_larry_monster.image_alpha < 1)
        obj_larry_monster.image_alpha += 0.05;
    
    if (obj_harry_monster.isActive && obj_harry_monster.image_alpha < 1)
        obj_harry_monster.image_alpha += 0.05;
}
