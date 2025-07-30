opening = true;
dooraccto = -7;
dooracc = 0;
opening = true;
closed = false;
fadedir = -1;
titleacc = -14;
room_goto(targetRoom);

if (global.Recorddemrec && targetRoom != R_Win)
{
    with (instance_create_depth(x, y, -1, o_waiter))
    {
        func = function()
        {
            with (obj_console)
                exec_command(["demrec", "Demos/" + string(current_year) + "-" + string(current_day) + "-" + string(current_hour) + " " + string(current_minute) + " " + string(current_second) + ".demrec"]);
        };
        
        alarm[0] = 5;
    }
}
