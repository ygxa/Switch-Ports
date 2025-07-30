controller_initialize(global.P1controllerport);
key_up = keyboard_check_pressed(vk_up) || lsMoveUp || mouse_wheel_up();
key_down = keyboard_check_pressed(vk_down) || lsMoveDown || mouse_wheel_down();
key_back = keyboard_check_pressed(ord("X")) || buttonAPress;
move = -key_up + key_down;

if (key_back)
{
    o_back.goaway = true;
    audio_play_sound(su_deselect, 50, false);
}

ini_open("Matches.ini");

if (number_of_matches != 0)
{
    with (instance_create_layer(x + 480, ylast + 250, layer, o_prevmat))
    {
        p1ch = ini_read_string(other.number_of_matches, "p1char", 0);
        p2ch = ini_read_string(other.number_of_matches, "p2char", 0);
        Scr_SetMatchIcons();
        p1liv = ini_read_real(other.number_of_matches, "p1lives", 1);
        p2liv = ini_read_real(other.number_of_matches, "p2lives", 1);
        gamemode = ini_read_string(other.number_of_matches, "gamemode", 0);
        pal1 = ini_read_real(other.number_of_matches, "p1pal", 1);
        pal2 = ini_read_real(other.number_of_matches, "p2pal", 0);
        day = ini_read_real(other.number_of_matches, "day", 1);
        month = ini_read_real(other.number_of_matches, "month", 12);
        year = ini_read_real(other.number_of_matches, "year", 2000);
        selected = other.matchmax - other.number_of_matches;
        ylast = other.ymax + (-250 * other.number_of_matches);
        other.number_of_matches--;
        other.ylast = y;
    }
}

ini_close();

if (nomatches)
{
    draw_text(480, 270, "NO MATCHES EXIST");
}
else if (move != 0)
{
    selected += move;
    
    if (selected < 0)
        selected = 0;
    
    if (selected > (matchmax - 1))
        selected = matchmax - 1;
    
    with (o_prevmat)
    {
        yto = (-250 * other.selected) + 125;
        
        if (selected == other.selected)
        {
            playindex = 0;
            playanim = true;
        }
    }
}
