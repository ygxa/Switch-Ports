function exec_command(argument0)
{
    failed = false;
    
    switch (argument0[0])
    {
        case "room_goto":
            if (array_length(argument0) > 1)
            {
                if (room_exists(asset_get_index(argument0[1])))
                {
                    var rm = asset_get_index(argument0[1]);
                    show_debug_message(rm);
                    room_goto(rm);
                }
                else
                {
                    failed = true;
                }
            }
            else
            {
                failed = true;
            }
            
            break;
        
        case "enter_history":
            var outputstr = argument0[1];
            
            if (array_length(argument0) > 2)
            {
                for (var l = 2; l < array_length(argument0); l++)
                    outputstr += string_concat(" ", argument0[l]);
            }
            else
            {
                outputstr = argument0[1];
            }
            
            failed = 3;
            array_push(history, [outputstr, 2]);
            lerpto += 20;
            break;
        
        case "instance_create":
            if (array_length(argument0) >= 4)
            {
                if (object_exists(asset_get_index(argument0[4])))
                {
                    var obj = asset_get_index(argument0[4]);
                    show_debug_message(obj);
                    instance_create_depth(real(argument0[1]), real(argument0[2]), real(argument0[3]), obj);
                }
                else
                {
                    failed = true;
                }
            }
            else
            {
                failed = true;
            }
            
            break;
        
        case "endround":
            array_push(history, ["here u go, bitch.", 2]);
            room_goto(R_Win);
            Player2live = 0;
            lerpto += 20;
            break;
        
        case "set_lives":
            if (array_length(argument0) > 2)
            {
                var num = argument0[1];
                var pla = argument0[2];
                
                if (pla == 1)
                    ObjGame.Player1live = num;
                else
                    ObjGame.Player2live = num;
            }
            else
            {
                failed = true;
            }
            
            break;
        
        case "demrec_menu":
            audio_stop_all();
            audio_play_sound(Space_Jazz, 0, 1);
            room_goto(R_Demrecmenu);
        
        case "demrec":
            if (array_length(argument0) > 1)
            {
                var str = "";
                
                for (var i = 1; i < array_length(argument0); i++)
                {
                    str += (argument0[i] + " ");
                    var file = str;
                    
                    with (instance_create_depth(x, y, -999, o_demrec))
                    {
                        state = (0 << 0);
                        saveto = file;
                        p1mem = [[]];
                        p2mem = [];
                        p3mem = [];
                    }
                    
                    array_push(history, ["started recording, keep in mind that the file saves when the recording is stopped", 2]);
                    lerpto += 20;
                }
            }
            else
            {
                failed = true;
            }
            
            break;
        
        case "demrec_load":
            if (array_length(argument0) > 1)
            {
                var file = argument0[1];
                
                with (instance_create_depth(0, 0, -999, o_demrec))
                {
                    state = (2 << 0);
                    instance_create_depth(0, 0, -9999, o_demrecsloading);
                    audio_stop_all();
                    GetDemoArr(file, id);
                }
            }
            else
            {
                failed = true;
            }
            
            break;
        
        case "game_restart":
            game_restart();
            break;
        
        default:
            failed = true;
            break;
        
        case "superfill":
            if (array_length(argument0) > 1)
            {
                var pla = argument0[1];
                
                if (pla == 1)
                    O_Player_1.damagemeter = O_Player_1.damagemetermax;
                else
                    O_Player_2.damagemeter = O_Player_2.damagemetermax;
            }
            else
            {
                failed = true;
            }
            
            break;
        
        case "sheen_mode":
            global.player1 = "sheen";
            break;
        
        case "changearcadescore":
            if (array_length(argument0) > 1)
                global.TOTALSCORE = argument0[1];
            
            break;
        
        case "koffconsole":
            if (array_length(argument0) > 1)
                global.koffconsole = argument0[1];
            
            break;
    }
}
