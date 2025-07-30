switch (type)
{
    case 0:
        sprite_index = spr_soundtest_button_left;
        
        onPress = function()
        {
            with (obj_soundtest)
            {
                position--;
                
                if (position < 0)
                    position = pos_last;
            }
        };
        
        break;
    
    case 1:
        sprite_index = spr_soundtest_button_pause;
        
        onPress = function()
        {
            with (obj_soundtest)
            {
                var mu = musicArr[position];
                
                if (mu.playing)
                    mu.pause();
                else
                    mu.play();
            }
        };
        
        break;
    
    case 2:
        sprite_index = spr_soundtest_button_right;
        
        onPress = function()
        {
            with (obj_soundtest)
            {
                position++;
                
                if (position > pos_last)
                    position = 0;
            }
        };
        
        break;
}
