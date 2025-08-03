if (fade)
    exit;

event_inherited();

switch (global.bev_subtype)
{
    case 1:
        switch (stage)
        {
            case 0:
                handY -= 2;
                timer++;
                
                if (timer >= 10)
                {
                    timer = 0;
                    stage = 1;
                }
                
                break;
            
            case 1:
                if (accel < 8)
                    accel += 1;
                
                handY += accel;
                
                if (handY >= 16)
                {
                    handY = 16;
                    
                    with (instance_create(obj_boxshaker))
                        shakeValue = 2;
                    
                    sfx_play(snd_bang);
                    stage = 2;
                }
                
                break;
            
            case 2:
                switch (attackType)
                {
                    case 0:
                        if ((timer % 3) == 0)
                            bt_bullet(obj_stalactite_bul);
                        
                        break;
                    
                    case 1:
                        if ((timer % 3) == 0)
                            bt_bullet(obj_stalactite_bul, obj_battlemanager.boxX1 + 20 + ((timer / 20) * (obj_battlemanager.boxX2 - 20 - obj_battlemanager.boxX1)) + irandom_range(-10, 10));
                        
                        break;
                }
                
                timer++;
                
                if (timer >= 20)
                {
                    timer = 0;
                    stage = 3;
                }
                
                break;
            
            case 3:
                handY -= 3;
                
                if (handY <= 0)
                {
                    handY = 0;
                    stage = 4;
                }
                
                break;
            
            case 4:
                timer++;
                
                if (timer >= 10)
                {
                    timer = 0;
                    stage = 0;
                    pounds++;
                    
                    if (pounds >= 3)
                        stage = -1;
                }
                
                break;
        }
        
        break;
    
    case 2:
        obj_greaterdog_monster.visible = true;
        obj_battlemanager.boxTransform = false;
        fade = true;
        break;
}
