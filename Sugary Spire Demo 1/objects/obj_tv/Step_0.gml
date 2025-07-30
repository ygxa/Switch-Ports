scr_tvsprites();

if (showtext == 1)
{
    xi = 500 + random_range(1, -1);
    
    if (yi > 475)
        yi -= 5;
}

if (showtext == 0)
{
    xi = 500 + random_range(1, -1);
    
    if (yi < 675)
        yi += 1;
}

if (!(obj_player.state == 17 && obj_player.state == 18 && obj_player.state == 11))
    once = 0;

if (obj_player.y < (180 + obj_camera.Cam_y) && obj_player.x > ((camera_get_view_width(view_camera[0]) - 350) + obj_camera.Cam_x))
{
    DrawY = lerp(DrawY, -300, 0.15);
    alpha = 0.5;
}
else
{
    DrawY = lerp(DrawY, 0, 0.15);
    alpha = 1;
}

if (global.collect > global.arank && shownranka == 0)
{
    message = "YOU GOT ENOUGH FOR RANK A";
    showtext = 1;
    alarm[0] = 200;
    shownranka = 1;
}
else if (global.collect > global.brank && shownrankb == 0)
{
    message = "YOU GOT ENOUGH FOR RANK B";
    showtext = 1;
    alarm[0] = 200;
    shownrankb = 1;
}
else if (global.collect > global.crank && shownrankc == 0)
{
    message = "YOU GOT ENOUGH FOR RANK C";
    showtext = 1;
    alarm[0] = 200;
    shownrankc = 1;
}

if (global.hurtcounter >= global.hurtmilestone)
{
    alarm[0] = 150;
    
    if (obj_player.character == "P")
        character = "PIZZELLE";
    else
        character = "THE PIZZANO";
    
    message = "YOU HAVE HURT " + string(character) + " " + string(global.hurtmilestone) + " TIMES...";
    global.hurtmilestone += 3;
}

if (obj_player.state == 53)
{
    showtext = 1;
    message = "KEY OBTAINED!";
    alarm[0] = 50;
}

if (staticdraw)
    statictimer--;

if (statictimer < 0)
    staticdraw = false;

if (tvsprite != 621 && ds_queue_size(global.newhudtvanim) < 1 && tvlength <= 0)
{
    switch (obj_player.state)
    {
        case 70:
            ChannelState = 0;
            tvsprite = hurttvspr;
            break;
        
        case 98:
            ChannelState = 1;
            tvsprite = minecarttvspr;
            break;
        
        case 103:
            ChannelState = 2;
            tvsprite = firetvspr;
            break;
        
        case 20:
            ChannelState = 3;
            tvsprite = bombtvspr;
            break;
        
        case 85:
        case 94:
        case 95:
            ChannelState = 4;
            tvsprite = cottontvspr;
            break;
        
        case 96:
            ChannelState = 5;
            tvsprite = orbtvspr;
            break;
        
        case 65:
        case 66:
        case 15:
        case 68:
        case 10:
        case 29:
        case 64:
        case 67:
            ChannelState = 6;
            tvsprite = mach2tvspr;
            
            if (obj_player.state == 65 || obj_player.state == 15 || obj_player.state == 64)
                tvsprite = mach1tvspr;
            
            if (obj_player.state == 67 || obj_player.state == 29)
                tvsprite = mach3tvspr;
            
            if (obj_player.state == 67 && obj_player.movespeed > 20)
                tvsprite = mach4tvspr;
            
            break;
        
        default:
            if (obj_player.angry == 0)
            {
                ChannelState = 6;
                
                if (tvsprite != idletvspr && !(tvsprite == tvchange1 || tvsprite == tvchange2))
                {
                    tvcount = choose(500, 450, 400, 550);
                    tvsprite = idletvspr;
                    image_index = 0;
                }
                
                if (tvsprite == idletvspr && tvcount < 1)
                {
                    tvsprite = choose(tvchange1, tvchange2, tvchange2, tvchange1);
                    image_index = 0;
                }
                
                if ((tvsprite == tvchange1 || tvsprite == tvchange2) && animation_end())
                {
                    tvcount = choose(500, 450, 400, 550);
                    tvsprite = idletvspr;
                    image_index = 0;
                }
                
                if (tvsprite == idletvspr)
                    tvcount--;
            }
            else
            {
                ChannelState = 7;
                tvsprite = angrytvspr;
            }
            
            break;
    }
    
    if (OLDChannelState != ChannelState)
    {
        staticdraw = true;
        statictimer = 20;
        OLDChannelState = ChannelState;
    }
}

propindex += 0.5;

if (propindex >= 6)
    propindex = 0;

statindex += 0.3;

if (statindex >= 12)
{
    statindex = 0;
}
else if (tvsprite != 621 && ds_queue_size(global.newhudtvanim) > 1)
{
    tvsprite = ds_queue_dequeue(global.newhudtvanim);
    tvlength = ds_queue_dequeue(global.newhudtvanim);
}

if (tvlength > 0)
{
    ChannelState = 99;
    
    if (OLDChannelState != ChannelState)
    {
        staticdraw = true;
        statictimer = 20;
        OLDChannelState = ChannelState;
    }
}

tvlength--;

if (global.key_inv == 1)
    invsprite = spr_invkey;
else if (global.treat == 1 && global.key_inv != 1)
    invsprite = spr_invdonut;
else
    invsprite = spr_invempty;

if (tvsprite == spr_tvturnon && floor(image_index) == (image_number - 1))
    tvsprite = idletvspr;

sprite_index = tvsprite;
