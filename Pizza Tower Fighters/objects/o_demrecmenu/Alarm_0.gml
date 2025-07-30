if (state == (0 << 0))
{
    array_resize(p1mem, i + 1);
    array_resize(p2mem, i + 1);
    
    if (!is_array(p1mem[i]))
        p1mem[i] = [];
    
    if (!is_array(p2mem[i]))
        p2mem[i] = [];
    
    with (all)
    {
        if (object_get_parent(self.object_index) != o_parentwall && object_index != o_slope && !persistent)
            array_push(other.p1mem[other.i], [x, y, sprite_get_name(sprite_index), image_index, image_xscale, image_yscale, object_get_name(self.object_index), visible, image_alpha, image_angle]);
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
    
    i++;
    alarm[0] = 2;
}
else if (state == (1 << 0))
{
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
        }
        
        if (name == "o_player_doise" || name == "o_player_fakepep" || name == "o_player_noise" || name == "o_player_default" || name == "o_player_vigilante")
        {
            with (o_camera2)
                player1 = dollid;
        }
        
        if (name == "o_player_doise2" || name == "o_player_fakepep2" || name == "o_player_noise2" || name == "o_player_default2" || name == "o_player_vigilante2")
        {
            with (o_camera2)
                player2 = dollid;
        }
    }
    
    var current_sounds = audio_get_playing();
    var playing_sounds = [];
    i++;
    alarm[0] = 2;
}
else
{
    alarm[0] = 1;
}
