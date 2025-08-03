switch (state)
{
    case (2 << 0):
        grav += 0.5;
        var active = array_create(4);
        var anyPartActive = false;
        
        for (var i = 0; i < 4; i++)
        {
            if ((y + party[i]) < 272)
            {
                active[i] = true;
                anyPartActive = true;
                party[i] += grav;
            }
            else
            {
                active[i] = false;
                party[i] = 272 - y;
            }
        }
        
        if (active[0])
        {
            partx[0] += 2;
            partrot[0] += 2;
        }
        
        if (active[1])
        {
            partx[1] += 4;
            partrot[1] += 5;
        }
        
        if (active[2])
        {
            partx[2]--;
            partrot[2] -= 3;
        }
        
        if (active[3])
        {
            partx[3] -= 3;
            partrot[3] -= 9;
        }
        
        if (!anyPartActive)
            state = (3 << 0);
        
        break;
    
    case (4 << 0):
        for (var i = 0; i < 4; i++)
        {
            partx[i] -= (partx[i] - normpartx[i]) / 6;
            party[i] -= (party[i] - normparty[i]) / 6;
            partrot[i] -= partrot[i] / 6;
        }
        
        step++;
        
        if (step > 30)
        {
            step = 0;
            state = (0 << 0);
        }
        
        break;
}

if (float)
    y = number_approach_smooth(y, 140, 0.15, 0.5);

switch (sceneState)
{
    case 1:
        if (state == (3 << 0))
        {
            if (deadCounter < ((stage == 0) ? 50 : 30))
            {
                if (deadCounter == 0)
                    obj_battletarget.doFade = true;
                
                deadCounter++;
            }
            else
            {
                deadCounter = 0;
                
                with (obj_battlemanager)
                {
                    mainState = (5 << 0);
                    textEndAutomatically = false;
                }
                
                if (stage == 0)
                {
                    state = (0 << 0);
                    dx_scene(didCriticalHit ? "battles.md.fighte_crit" : "battles.md.fighte_norm");
                }
                else
                {
                    dx_scene("battles.md.fight");
                    music_kill_current();
                }
                
                sceneState = 0;
            }
        }
        
        break;
    
    case 2:
        if (state == (0 << 0))
        {
            scene_resume();
            sceneState = 0;
        }
        
        break;
    
    case 3:
        if (!instance_exists(obj_battledamage))
        {
            dx_scene((stage == 0) ? "battles.md.fighte_miss" : "battles.md.fightmiss");
            sceneState = 0;
        }
        
        break;
    
    case 4:
        if (!obj_battlemanager.isBoxMoving)
        {
            instance_create(obj_md_knife);
            sceneState = 0;
        }
        
        break;
    
    case 5:
        if (x > (room_width + sprite_width))
        {
            with (obj_md_asg)
            {
                x = -138;
                state = 0;
                hspeed = 5;
                sprite_index = spr_asgface_aghast_still;
            }
            
            instance_destroy();
        }
        
        break;
}

if (global.flavor_sprites)
    image_blend = flavorColor;
