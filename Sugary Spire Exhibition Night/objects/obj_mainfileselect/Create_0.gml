depth = 10;
video_close();
global.blastmode = 0;
global.paul = 0;
obj_parent_player.blastcode = "";
global.playerCharacter = 0;
prevselected = 0;
char_select = 1;
prevcharselect = 1;
charicon = spr_menu_pizzelle;
charindex = 0;
arrowicon = spr_menu_pizzelle_arrow;
icon_y = 0;
icon_y_buffer = 0;
selectedFile = 0;
activated = false;
fileSelectHeightRatio = [0, 0, 0];
sndEmpty = fmod_createEventInstance("event:/SFX/fileselect/emptymenu");
savePath = ["saveData1_EN.ini", "saveData2_EN.ini", "saveData3_EN.ini"];
saves_idle = [spr_titlePizzelle_exhib1, spr_titlePizzelle_exhib2, spr_titlePizzelle_exhib3];
saves_left = [spr_titlePizzelle_exhib1l, spr_titlePizzelle_exhib2l, spr_titlePizzelle_exhib3l];
saves_right = [spr_titlePizzelle_exhib1r, spr_titlePizzelle_exhib2r, spr_titlePizzelle_exhib3r];
saves_visual = 0;
saves_sprite = spr_titlePizzelle_exhib1;
saves_index = 0;
doonce = 0;
saves_queue = ds_queue_create();
filePalette = [];
filePercentage = [];
filePresent = [];
fileJudgment = [];
fileOpened = [];
filePalette2 = [];

for (var i = 0; i < 3; i++)
{
    if (file_exists(savePath[i]))
    {
        ini_open(savePath[i]);
        filePalette[i] = ini_read_real("Misc", "playerPaletteIndex_" + string(scr_getCharacterPrefix(global.playerCharacter)), 2);
        filePalette2[i] = ini_read_real("Misc", "playerPaletteIndex_" + string(scr_getCharacterPrefix(1)), 2);
        fileOpened[i] = ini_read_real("Game", "seconds", 0) != 0 || ini_read_real("Game", "minutes", 0) != 0;
        ini_close();
        filePercentage[i] = scr_completion_percent(savePath[i]);
        filePresent[i] = true;
        fileJudgment[i] = scr_judgment_read(savePath[i]);
    }
    else
    {
        filePalette[i] = 2;
        filePalette2[i] = 2;
        filePercentage[i] = 0;
        filePresent[i] = false;
        fileJudgment[i] = scr_judgment_get("none");
        fileOpened[i] = false;
    }
}

fileDisplayPercent = 0;
hudAlpha = 0;
abletomove = false;
blockedInputs = false;
movePizzy = false;
pizzyX = 936;
pizzyY = 237;
painterIndex = 0;
flashbuffer = 0;
flashshake[0] = 0;
flashshake[1] = 0;
flashshake[2] = 0;
lightsOn = false;
alarm[1] = 5;
image_speed = 0;
fileDoodleW = 145;
fileDoodleH = 192;
fileDoodleSurf = [surface_create(fileDoodleW, fileDoodleH), surface_create(fileDoodleW, fileDoodleH), surface_create(fileDoodleW, fileDoodleH)];

doodle_surface_manage = function()
{
    for (var i = 0; i < array_length(fileDoodleSurf); i++)
    {
        if (!surface_exists(fileDoodleSurf[i]))
        {
            fileDoodleSurf[i] = surface_create(fileDoodleW, fileDoodleH);
            surface_set_target(fileDoodleSurf[i]);
            draw_clear_alpha(c_white, 1);
            surface_reset_target();
            
            if (buffer_exists(fileDoodleBuffer[i]))
                buffer_set_surface(fileDoodleBuffer[i], fileDoodleSurf[i], 0);
        }
    }
};

fileDoodleBuffer = [-4, -4, -4];
fileDoodlePos = [[163, 0], [373, 0], [583, 0]];
previewalpha = 0;
mouseX = 0;
mouseY = 0;
lineSteps = 1;
lineWidth = 5;
loaded = true;
