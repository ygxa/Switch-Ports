y = approach(y, ystart - yoff, 5);
var cw = 960 * zoom;
var ch = 540 * zoom;
var offsetx = 960 - cw;
var offsety = 540 - ch;
var bg1 = layer_get_id("Backgrounds_1");
var bg2 = layer_get_id("Backgrounds_2");
var bg3 = layer_get_id("Backgrounds_3");
layer_y(bg1, cameray);
layer_y(bg2, cameray);
layer_y(bg3, cameray);
camera_set_view_pos(cam, offsetx / 2, floor(cameray) + (offsety / 2));
camera_set_view_size(cam, 960 * zoom, 540 * zoom);

if (cammove)
    cameray = approach(cameray, cameralerp + ((y - 416) / 4), camerasp);

availablealpha = approach(availablealpha, available, 0.02);

if (transition)
{
    musicfade -= 0.02;
    
    if (musicfade <= 0)
        audio_stop_sound(mu_elevator);
    
    zoom -= 0.005;
}

audio_sound_gain(mu_elevator, musicfade, 0);

if (!available)
{
    exit;
}
else
{
    pressz_buff += 0.005;
    pressz_alpha += pressz_buff;
    
    if (pressz_alpha > 1)
        pressz_alpha = 1;
    
    pressz_angle -= (pressz_buff * 30);
    
    if (pressz_angle < 0)
        pressz_angle = 0;
}

controller_initialize(global.P1controllerport);

if (keyboard_check_pressed(confirmButt) || buttonAPress)
{
    available = false;
    transition = true;
    
    if ((diff + 1) != 4)
    {
        global.player2 = global.ArcadeArray[diff + 1];
        global.CPULVL = 2 + diff;
        
        if (global.player2 == "PS" || global.player2 == "FP" || global.player2 == "DO")
            global.palp2 = 1;
        else
            global.palp2 = 0;
        
        ScrArcadeShuffleMapSelect();
    }
    else
    {
        global.player2 = "PF";
        global.CPULVL = 5;
        fadeToRoom(R_Top, 20, 0, 1);
    }
}
