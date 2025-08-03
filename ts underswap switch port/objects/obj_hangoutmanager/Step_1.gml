if (writer != -4 && instance_exists(writer))
{
    if (!writer.isDone)
    {
        if (canSkip)
        {
            writer.allowCToSkip = allowCToSkip;
            writer.doSkip(nextLine);
        }
        
        nextLine = false;
    }
    else
    {
        nextLine = true;
        
        if (choice)
        {
            if (choiceBuffer > -10)
                choiceBuffer--;
            
            var prevChoice = choiceSelection;
            
            if (choice == 1)
            {
                if (choiceSelection == -1)
                {
                    if (global.control_left_pressed)
                        choiceSelection = 0;
                    else if (global.control_right_pressed)
                        choiceSelection = 1;
                }
                else if (global.control_right_pressed || global.control_left_pressed)
                {
                    choiceSelection = !choiceSelection;
                }
            }
            else if (choice == 2)
            {
                if (global.control_right_pressed)
                    choiceSelection = 2;
                else if (global.control_down_pressed)
                    choiceSelection = 1;
                else if (global.control_left_pressed)
                    choiceSelection = 0;
            }
            else if (global.control_right_pressed)
            {
                choiceSelection = 2;
            }
            else if (global.control_down_pressed)
            {
                choiceSelection = 1;
            }
            else if (global.control_left_pressed)
            {
                choiceSelection = 0;
            }
            else if (global.control_up_pressed)
            {
                choiceSelection = 3;
            }
            
            if (prevChoice != choiceSelection)
                sfx_play(snd_squeak);
        }
        
        if (global.control_confirm_pressed || (choice == 0 && (global.insta_stop_next_line || (global.ctoskip && global.control_menu))))
        {
            global.insta_stop_next_line = false;
            
            if (choice != 0)
            {
                if (choiceSelection != -1 && choiceBuffer <= 0)
                {
                    with (writer)
                        instance_destroy();
                    
                    writer = -4;
                    
                    try
                    {
                        dx_instance_select_choice(global.dxinst, choiceSelection);
                    }
                    catch (ex)
                    {
                        debug_error(ex);
                    }
                    
                    choice = 0;
                    choiceBuffer = 3;
                    scene_resume();
                }
            }
            else
            {
                with (writer)
                    instance_destroy();
                
                writer = -4;
                scene_resume();
            }
        }
    }
}
