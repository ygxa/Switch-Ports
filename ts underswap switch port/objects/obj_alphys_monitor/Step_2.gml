if (followPlayer)
{
    x = obj_player.x;
    y = obj_player.y - 100;
    
    if (x != xprevious || y != yprevious)
        audio_resume_sound(moveSound);
    else
        audio_pause_sound(moveSound);
}
