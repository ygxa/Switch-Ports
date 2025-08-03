switch (stage)
{
    case 0:
        counter++;
        
        if (counter >= 20)
        {
            counter = 0;
            stage = 1;
        }
        
        break;
    
    case 1:
        counter++;
        x += (side * 1.5);
        
        if (counter >= 20)
        {
            stage = 2;
            counter = 0;
            sfx_play(snd_bark);
            sfx_play(snd_bark2);
            image_index = 1;
        }
        
        break;
    
    case 2:
        counter++;
        
        if (counter >= 10)
        {
            image_index = 0;
            stage = 3;
            counter = 0;
        }
        
        break;
    
    case 3:
        x -= (side * accel);
        
        if (accel < 8)
            accel += 0.1;
        
        counter++;
        
        if (counter >= 11)
        {
            counter = 0;
            image_index = 1;
            stage = 4;
        }
        
        break;
    
    case 4:
        x -= (side * accel);
        
        if (accel > 4)
            accel -= 0.1;
        
        y -= 5;
        
        if (abs(x - ((obj_battlemanager.boxX1 + obj_battlemanager.boxX2) / 2)) <= 20)
        {
            if (side == 1)
                bt_bullet(obj_dogi_jump_heart);
            
            instance_destroy();
        }
        
        break;
}
