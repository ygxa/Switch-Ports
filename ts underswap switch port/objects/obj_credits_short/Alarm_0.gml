stage++;

switch (stage)
{
    case 1:
        sfx_play(snd_menuhit);
        alarm[0] = 140;
        break;
    
    case 2:
        sfx_play(snd_menuhit);
        alarm[0] = 180;
        break;
    
    case 3:
        global.fader_on_room_start = true;
        global.fader_speed_on_room_start = 0.025;
        global.entrancespawn_on_room_start = 0;
        global.player_direction_on_room_start = 1;
        room_goto(rm_star1);
        break;
}
