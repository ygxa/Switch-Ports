if (room == rm_star23_chase2)
{
    if (attackTimer == 50 || attackTimer == 190)
        instance_create_xy(x, y, obj_md_house_zoom);
    
    if (attackTimer == 20)
        instance_create_xy(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), camera_get_view_y(view_camera[0]), obj_md_bullet_array).dir = 2;
    
    if (attackTimer == 70)
        instance_create_xy(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), obj_md_bullet_array).dir = 3;
    
    if (attackTimer == 90)
    {
        with (instance_create_xy(camera_get_view_x(view_camera[0]) - 40, (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])) - 80, obj_harry_actor))
        {
            doPose(spr_harry_fly, 0, 1, false);
            depth = -5000;
            image_xscale *= -1;
        }
        
        with (instance_create_xy(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 20, (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])) - 80, obj_larry_actor))
        {
            doPose(spr_larry_fly, 0, 1, false);
            depth = -5000;
        }
    }
    
    if (attackTimer >= 120 && attackTimer <= 220)
    {
        var rate = hardMode ? 14 : 20;
        var halfRate = floor(rate / 2);
        var endRate = rate - 1;
        
        if (((attackTimer - 120) % rate) == halfRate)
            instance_create_xy(-20, irandom_range(camera_get_view_y(view_camera[0]) + 20, (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])) - 70), obj_md_house_throw);
        
        if (((attackTimer - 120) % rate) == endRate)
            instance_create_xy(340, irandom_range(camera_get_view_y(view_camera[0]) + 20, (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])) - 70), obj_md_house_throw);
    }
    
    if (attackTimer >= 300 && attackTimer <= 400)
    {
        var rate = hardMode ? 5 : 10;
        
        if (((attackTimer - 300) % rate) == 1)
        {
            var side = choose(2, 3);
            
            with (instance_create_xy((side == 2) ? -20 : 340, irandom_range(camera_get_view_y(view_camera[0]) + 30, (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])) - 70), obj_stark_bat_crossing))
            {
                hspeed = 7;
                
                if (side == 3)
                {
                    hspeed *= -1;
                    image_xscale *= -1;
                }
                
                vspeed = random_range(-1, 1);
                gravity = 0.07;
                gravity_direction = choose(270, 90);
            }
        }
    }
    
    attackTimer++;
    
    if (approachSpeed < 0.2)
        approachSpeed += 0.01;
    
    yTarget = number_approach_smooth(yTarget, ((camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])) - 50) + fallBehind, approachSpeed);
    y = yTarget + (sin(siner) * 10);
    
    if (y < 600)
        fallBehind += 0.7;
    
    siner += 0.1;
    
    if (lastvy != -1)
    {
        with (obj_md_house_zoom)
            y += (camera_get_view_y(view_camera[0]) - other.lastvy);
        
        with (obj_stark_bat_crossing)
            y += (camera_get_view_y(view_camera[0]) - other.lastvy);
        
        with (obj_harry_actor)
        {
            y += (camera_get_view_y(view_camera[0]) - other.lastvy);
            x = number_approach_smooth(x + (sin(other.siner) * 2), 40, 0.1, 0.5);
            y = number_approach_smooth(y + (sin(other.siner * 0.7) * 2), ((camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])) - 100) + (other.fallBehind * 3), 0.1, 0.5);
            depth = -5000;
        }
        
        with (obj_larry_actor)
        {
            y += (camera_get_view_y(view_camera[0]) - other.lastvy);
            x = number_approach_smooth(x + (sin(other.siner * 0.9) * 2), 260, 0.1, 0.5);
            y = number_approach_smooth(y + (sin(other.siner * 0.65) * 2), ((camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])) - 100) + (other.fallBehind * 3), 0.1, 0.5);
            depth = -5000;
        }
    }
    
    lastvy = camera_get_view_y(view_camera[0]);
    armIndex += 0.2;
    
    if (floor(armIndex) >= 2)
        armIndex -= 2;
}
else
{
    if (attackTimer <= 100)
    {
        var rate = hardMode ? 10 : 15;
        
        if ((attackTimer % rate) == (rate - 1))
        {
            var bul = instance_create_xy(irandom_range(camera_get_view_x(view_camera[0]) + 100, (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])) - 20), camera_get_view_y(view_camera[0]) - 30, obj_md_house_throw);
            
            if (hardMode)
            {
                with (bul)
                    instance_create_xy(x + choose(-45, 45), y, obj_md_house_throw);
            }
        }
    }
    else if (attackTimer <= 200)
    {
        if ((attackTimer % 40) == 1)
            instance_create_xy(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), obj_md_bullet_array).dir = 0;
        
        if (hardMode && (attackTimer % 40) == 21)
            instance_create_xy(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), obj_md_bullet_array).dir = 1;
    }
    else if (attackTimer <= 400)
    {
        var rate = hardMode ? 8 : 30;
        
        if ((attackTimer % rate) == (rate - 1))
            instance_create_xy(irandom_range(camera_get_view_x(view_camera[0]) + 100, (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])) - 20), camera_get_view_y(view_camera[0]) - 30, obj_md_house_throw);
        
        rate = hardMode ? 40 : 50;
        
        if ((attackTimer % rate) == (rate - 1))
            instance_create_xy(irandom_range(camera_get_view_x(view_camera[0]) + 100, (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])) - 20), irandom_range(camera_get_view_y(view_camera[0]) + 20, camera_get_view_y(view_camera[0]) + 40), obj_md_house_knife);
    }
    
    if (attackTimer == 70)
        instance_create_xy(x, y, obj_md_house_zoom);
    
    if (attackTimer == 290)
        instance_create_xy(x, y, obj_md_house_zoom);
    
    if (attackTimer == 480)
        instance_create(obj_md_house_piano);
    
    attackTimer++;
    
    if (approachSpeed < 0.5)
        approachSpeed += 0.01;
    
    x = number_approach_smooth(x, (camera_get_view_x(view_camera[0]) + 24) - fallBehind, approachSpeed);
    
    if (x >= 1800)
        fallBehind += 0.7;
    
    siner += 0.1;
    y = yTarget + (sin(siner) * 10);
    
    with (obj_md_house_knife)
        x += (camera_get_view_x(view_camera[0]) - other.lastvx);
    
    with (obj_md_house_throw)
        x += (camera_get_view_x(view_camera[0]) - other.lastvx);
    
    with (obj_md_house_zoom)
        x += (camera_get_view_x(view_camera[0]) - other.lastvx);
    
    lastvx = camera_get_view_x(view_camera[0]);
    armIndex += 0.2;
    
    if (floor(armIndex) >= 3)
        armIndex -= 3;
}

faceIndex += 0.2;

if (floor(faceIndex) >= 2)
    faceIndex -= 2;
