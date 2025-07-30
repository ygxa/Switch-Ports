function Scr_Tutorial_Messages()
{
    switch (phase)
    {
        case 1:
            target = 2;
            timertillnext = 90;
            msg = [["Welcome back, you're just as ugly as I remember!", "Pizza Granny", S_MonoeText], ["I'm sure you already know, but incase you've forgotten,\nuse the arrow keys to move.", "Pizza Granny", S_MonoeText], ["Go ahead! I'm waiting.", "Pizza Granny", S_MonoeText]];
            
            if (!instance_exists(O_Text))
            {
                var _tb = instance_create_layer(0, 0, "Instances", O_Text);
                var _list = _tb.messages;
                
                for (var i = 0; i < array_length(msg); i++)
                {
                    var _arr = msg[i];
                    ds_list_add(_list, _arr);
                }
            }
            
            break;
        
        case 2:
            target = 1;
            timertillnext = 60;
            timerobjective = 90;
            targetA = 0;
            msg = [["You can jump twice. Just thought I'd let you know.", "Pizza Granny", S_MonoeText], ["And if walking is too slow for you, you can sprint instead!", "Pizza Granny", S_MonoeText], ["Double tap the movement keys to start sprinting.", "Pizza Granny", S_MonoeText], ["Run around for 3 Seconds!", "Pizza Granny", S_MonoeText]];
            
            if (!instance_exists(O_Text))
            {
                var _tb = instance_create_layer(0, 0, "Instances", O_Text);
                var _list = _tb.messages;
                
                for (var i = 0; i < array_length(msg); i++)
                {
                    var _arr = msg[i];
                    ds_list_add(_list, _arr);
                }
            }
            
            break;
        
        case 3:
            target = 1;
            audio_stop_sound(su_pep_dash);
            timertillnext = 90;
            timerobjective = 150;
            targetA = 0;
            msg = [["You can also crouch if you so wish by holding down!", "Pizza Granny", S_MonoeText], ["This could potentially save you from a stray bullet every once in a while.", "Pizza Granny", S_MonoeText], ["Now smell the floor for 5 seconds. Do it, I'll give you a mint.", "Pizza Granny", S_MonoeText]];
            
            if (!instance_exists(O_Text))
            {
                var _tb = instance_create_layer(0, 0, "Instances", O_Text);
                var _list = _tb.messages;
                
                for (var i = 0; i < array_length(msg); i++)
                {
                    var _arr = msg[i];
                    ds_list_add(_list, _arr);
                }
            }
            
            break;
        
        case 4:
            target = 3;
            timertillnext = 90;
            targetA = 0;
            targetB = 0;
            targetC = 0;
            msg = [["Lovely. Simply delightful!", "Pizza Granny", S_MonoeText], ["It's time to learn how to attack.", "Pizza Granny", S_MonoeText], ["To attack, press X. Use the arrow keys to choose what direction \nyou'll attack.", "Pizza Granny", S_MonoeText], ["For example, Pressing up and attacking at the same time \nlets you perform an up tilt.", "Pizza Granny", S_MonoeText], ["Do a few moves, fat man!", "Pizza Granny", S_MonoeText]];
            
            if (!instance_exists(O_Text))
            {
                var _tb = instance_create_layer(0, 0, "Instances", O_Text);
                var _list = _tb.messages;
                
                for (var i = 0; i < array_length(msg); i++)
                {
                    var _arr = msg[i];
                    ds_list_add(_list, _arr);
                }
            }
            
            break;
        
        case 5:
            target = 3;
            timertillnext = 60;
            targetA = 0;
            targetB = 0;
            targetC = 0;
            msg = [["Great!", "Pizza Granny", S_MonoeText], ["Now let's talk about aerials.", "Pizza Granny", S_MonoeText], ["To perform an aerial, Jump then just do the same thing \nyou do on the ground!", "Pizza Granny", S_MonoeText], ["Perform the three aerials listed!", "Pizza Granny", S_MonoeText]];
            
            if (!instance_exists(O_Text))
            {
                var _tb = instance_create_layer(0, 0, "Instances", O_Text);
                var _list = _tb.messages;
                
                for (var i = 0; i < array_length(msg); i++)
                {
                    var _arr = msg[i];
                    ds_list_add(_list, _arr);
                }
            }
            
            break;
        
        case 6:
            target = 1;
            timertillnext = 60;
            targetA = 0;
            targetB = 0;
            targetC = 0;
            msg = [["Your Side Aerial is a great movement tool.", "Pizza Granny", S_MonoeText], ["Use it to get back onto the stage.", "Pizza Granny", S_MonoeText], ["When running, you can preform a dash attack by pressing X.", "Pizza Granny", S_MonoeText], ["Try it out!", "Pizza Granny", S_MonoeText]];
            
            if (!instance_exists(O_Text))
            {
                var _tb = instance_create_layer(0, 0, "Instances", O_Text);
                var _list = _tb.messages;
                
                for (var i = 0; i < array_length(msg); i++)
                {
                    var _arr = msg[i];
                    ds_list_add(_list, _arr);
                }
            }
            
            break;
        
        case 7:
            target = 3;
            timertillnext = 60;
            targetA = 0;
            targetB = 0;
            targetC = 0;
            msg = [["Let's talk about special moves. These are done by pressing the C key.", "Pizza Granny", S_MonoeText], ["The Up Special is always a recovery tool you can use to get back \nonto the stage when knocked off.", "Pizza Granny", S_MonoeText], ["Your up special is an uppercut that deals good damage.", "Pizza Granny", S_MonoeText], ["Go ahead and try out all of your specials!", "Pizza Granny", S_MonoeText]];
            
            if (!instance_exists(O_Text))
            {
                var _tb = instance_create_layer(0, 0, "Instances", O_Text);
                var _list = _tb.messages;
                
                for (var i = 0; i < array_length(msg); i++)
                {
                    var _arr = msg[i];
                    ds_list_add(_list, _arr);
                }
            }
            
            break;
        
        case 8:
            target = 1;
            timertillnext = 120;
            
            if (!instance_exists(o_cheeseslime))
            {
                instance_create_layer(o_spawn.x, o_spawn.y, layer, o_cheeseslime);
                
                with (o_spawn)
                    spriter = 1;
            }
            
            targetA = 0;
            msg = [["Your Down special is a great way to end off a long combo.", "Pizza Granny", S_MonoeText], ["Let's get a cheese slime in here that you can try to juggle. \nDon't worry. It won't bite.", "Pizza Granny", S_MonoeText], ["Knock it around and get a combo of 5.", "Pizza Granny", S_MonoeText]];
            
            if (!instance_exists(O_Text))
            {
                var _tb = instance_create_layer(0, 0, "Instances", O_Text);
                var _list = _tb.messages;
                
                for (var i = 0; i < array_length(msg); i++)
                {
                    var _arr = msg[i];
                    ds_list_add(_list, _arr);
                }
            }
            
            break;
        
        case 9:
            target = 1;
            timertillnext = 90;
            targetA = 0;
            msg = [["That was great!", "Pizza Granny", S_MonoeText], ["Let's piss the slime off. You can taunt by pressing V.", "Pizza Granny", S_MonoeText], ["Go on! Make it mad!", "Pizza Granny", S_MonoeText]];
            
            if (!instance_exists(O_Text))
            {
                var _tb = instance_create_layer(0, 0, "Instances", O_Text);
                var _list = _tb.messages;
                
                for (var i = 0; i < array_length(msg); i++)
                {
                    var _arr = msg[i];
                    ds_list_add(_list, _arr);
                }
            }
            
            break;
        
        case 10:
            target = 1;
            timertillnext = 60;
            targetA = 0;
            msg = [["Uh oh. You really made it mad.", "Pizza Granny", S_MonoeText], ["Luckily you can parry attacks!", "Pizza Granny", S_MonoeText], ["You need to taunt right as you are getting hit.\nThe window is brief but you'll get it after a while.", "Pizza Granny", S_MonoeText], ["Try to parry it's baseball bat! Don't worry if you don't get it on \nyour first try.", "Pizza Granny", S_MonoeText]];
            
            if (!instance_exists(O_Text))
            {
                var _tb = instance_create_layer(0, 0, "Instances", O_Text);
                var _list = _tb.messages;
                
                for (var i = 0; i < array_length(msg); i++)
                {
                    var _arr = msg[i];
                    ds_list_add(_list, _arr);
                }
            }
            
            break;
        
        case 11:
            target = 1;
            o_player_default.damagemeter = o_player_default.damagemetermax;
            timertillnext = 60;
            targetA = 0;
            msg = [["Parrying the opponent stuns them for a while!", "Pizza Granny", S_MonoeText], ["Finally, let's talk about your super!", "Pizza Granny", S_MonoeText], ["If the bar you fill by dealing damage becomes full, \nyou'll be able to perform a super using the Special Key. ", "Pizza Granny", S_MonoeText], ["I've filled your super meter. Try using it!", "Pizza Granny", S_MonoeText]];
            
            if (!instance_exists(O_Text))
            {
                var _tb = instance_create_layer(0, 0, "Instances", O_Text);
                var _list = _tb.messages;
                
                for (var i = 0; i < array_length(msg); i++)
                {
                    var _arr = msg[i];
                    ds_list_add(_list, _arr);
                }
            }
            
            break;
        
        case 12:
            target = 1;
            timertillnext = 60;
            targetA = 0;
            msg = [["Fantastic work!", "Pizza Granny", S_MonoeText], ["That's all you need to know to start playing the game. Have Fun!", "Pizza Granny", S_MonoeText]];
            
            if (!instance_exists(O_Text))
            {
                var _tb = instance_create_layer(0, 0, "Instances", O_Text);
                var _list = _tb.messages;
                
                for (var i = 0; i < array_length(msg); i++)
                {
                    var _arr = msg[i];
                    ds_list_add(_list, _arr);
                }
            }
            
            break;
    }
}
