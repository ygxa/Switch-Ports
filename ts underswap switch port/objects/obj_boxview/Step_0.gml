if (buffer > 0)
    buffer--;

if (buffer == 0 && global.control_cancel_pressed)
{
    obj_overworldmenu.updateVars();
    global.canmove = true;
    instance_destroy();
    exit;
}

var boxInv = ds_map_find_value(global.flags, flag);
var boxSize = array_length(boxInv);

switch (section)
{
    case 0:
        if (global.control_left_pressed || global.control_right_pressed)
        {
            sfx_play(snd_squeak);
            inventory = !inventory;
        }
        
        if (global.control_down_pressed || global.control_confirm_pressed)
        {
            sfx_play(snd_squeak);
            section = 1;
            sel = 0;
            break;
        }
        
        if (global.control_up_pressed)
        {
            sfx_play(snd_squeak);
            section = 1;
            sel = 7;
            break;
        }
        
        if (global.control_menu_pressed)
        {
            sfx_play(snd_squeak);
            section = 2;
            sel = 0;
            break;
        }
        
        break;
    
    case 1:
        if (global.control_down_pressed)
        {
            sfx_play(snd_squeak);
            sel++;
            
            if (sel > 7)
            {
                section = 0;
                sel = 0;
                break;
            }
        }
        
        if (global.control_up_pressed)
        {
            sfx_play(snd_squeak);
            sel--;
            
            if (sel < 0)
            {
                section = 0;
                sel = 0;
                break;
            }
        }
        
        if (global.control_right_pressed)
        {
            sfx_play(snd_squeak);
            section = 2;
            sel++;
            break;
        }
        
        if (global.control_confirm_pressed)
        {
            if (inventory == 0 && sel >= ds_list_size(global.inv_item))
                break;
            else if (inventory == 1 && sel >= ds_list_size(global.inv_tool))
                break;
            
            if (boxSize < 10)
            {
                if (inventory == 1)
                {
                    var itemId = ds_list_find_value(global.inv_tool, sel);
                    
                    if (itemId == 35)
                    {
                        if (!audio_is_playing(snd_error))
                            sfx_play(snd_error);
                        
                        break;
                    }
                    
                    boxInv[boxSize] = itemId;
                    items_remove_tool(sel);
                }
                else
                {
                    boxInv[boxSize] = ds_list_find_value(global.inv_item, sel);
                    items_remove_normal(sel);
                }
                
                ds_map_set(global.flags, flag, boxInv);
                
                if (!audio_is_playing(snd_swallow))
                    sfx_play_pitch(snd_swallow, 1.2);
            }
            else if (!audio_is_playing(snd_error))
            {
                sfx_play(snd_error);
            }
        }
        
        if (global.control_menu_pressed)
        {
            sfx_play(snd_squeak);
            section = 2;
            sel = 0;
            break;
        }
        
        break;
    
    case 2:
        if (global.control_down_pressed)
        {
            if (sel < 9)
            {
                sfx_play(snd_squeak);
                sel++;
            }
        }
        
        if (global.control_up_pressed)
        {
            if (sel > 0)
            {
                sfx_play(snd_squeak);
                sel--;
            }
        }
        
        if (global.control_left_pressed)
        {
            sfx_play(snd_squeak);
            section = 1;
            sel--;
            
            if (sel < 0)
                sel = 0;
            else if (sel > 7)
                sel = 7;
            
            break;
        }
        
        if (global.control_confirm_pressed)
        {
            if (sel >= boxSize)
                break;
            
            var item = boxInv[sel];
            var itemStruct = ds_map_find_value(global.items, item);
            
            if (!is_undefined(itemStruct))
            {
                switch (itemStruct.type)
                {
                    case 0:
                    case 1:
                        inventory = 0;
                        break;
                    
                    case 2:
                    case 3:
                        inventory = 1;
                        break;
                }
            }
            
            if (items_add(item))
            {
                boxSize--;
                
                for (var i = sel; i < boxSize; i++)
                    boxInv[i] = boxInv[i + 1];
                
                array_resize(boxInv, boxSize);
                ds_map_set(global.flags, flag, boxInv);
                
                if (!audio_is_playing(snd_swallow))
                    sfx_play_pitch(snd_swallow, 1.2);
            }
            else if (!audio_is_playing(snd_error))
            {
                sfx_play(snd_error);
            }
        }
        
        if (global.control_menu_pressed)
        {
            sfx_play(snd_squeak);
            section = 1;
            sel = 0;
            break;
        }
        
        break;
}
