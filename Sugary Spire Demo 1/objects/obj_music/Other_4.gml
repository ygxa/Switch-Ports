if (global.panic == 0)
{
    if (instance_exists(obj_gummyharry))
    {
        if (!audio_is_playing(mu_gummyharry))
        {
            global.harrymusic = scr_music(20);
            audio_sound_gain(global.harrymusic, 0, 0);
            audio_sound_gain(global.harrymusic, 0.25 * global.musicVolume, 2000);
        }
    }
    
    var roomname = room_get_name(room);
    
    if (room == rm_missing)
    {
        if (!audio_is_playing(mu_void))
        {
            audio_stop_all_music();
            global.music = scr_music(54);
            pausedmusic = 54;
        }
    }
    
    if (room == realtitlescreen)
    {
        if (!audio_is_playing(mu_title))
        {
            audio_stop_all_music();
            global.music = scr_music(104);
            pausedmusic = 104;
        }
    }
    
    if (room == rm_credits)
    {
        if (!audio_is_playing(mu_credits))
        {
            audio_stop_all_music();
            global.music = scr_music(94);
            pausedmusic = 94;
        }
    }
    
    if (string_letters(roomname) == "dragonlair")
    {
        if (!audio_is_playing(mu_gummyharry))
        {
            audio_stop_all_music();
            global.music = scr_music(20);
            pausedmusic = 83;
        }
    }
    
    if (string_letters(roomname) == "hubroom" || string_letters(roomname) == "hubpublic" || room == outer_room1)
    {
        if (!audio_is_playing(mu_hub))
        {
            audio_stop_all_music();
            global.music = scr_music(83);
            pausedmusic = 83;
        }
    }
    
    if (string_letters(roomname) == "entryway" && obj_player.character == "P")
    {
        if (!audio_is_playing(mu_waffle))
        {
            audio_stop_all_music();
            global.music = scr_music(84);
            pausedmusic = 84;
            audio_sound_set_track_position(global.music, fadeoff * audio_sound_length(global.music));
        }
    }
    
    if (string_letters(roomname) == "entryway" && obj_player.character == "N")
    {
        if (!audio_is_playing(mu_pizzanothemetune))
        {
            audio_stop_all_music();
            global.music = scr_music(100);
            pausedmusic = 100;
            audio_sound_set_track_position(global.music, fadeoff * audio_sound_length(global.music));
        }
    }
    
    if (string_letters(roomname) == "entrywaysecret")
    {
        if (!audio_is_playing(mu_wafflesecret))
        {
            audio_stop_all_music();
            global.music = scr_music(107);
            pausedmusic = 107;
            audio_sound_set_track_position(global.music, fadeoff * audio_sound_length(global.music));
        }
    }
    
    if (string_letters(roomname) == "tutorial")
    {
        if (!audio_is_playing(mu_tutorial))
        {
            audio_stop_all_music();
            global.music = scr_music(118);
            pausedmusic = 118;
            audio_sound_set_track_position(global.music, fadeoff * audio_sound_length(global.music));
        }
    }
    
    if (string_letters(roomname) == "molasses" || string_letters(roomname) == "molassesb" || string_letters(roomname) == "molassesc" || string_letters(roomname) == "molassesd")
    {
        if (!audio_is_playing(mu_swamp))
        {
            audio_stop_all_music();
            global.music = scr_music(28);
            pausedmusic = 28;
            audio_sound_set_track_position(global.music, fadeoff * audio_sound_length(global.music));
        }
    }
    
    if (string_letters(roomname) == "steamy")
    {
        for (i = 0; i < 20; i++)
        {
            if (roomname == ("steamy_" + string(i)) && i < 8)
            {
                if (!audio_is_playing(mu_steamy))
                {
                    audio_stop_all_music();
                    global.music = scr_music(85);
                    pausedmusic = 85;
                    audio_sound_set_track_position(global.music, fadeoff * audio_sound_length(global.music));
                }
            }
            
            if ((roomname == ("steamy_" + string(i)) && i >= 8) || room == steamy_11_1)
            {
                if (!audio_is_playing(mu_steamyinner))
                {
                    audio_stop_all_music();
                    global.music = scr_music(86);
                    pausedmusic = 86;
                    audio_sound_set_track_position(global.music, fadeoff * audio_sound_length(global.music));
                }
            }
        }
    }
    
    if (string_letters(roomname) == "steamysecret")
    {
        if (!audio_is_playing(mu_steamysecret))
        {
            audio_stop_all_music();
            global.music = scr_music(101);
            pausedmusic = 101;
            audio_sound_set_track_position(global.music, fadeoff * audio_sound_length(global.music));
        }
    }
    
    if (string_letters(roomname) == "molassessecret")
    {
        if (!audio_is_playing(mu_swampsecret))
        {
            audio_stop_all_music();
            global.music = scr_music(7);
            pausedmusic = 7;
            audio_sound_set_track_position(global.music, fadeoff * audio_sound_length(global.music));
        }
    }
    
    if (string_letters(roomname) == "devroom")
    {
        if (!audio_is_playing(mu_what))
        {
            audio_stop_all_music();
            global.music = scr_music(97);
            pausedmusic = 97;
            audio_sound_set_track_position(global.music, fadeoff * audio_sound_length(global.music));
        }
    }
    
    if (string_letters(roomname) == "mines")
    {
        switch (global.minesProgress)
        {
            case 0:
                if (!audio_is_playing(mu_mineshaft1))
                {
                    audio_stop_all_music();
                    global.music = scr_music(19);
                    pausedmusic = 19;
                    audio_sound_set_track_position(global.music, fadeoff * audio_sound_length(global.music));
                }
                
                break;
            
            default:
                if (!audio_is_playing(mu_mineshaft2))
                {
                    audio_stop_all_music();
                    global.music = scr_music(111);
                    pausedmusic = 111;
                    audio_sound_set_track_position(global.music, fadeoff * audio_sound_length(global.music));
                }
                
                break;
        }
    }
    
    if (string_letters(roomname) == "minessecret")
    {
        if (!audio_is_playing(mu_minessecret))
        {
            audio_stop_all_music();
            global.music = scr_music(116);
            pausedmusic = 116;
            audio_sound_set_track_position(global.music, fadeoff * audio_sound_length(global.music));
        }
    }
    
    if (string_letters(roomname) == "palroom")
    {
        if (!audio_is_playing(mu_paletteselect))
        {
            audio_stop_all_music();
            global.music = scr_music(44);
            pausedmusic = 44;
        }
    }
}
