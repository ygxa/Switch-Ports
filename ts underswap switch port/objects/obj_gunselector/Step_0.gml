if (!selectorDone)
{
    switch (dir)
    {
        case 3:
            x += deltaPos;
            
            if (x > (obj_guntarget.x + (obj_guntarget.sprite_width * 0.5)))
                instance_destroy();
            
            break;
        
        case 2:
            x -= deltaPos;
            
            if (x < (obj_guntarget.x - (obj_guntarget.sprite_width * 0.5)))
                instance_destroy();
            
            break;
        
        case 0:
            y -= deltaPos;
            
            if (y < obj_guntarget.y)
                instance_destroy();
            
            break;
        
        case 1:
            y += deltaPos;
            
            if (y > (obj_guntarget.y + obj_guntarget.sprite_height))
                instance_destroy();
            
            break;
    }
}
else
{
    selectorIndexCalc += 0.4;
    
    if (selectorIndexCalc & 1)
        image_index = 1;
    else
        image_index = 0;
    
    if (selectorIndexCalc >= 76)
        selectorIndexCalc = 0;
}
