controller_initialize(global.P1controllerport);
ScrPlayer1Input();

if (key_jump)
{
    if (!instance_exists(O_Fade))
    {
        global.player1 = 0;
        global.player2 = 0;
        fadeToRoom(R_CharacterSelect, 30, 0);
        audio_stop_sound(mu_results);
        
        if (!audio_is_playing(mu_boogiewoogie))
            audio_play_sound(mu_boogiewoogie, 100, true);
    }
}
