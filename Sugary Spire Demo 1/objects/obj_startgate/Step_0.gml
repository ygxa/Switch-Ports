showtext = false;

if (distance_to_object(obj_player) < 50)
{
    showtext = true;
    
    switch (level)
    {
        default:
            with (obj_tv)
            {
                message = "";
                showtext = 1;
                alarm[0] = 2;
            }
            
            break;
        
        case "entryway":
            with (obj_tv)
            {
                message = "ENTRYWAY";
                showtext = 1;
                alarm[0] = 2;
            }
            
            break;
        
        case "tutorial":
            with (obj_tv)
            {
                message = "TUTORIAL";
                showtext = 1;
                alarm[0] = 2;
            }
            
            break;
        
        case "steamy":
            with (obj_tv)
            {
                message = "COTTONTOWN";
                showtext = 1;
                alarm[0] = 2;
            }
            
            break;
        
        case "unownsteamy":
            with (obj_tv)
            {
                message = "UNOWNTOWN";
                showtext = 1;
                alarm[0] = 2;
            }
            
            break;
        
        case "mines":
            with (obj_tv)
            {
                message = "SUGARSHACK MINES";
                showtext = 1;
                alarm[0] = 2;
            }
            
            break;
        
        case "molasses":
            with (obj_tv)
            {
                message = "MOLASSES SWAMP";
                showtext = 1;
                alarm[0] = 2;
            }
            
            break;
        
        case "timetrial":
            with (obj_tv)
            {
                message = "TIME TRIAL";
                showtext = 1;
                alarm[0] = 2;
            }
            
            break;
        
        case "fudge":
            with (obj_tv)
            {
                message = "MT FUDGETOP";
                showtext = 1;
                alarm[0] = 2;
            }
            
            break;
        
        case "dance":
            with (obj_tv)
            {
                message = "SEX";
                showtext = 1;
                alarm[0] = 2;
            }
            
            break;
        
        case "sucrose":
            with (obj_tv)
            {
                message = "SUCROSE SNOWSTORM";
                showtext = 1;
                alarm[0] = 2;
            }
            
            break;
        
        case "martian":
            with (obj_tv)
            {
                message = "MARTIAN FREEZER";
                showtext = 1;
                alarm[0] = 2;
            }
            
            break;
        
        case "mechanical":
            with (obj_tv)
            {
                message = "MECHANICAL MADNESS";
                showtext = 1;
                alarm[0] = 2;
            }
            
            break;
        
        case "stormy":
            with (obj_tv)
            {
                message = "COTTONSTORM";
                showtext = 1;
                alarm[0] = 2;
            }
            
            break;
    }
}
