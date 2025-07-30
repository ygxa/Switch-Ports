function GetDemoArr(argument0, argument1)
{
    ini_open(argument0);
    var _length = ini_read_real("generalinfo", "length", 0);
    var rm = ini_read_real("generalinfo", "rm", -4);
    var _p1char = ini_read_string("generalinfo", "p1char", "PS");
    var _p2char = ini_read_string("generalinfo", "p2char", "PS");
    var _p1pal = ini_read_real("generalinfo", "p1pal", 0);
    var _p2pal = ini_read_real("generalinfo", "p2pal", 0);
    
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
                var str = "obj" + string(obj_index);
                var _x = ini_read_real("frame" + string(i), str + "x", 0);
                var _y = ini_read_real("frame" + string(i), str + "y", 0);
                var spr = ini_read_string("frame" + string(i), str + "spr", "<undefined>");
                var img = ini_read_real("frame" + string(i), str + "img", 0);
                var xsc = ini_read_real("frame" + string(i), str + "xsc", 1);
                var ysc = ini_read_real("frame" + string(i), str + "ysc", 1);
                var name = ini_read_string("frame" + string(i), str + "name", "");
                var vis = ini_read_real("frame" + string(i), str + "vis", 1);
                var alpha = ini_read_real("frame" + string(i), str + "alpha", 1);
                var angle = ini_read_real("frame" + string(i), str + "angle", 0);
                var _depth = ini_read_real("frame" + string(i), str + "depth", 0);
                array_push(frame_objs, [_x, _y, spr, img, xsc, ysc, name, vis, alpha, angle, _depth]);
            }
            
            var sounds = 0;
            
            while (ini_key_exists("frame" + string(i), "sound" + string(sounds) + "name"))
                sounds++;
            
            for (var sound_index = 0; sound_index < sounds; sound_index++)
            {
                var sound_name = ini_read_string("frame" + string(i), "sound" + string(sound_index) + "name", "");
                var volume = ini_read_real("frame" + string(i), "sound" + string(sound_index) + "volume", 1);
                var pitch = ini_read_real("frame" + string(i), "sound" + string(sound_index) + "pitch", 1);
                var position = ini_read_real("frame" + string(i), "sound" + string(sound_index) + "position", 0);
                array_push(frame_sounds, [sound_name, volume, pitch, position]);
            }
            
            array_push(p1mem, frame_objs);
            array_push(p2mem, frame_sounds);
        }
        
        p1char = _p1char;
        p2char = _p2char;
        p1pal = _p1pal;
        p2pal = _p2pal;
        length = _length;
        
        if (array_length(p1mem) > 0)
        {
            state = (1 << 0);
            room_goto(rm);
        }
    }
    
    ini_close();
}
