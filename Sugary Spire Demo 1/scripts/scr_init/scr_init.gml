pal_swap_init_system(2, 1, 4);
global.levelname = "none";
global.secretfound = 0;
global.showplaytimer = false;
global.playmiliseconds = 0;
global.playseconds = 0;
global.playminutes = 0;
global.playhour = 0;
global.music = -4;
global.harrymusic = -4;
global.PAUSEfadeoff = 0;
global.minesProgress = false;
global.GMLIVE_roomstart = false;
global.GMLIVE_realroom = -4;
global.cutsceneManager = -4;
global.combomode = false;
global.font = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.0123456789: ", 1, 0);
global.smallfont = font_add_sprite_ext(spr_smallfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890-:", 1, 0);
global.creditsfont = font_add_sprite_ext(spr_creditsfont, " ABCDEFGHIJKLMNOPQRSTUVWXYZ.!,abcdefghijklmnopqrstuvwxyz0123456789@#$%^&*(){}[]|:;'/`", 1, 0);
global.combofont = font_add_sprite_ext(spr_fontcombo, "0123456789", 1, 0);
global.collectfont = font_add_sprite_ext(spr_fontcollect, "0123456789", 1, 0);
global.shellactivate = false;
global.showcollisions = false;
global.debugmode = false;
global.fartcounter = 0;
global.parallaxbg_surface = -4;
global.ParallaxMap = ds_map_create();
scr_default_parallax(true);
global.FollowerList = ds_list_create();
global.mallowfollow = false;
global.crackfollow = false;
global.chocofollow = false;
global.wormfollow = false;
global.candyfollow = false;
ini_open("optionData.ini");
global.fullscreen = ini_read_real("Settings", "fullscrn", 0);
global.selectedResolution = ini_read_real("Settings", "resolution", 1);
global.smoothcam = ini_read_real("Settings", "smthcam", 1);
global.hitstunEnabled = ini_read_real("Settings", "hitstun", 1);
global.screentilt = ini_read_real("Settings", "scrntilt", 1);
global.screenmelt = ini_read_real("Settings", "screenmelt", 1);
global.playerrotate = ini_read_real("Settings", "playrot", 1);
global.musicVolume = ini_read_real("Settings", "musicvol", 0.6);
global.dialogueVolume = ini_read_real("Settings", "dialoguevol", 1);
global.soundVolume = ini_read_real("Settings", "soundvol", 1);
global.masterVolume = ini_read_real("Settings", "mastervol", 1);
ini_close_fixed();
audio_master_gain(global.masterVolume);
global.targetCamX = 0;
global.targetCamY = 0;

switch (global.selectedResolution)
{
    case 0:
        window_set_size(480, 260);
        break;
    
    case 1:
        window_set_size(960, 540);
        break;
    
    case 2:
        window_set_size(1280, 720);
        break;
}

window_set_fullscreen(global.fullscreen);
audio_sound_gain(sfx_alright, 2, 0);
audio_sound_gain(sfx_bad, 2, 0);
audio_sound_gain(sfx_eheheh_ok, 2, 0);
audio_sound_gain(sfx_ruthless, 2, 0);
audio_sound_gain(sfx_sour, 2, 0);
audio_sound_gain(sfx_spicy, 2, 0);
audio_sound_gain(sfx_sweet, 2, 0);
audio_sound_gain(sfx_what_the_fuck, 2, 0);
