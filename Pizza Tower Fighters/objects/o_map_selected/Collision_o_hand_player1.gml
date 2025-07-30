with (other)
{
    if (key_accept)
    {
        audio_stop_sound(mu_boogiewoogie);
        fadeToRoom(other.map, 20, 0, 1);
        
        if (other.map == R_Credits)
            global.player1 = "PS";
        
        instance_destroy();
    }
}
