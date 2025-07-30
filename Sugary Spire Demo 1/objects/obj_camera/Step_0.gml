if (room == timesuproom || room == rank_room || room == rm_credits)
    DrawHUD = 0;
else
    DrawHUD = 1;

if (global.panic == 1)
    timestop = 0;

if (global.panic == 0)
    timestop = 1;

if (global.seconds == 0 && global.minutes == 0)
    alarm[1] = -1;

if (global.seconds < 0)
{
    global.seconds = 59;
    global.minutes -= 1;
}

if (global.panic == 1 && global.seconds <= 0 && global.minutes <= 0)
    greyscalefade = approach(greyscalefade, 0.45, 0.005);
else
    greyscalefade = approach(greyscalefade, 0, 0.005);

if (room != realtitlescreen && room != scootercutsceneidk && room != outer_room1 && room != outer_room2 && room != hub_room1 && room != palroom)
{
    if (obj_player.state != 16 && room != rank_room && !instance_exists(obj_endlevelfade))
    {
        global.playmiliseconds += 1;
        
        if (global.playmiliseconds >= 60)
        {
            global.playmiliseconds = 0;
            global.playseconds += 1;
            
            if (global.playseconds >= 60)
            {
                global.playseconds = 0;
                global.playminutes += 1;
                
                if (global.playminutes >= 60)
                {
                    global.playminutes = 0;
                    global.playhour += 1;
                }
            }
        }
    }
}
else
{
    global.playmiliseconds = 0;
    global.playseconds = 0;
    global.playminutes = 0;
    global.playhour = 0;
}

if (global.panic == 1)
{
    panicshake = clamp(lerp(1, 3, global.wave / global.maxwave), 1, 3);
    panicshakeacc = 3 / room_speed;
}
else
{
    panicshake = 0;
    panicshakeacc = 0;
}

panicshake = approach(panicshake, 0, panicshakeacc);

if (shake_mag > 0)
{
    shake_mag -= shake_mag_acc;
    
    if (shake_mag < 0)
        shake_mag = 0;
}

var lspd = 0.25;
cam_angle = lerp(cam_angle, cam_langle, lspd);
cam_zoom = lerp(cam_zoom, cam_lzoom, lspd);
camera_set_view_angle(view_camera[0], cam_angle);
var vw = cam_w * cam_zoom;
var vh = cam_h * cam_zoom;
camera_set_view_size(view_camera[0], vw, vh);

if (instance_exists(obj_player) && (obj_player.state != 28 && obj_player.state != 48))
{
    var target = 
    {
        x: global.targetCamX,
        y: global.targetCamY
    };
    var _cam_x = target.x - (vw / 2);
    var _cam_y = target.y - (vh / 2);
    var _shake_x = 0;
    var _shake_y = 0;
    
    if (obj_player.state == 67 || (obj_player.state == 98 && obj_player.movespeed > 10) || obj_player.state == 29)
    {
        var _targetcharge = obj_player.xscale * ((obj_player.movespeed / 6) * 50);
        var _tspeed = 2;
        
        if ((_targetcharge > 0 && chargecamera < 0) || (_targetcharge < 0 && chargecamera > 0))
            _tspeed = 8;
        
        if (chargecamera > _targetcharge)
            chargecamera -= _tspeed;
        
        if (chargecamera < _targetcharge)
            chargecamera += _tspeed;
    }
    else
    {
        if (chargecamera > 0)
            chargecamera -= 2;
        
        if (chargecamera < 0)
            chargecamera += 2;
    }
    
    _cam_x += chargecamera;
    _cam_x = clamp(_cam_x, Camera_xorigin, (Camera_xorigin + Camera_width) - vw);
    _cam_y = clamp(_cam_y, Camera_yorigin, (Camera_yorigin + Camera_height) - vh);
    _cam_x = clamp(_cam_x, 0, room_width - vw);
    _cam_y = clamp(_cam_y, 0, room_height - vh);
    _cam_x += irandom_range(-panicshake, panicshake);
    _cam_y += irandom_range(-panicshake, panicshake);
    
    if (shake_mag != 0)
    {
        _shake_x += irandom_range(-shake_mag, shake_mag);
        _shake_y += irandom_range(-shake_mag, shake_mag);
    }
    
    lspd = 0.25;
    
    if (global.smoothcam == true)
    {
        Cam_x = lerp(Cam_x, _cam_x, lspd);
        Cam_y = lerp(Cam_y, _cam_y, lspd);
    }
    else
    {
        Cam_x = _cam_x;
        Cam_y = _cam_y;
    }
    
    camera_set_view_pos(view_camera[0], Cam_x + _shake_x, Cam_y + _shake_y);
}

if (global.panic == 1 && global.minutes == 0 && global.seconds == 0 && room != timesuproom)
{
    if (!instance_exists(obj_coneball))
        instance_create(0, 0, obj_coneball);
}

if (global.panic == 1 && global.screentilt == 1)
{
    camera_set_view_angle(view_camera[0], camera_get_view_angle(view_camera[0]) + scr_sin(3.5 * clamp(global.wave / global.maxwave, 0, 1), 65 - (5 * clamp(global.wave / global.maxwave, 0, 1))));
    clamp(angle, -5, 5);
    
    if (angle >= 5)
        angledir = -1;
    else if (angle <= -5)
        angledir = 1;
    
    if (angle < 5 && angledir == 1)
        angle += 0.025;
    
    if (angle > -5 && angledir == -1)
        angle -= 0.025;
}
else
{
    camera_set_view_angle(view_camera[0], cam_angle);
}

if (obj_player.y < (180 + obj_camera.Cam_y) && obj_player.x < (350 + obj_camera.Cam_x))
    DrawY = lerp(DrawY, -300, 0.15);
else
    DrawY = lerp(DrawY, 0, 0.15);

if (global.panicbg == true && global.panic == true)
    global.wave = clamp(clamp(global.wave + (60 / room_speed), 0, global.maxwave - (((global.minutes * 60) + global.seconds) * 60)), 0, global.maxwave);

Collectshake = approach(Collectshake, 0, 20 / room_speed);

if (global.collect < global.crank)
    global.currentrank = "D";
else if (global.collect < global.brank)
    global.currentrank = "C";
else if (global.collect < global.arank)
    global.currentrank = "B";
else if (global.collect < global.srank)
    global.currentrank = "A";
else if (global.collect >= global.srank)
    global.currentrank = "S";

if (oldranklol != global.currentrank)
{
    bubblescale = 1.5;
    oldranklol = global.currentrank;
}

bubblescale = approach(bubblescale, 0, 0.1);
