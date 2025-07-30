ini_open(saveto);

if (state == (0 << 0) && !ini_section_exists("generalinfo") && global.hotsaving)
{
    ini_write_real("generalinfo", "rm", room);
    ini_write_string("generalinfo", "p1char", global.player1);
    ini_write_string("generalinfo", "p2char", global.player2);
    ini_write_real("generalinfo", "p1pal", global.palp1);
    ini_write_real("generalinfo", "p2pal", global.palp2);
}

ini_close();

if (keyboard_check_pressed(ord("Z")))
{
    if (state == (1 << 0))
    {
        audio_pause_all();
        state = (2 << 0);
        
        with (o_demrecdoll)
            alarm[0] = -1;
    }
    else if (state == (2 << 0))
    {
        audio_resume_all();
        state = (1 << 0);
        
        with (o_demrecdoll)
            alarm[0] = 1;
    }
}

if (state == (0 << 0))
{
    array_resize(p1mem, i + 1);
    array_resize(p2mem, i + 1);
    array_resize(p3mem, i + 1);
    
    if (!is_array(p1mem[i]))
        p1mem[i] = [];
    
    if (!is_array(p2mem[i]))
        p2mem[i] = [];
    
    if (!is_array(p3mem[i]))
        p3mem[i] = [];
    
    with (all)
    {
        if (object_get_parent(self.object_index) != o_parentwall && object_index != o_slope && object_index != o_camera2 && object_index != o_maker2 && object_index != o_marker && object_index != o_bgparallex && sprite_index != s_respawner_notalive && object_index != ObjGame && !persistent && visible)
            array_push(other.p1mem[other.i], [x, y, sprite_get_name(sprite_index), image_index, image_xscale, image_yscale, object_get_name(self.object_index), visible, image_alpha, image_angle, depth]);
    }
    
    var current_sounds = audio_get_playing();
    
    for (var sound = 0; sound < array_length(current_sounds); sound++)
    {
        var sound_id = current_sounds[sound];
        var sound_name = audio_get_name(sound_id);
        var volume = audio_sound_get_gain(sound_id);
        var pitch = audio_sound_get_pitch(sound_id);
        var position = audio_sound_get_track_position(sound_id);
        array_push(p2mem[i], [sound_name, volume, pitch, position]);
    }
    
    var p3arr = [];
    array_push(p3arr, [o_camera2.shake_remain]);
    array_push(p3arr, [o_camera2.shake_remain]);
    array_push(p3mem, p3arr);
    ini_open(saveto);
    
    if (global.hotsaving)
    {
        var num = string(i);
        ini_write_real("generalinfo", "length", i);
        
        for (var m = 0; m < array_length(p1mem[i]); m++)
        {
            if (p1mem[i][m][0] != 0)
                ini_write_real("frame" + num, "obj" + string(m) + "x", p1mem[i][m][0]);
            
            if (p1mem[i][m][1] != 0)
                ini_write_real("frame" + num, "obj" + string(m) + "y", p1mem[i][m][1]);
            
            if (p1mem[i][m][2] != "<undefined>")
                ini_write_string("frame" + num, "obj" + string(m) + "spr", p1mem[i][m][2]);
            
            if (p1mem[i][m][3] != 0)
                ini_write_real("frame" + num, "obj" + string(m) + "img", p1mem[i][m][3]);
            
            if (p1mem[i][m][4] != 1)
                ini_write_real("frame" + num, "obj" + string(m) + "xsc", p1mem[i][m][4]);
            
            if (p1mem[i][m][5] != 1)
                ini_write_real("frame" + num, "obj" + string(m) + "ysc", p1mem[i][m][5]);
            
            ini_write_string("frame" + num, "obj" + string(m) + "name", p1mem[i][m][6]);
            
            if (p1mem[i][m][7] != 1)
                ini_write_real("frame" + num, "obj" + string(m) + "vis", p1mem[i][m][7]);
            
            if (p1mem[i][m][8] != 1)
                ini_write_real("frame" + num, "obj" + string(m) + "alpha", p1mem[i][m][8]);
            
            if (p1mem[i][m][9] != 0)
                ini_write_real("frame" + num, "obj" + string(m) + "angle", p1mem[i][m][9]);
            
            if (p1mem[i][m][10] != 0)
                ini_write_real("frame" + num, "obj" + string(m) + "depth", p1mem[i][m][10]);
        }
        
        for (var n = 0; n < array_length(p2mem[i]); n++)
        {
            var sound_name = p2mem[i][n][0];
            var volume = p2mem[i][n][1];
            var pitch = p2mem[i][n][2];
            var position = p2mem[i][n][3];
            
            if (sound_name != "")
                ini_write_string("frame" + num, "sound" + string(n) + "name", sound_name);
            
            if (volume != 1)
                ini_write_real("frame" + num, "sound" + string(n) + "volume", volume);
            
            if (pitch != 1)
                ini_write_real("frame" + num, "sound" + string(n) + "pitch", pitch);
            
            if (position != 0)
                ini_write_real("frame" + num, "sound" + string(n) + "pitch", position);
        }
        
        ini_close();
    }
    
    i++;
    alarm[0] = 2;
}
else if (state == (1 << 0))
{
    audio_stop_sound(mu_results);
    
    if (i == length)
    {
        alarm[1] = 120;
        state = (2 << 0);
        return 0;
    }
    
    var num = i;
    
    for (var m = 0; m < array_length(p1mem[num]); m++)
    {
        var xto = p1mem[num][m][0];
        var yto = p1mem[num][m][1];
        var spr = asset_get_index(p1mem[num][m][2]);
        
        if (spr == -1)
            spr = placeholderspr;
        
        var img = p1mem[num][m][3];
        var xsc = p1mem[num][m][4];
        var ysc = p1mem[num][m][5];
        var name = p1mem[num][m][6];
        var vis = p1mem[num][m][7];
        
        if (spr == placeholderspr)
            vis = false;
        
        var alpha = p1mem[num][m][8];
        var angle = p1mem[num][m][9];
        var dpth = p1mem[num][m][10];
        var dollid = instance_create_depth(xto, yto, depth, o_demrecdoll);
        
        with (dollid)
        {
            visible = vis;
            image_angle = angle;
            image_alpha = alpha;
            image_speed = 0;
            sprite_index = spr;
            image_index = img;
            image_xscale = xsc;
            image_yscale = ysc;
            depth = dpth;
        }
        
        if (name == "o_player_doise" || name == "o_player_fakepep" || name == "o_player_noise" || name == "o_player_default" || name == "o_player_vigilante")
        {
            with (o_camera2)
                player1 = dollid;
            
            with (dollid)
            {
                usepal = true;
                palselect = other.p1pal;
                
                switch (name)
                {
                    case "o_player_doise":
                        palspr = s_pal_doi;
                        break;
                    
                    case "o_player_fakepep":
                        palspr = s_pal_fakepep;
                        break;
                    
                    case "o_player_noise":
                        palspr = s_pal_noi;
                        break;
                    
                    case "o_player_default":
                        palspr = s_pal_pep;
                        break;
                    
                    case "o_player_vigilante":
                        palspr = s_pal_vigi;
                        break;
                }
            }
        }
        
        if (name == "o_player_doise2" || name == "o_player_fakepep2" || name == "o_player_noise2" || name == "o_player_default2" || name == "o_player_vigilante2")
        {
            with (o_camera2)
                player2 = dollid;
            
            with (dollid)
            {
                usepal = true;
                palselect = other.p2pal;
                
                switch (name)
                {
                    case "o_player_doise2":
                        palspr = s_pal_doi;
                        break;
                    
                    case "o_player_fakepep2":
                        palspr = s_pal_fakepep;
                        break;
                    
                    case "o_player_noise2":
                        palspr = s_pal_noi;
                        break;
                    
                    case "o_player_default2":
                        palspr = s_pal_pep;
                        break;
                    
                    case "o_player_vigilante2":
                        palspr = s_pal_vigi;
                        break;
                }
            }
        }
    }
    
    var current_sounds = audio_get_playing();
    var playing_sounds = [];
    
    for (var s = 0; s < array_length(p2mem[num]); s++)
    {
        var sound_data = p2mem[num][s];
        var sound_name = sound_data[0];
        var volume = sound_data[1];
        var pitch = sound_data[2];
        var position = sound_data[3];
        var sound_id = asset_get_index(sound_name);
        var already_playing = false;
        
        for (var cs = 0; cs < array_length(current_sounds); cs++)
        {
            if (current_sounds[cs] == sound_id)
            {
                already_playing = true;
                break;
            }
        }
        
        if (!already_playing)
        {
            audio_play_sound(sound_id, 0, 0);
            
            if (is_real(position))
                audio_sound_set_track_position(sound_id, position);
        }
        
        audio_sound_gain(sound_id, volume, 0);
        audio_sound_pitch(sound_id, pitch);
        array_push(playing_sounds, sound_id);
    }
    
    for (var cs = 0; cs < array_length(current_sounds); cs++)
    {
        var cs_id = current_sounds[cs];
        var should_stop = true;
        
        for (var ps = 0; ps < array_length(playing_sounds); ps++)
        {
            if (playing_sounds[ps] == cs_id)
            {
                should_stop = false;
                break;
            }
        }
        
        if (should_stop)
            audio_stop_sound(cs_id);
    }
    
    i++;
    alarm[0] = 2;
}
else
{
    alarm[0] = 1;
}
