event_inherited();

if (obj_papyrus_date_actor.x < 640)
    spinType = 1;
else
    spinType = 0;

switch (spinType)
{
    case 0:
        needleRot = number_approach_smooth(needleRot, needleRot + (xirandom_range(60, 90) * dir), 0.25);
        break;
    
    case 1:
        needleRot = point_direction(x, y, obj_papyrus_date_actor.x, obj_papyrus_date_actor.y) - 100;
        break;
}

if (!global.lowvfx)
{
    image_xscale = 2 + random_range(-0.05, 0.05);
    image_yscale = 2 + xrandom_range(-0.05, 0.05);
}

needleRotLerped = lerp(needleRotLerped, needleRot, 0.3);
