event_inherited();
length = 0;
angle = 90;
isGreen = false;
boneId = -1;
noDamage = false;
posCurveUpdateIndex = -1;

init = function()
{
    image_xscale = length / 50;
    image_angle = angle + 180;
    
    with (obj_sans_monster_parent)
    {
        other.boneId = boneId;
        bones[boneId++] = other.id;
    }
};

updates = [];
