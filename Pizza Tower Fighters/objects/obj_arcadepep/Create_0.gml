diff = global.ArcadeDiffictulty;
yoff = 0;
cameray = -540;
cameralerp = -540;
camerasp = 40;
cammove = false;
confirmButt = global.keyboardp1key_jump;
available = false;
availablealpha = 0;
musicfade = 1;
zoom = 1;
transition = false;
pressz_alpha = 0;
pressz_angle = 30;
pressz_buff = 0;
cam = view_camera[0];
alarm[0] = 224;
alarm[1] = 164;
alarm[2] = 424;
alarm[3] = 84;
image_speed = 0;
p1pal = s_pal_pep;

switch (global.player1)
{
    case "NO":
        image_index = 1;
        p1pal = s_pal_noi;
        break;
    
    case "DO":
        image_index = 2;
        p1pal = s_pal_doi_win;
        break;
    
    case "FP":
        image_index = 4;
        p1pal = s_pal_fakepep;
        break;
    
    case "TV":
        image_index = 3;
        p1pal = s_pal_vigi;
        break;
}

global.TOTALSCORE += global.CURRENTSCORE;
global.CURRENTSCORE = 0;
