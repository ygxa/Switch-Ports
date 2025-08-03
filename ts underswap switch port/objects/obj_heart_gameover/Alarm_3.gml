switch (global.gameover_special_type)
{
    case 0:
    case 1:
        music_lcplay("supersupersupersans", true);
        break;
    
    default:
        music_lcplay("gameover", true);
        break;
}

if (instance_exists(global.currentmusic) && global.currentmusic.instance != -1)
    audio_sound_loop_end(global.currentmusic.instance, 59.716);
