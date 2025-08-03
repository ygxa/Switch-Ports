counter++;

if ((counter % 3) == 0)
    beamY = number_add_wrap(beamY, sprite_height);

if (staticMode)
{
    if ((counter % 2) == 0)
    {
        staticIndex++;
        
        if (staticIndex > 3)
            staticIndex = 0;
    }
}

if (contentIndex == 6 || contentIndex == 7)
{
    if ((counter % 2) == 0)
    {
        if (contentIndex == 6)
            contentIndex = 7;
        else
            contentIndex = 6;
    }
}

if (obj_player.readyToDance)
    wallHugs += 2;

switch (wallHugs)
{
    case 150:
        smokeEmitSpeed = 20;
        break;
    
    case 500:
        smokeEmitSpeed = 10;
        break;
    
    case 1000:
        smokeEmitSpeed = 5;
        break;
    
    case 1500:
        smokeEmitSpeed = 2;
        break;
}

if (smokeEmitSpeed != 0 && (counter % smokeEmitSpeed) == 0)
{
    var smoke = instance_create_xy(x, y + 26, obj_afterimage_fader);
    
    with (smoke)
    {
        sprite_index = xchoose(spr_star_float_smoke, spr_butchy_smoke);
        image_speed = 0.5;
        image_blend = c_ltgray;
        var side = irandom(1);
        
        if (side)
        {
            direction = irandom_range(-5, 5) + 45;
            gravity_direction = 70;
        }
        else
        {
            direction = irandom_range(-5, 5) + 135;
            gravity_direction = 110;
        }
        
        gravity = 0.05;
        speed = 0.6;
        fadeSpeed = 0.05;
        scaleSpeed = 0.02;
    }
}
