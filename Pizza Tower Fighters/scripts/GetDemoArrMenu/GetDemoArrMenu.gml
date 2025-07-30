function GetDemoArrMenu(argument0, argument1)
{
    ini_open(argument0);
    var _length = ini_read_real("generalinfo", "length", 0);
    var rm = ini_read_real("generalinfo", "rm", -4);
    
    with (argument1)
    {
        p1mem = [];
        p2mem = [];
        
        for (var i = 0; i < _length; i++)
        {
            var frame_objs = [];
            var frame_sounds = [];
            var objs = 0;
            
            while (ini_key_exists("frame" + string(i), "obj" + string(objs) + "x"))
                objs++;
            
            for (var obj_index = 0; obj_index < objs; obj_index++)
            {
                var _x = ini_read_real("frame" + string(i), "obj" + string(obj_index) + "x", 0);
                var _y = ini_read_real("frame" + string(i), "obj" + string(obj_index) + "y", 0);
                var spr = ini_read_string("frame" + string(i), "obj" + string(obj_index) + "spr", "<undefined>");
                var img = ini_read_real("frame" + string(i), "obj" + string(obj_index) + "img", 0);
                var xsc = ini_read_real("frame" + string(i), "obj" + string(obj_index) + "xsc", 1);
                var ysc = ini_read_real("frame" + string(i), "obj" + string(obj_index) + "ysc", 1);
                var name = ini_read_string("frame" + string(i), "obj" + string(obj_index) + "name", "");
                var vis = ini_read_real("frame" + string(i), "obj" + string(obj_index) + "vis", 1);
                var alpha = ini_read_real("frame" + string(i), "obj" + string(obj_index) + "alpha", 1);
                var angle = ini_read_real("frame" + string(i), "obj" + string(obj_index) + "angle", 0);
                array_push(frame_objs, [_x, _y, spr, img, xsc, ysc, name, vis, alpha, angle]);
            }
            
            array_push(p1mem, frame_objs);
            array_push(p2mem, frame_sounds);
        }
        
        length = _length;
        
        if (array_length(p1mem) > 0)
            alarm[2] = 2000;
    }
    
    ini_close();
}
