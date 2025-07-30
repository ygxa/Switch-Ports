if (global.hotsaving)
    exit;

if (state == (0 << 0))
{
    ini_open(saveto);
    ini_write_real("generalinfo", "rm", room);
    ini_write_real("generalinfo", "length", i);
    ini_write_string("generalinfo", "p1char", global.player1);
    ini_write_string("generalinfo", "p2char", global.player2);
    ini_write_real("generalinfo", "p1pal", global.palp1);
    ini_write_real("generalinfo", "p2pal", global.palp2);
    
    for (var l = 0; l < i; l++)
    {
        var num = string(l);
        
        for (var m = 0; m < array_length(p1mem[l]); m++)
        {
            if (p1mem[l][m][0] != 0)
                ini_write_real("frame" + num, "obj" + string(m) + "x", p1mem[l][m][0]);
            
            if (p1mem[l][m][1] != 0)
                ini_write_real("frame" + num, "obj" + string(m) + "y", p1mem[l][m][1]);
            
            if (p1mem[l][m][2] != "<undefined>")
                ini_write_string("frame" + num, "obj" + string(m) + "spr", p1mem[l][m][2]);
            
            if (p1mem[l][m][3] != 0)
                ini_write_real("frame" + num, "obj" + string(m) + "img", p1mem[l][m][3]);
            
            if (p1mem[l][m][4] != 1)
                ini_write_real("frame" + num, "obj" + string(m) + "xsc", p1mem[l][m][4]);
            
            if (p1mem[l][m][5] != 1)
                ini_write_real("frame" + num, "obj" + string(m) + "ysc", p1mem[l][m][5]);
            
            ini_write_string("frame" + num, "obj" + string(m) + "name", p1mem[l][m][6]);
            
            if (p1mem[l][m][7] != 1)
                ini_write_real("frame" + num, "obj" + string(m) + "vis", p1mem[l][m][7]);
            
            if (p1mem[l][m][8] != 1)
                ini_write_real("frame" + num, "obj" + string(m) + "alpha", p1mem[l][m][8]);
            
            if (p1mem[l][m][9] != 0)
                ini_write_real("frame" + num, "obj" + string(m) + "angle", p1mem[l][m][9]);
            
            if (p1mem[l][m][10] != 0)
                ini_write_real("frame" + num, "obj" + string(m) + "depth", p1mem[l][m][10]);
        }
        
        for (var n = 0; n < array_length(p2mem[l]); n++)
        {
            var sound_name = p2mem[l][n][0];
            var volume = p2mem[l][n][1];
            var pitch = p2mem[l][n][2];
            var position = p2mem[l][n][3];
            
            if (sound_name != "")
                ini_write_string("frame" + num, "sound" + string(n) + "name", sound_name);
            
            if (volume != 1)
                ini_write_real("frame" + num, "sound" + string(n) + "volume", volume);
            
            if (pitch != 1)
                ini_write_real("frame" + num, "sound" + string(n) + "pitch", pitch);
        }
        
        for (var n = 0; n < array_length(p3mem[l]); n++)
        {
            var shake = p3mem[l][n][0];
            ini_write_real("frame" + num, "camerashake", shake);
            ini_write_real("frame" + num, "p1health", shake);
            ini_write_real("frame" + num, "p2health", shake);
        }
    }
    
    ini_close();
    instance_destroy();
    instance_create_depth(x, y, -400, obj_tape);
}

if (state != (1 << 0))
    instance_destroy();
