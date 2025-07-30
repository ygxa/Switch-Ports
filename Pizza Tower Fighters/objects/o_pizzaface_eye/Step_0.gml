vsp += grv;

if (place_meeting(x + hsp, y, ObjWall))
{
    yplus = 0;
    
    while (place_meeting(x + hsp, y - yplus, ObjWall) && yplus <= abs(1 * hsp))
        yplus += 1;
    
    if (place_meeting(x + hsp, y - yplus, ObjWall))
    {
        while (!place_meeting(x + sign(hsp), y, ObjWall))
            x += sign(hsp);
        
        hsp = -hsp;
    }
    else
    {
        y -= yplus;
    }
}

x += hsp;
var _movingPlatform = instance_place(x, y + max(1, vsp), o_way_platform);

if (_movingPlatform && bbox_bottom <= _movingPlatform.bbox_top)
{
    if (vsp > 0)
    {
        while (!place_meeting(x, y + sign(vsp), o_way_platform))
            y += sign(vsp);
    }
}

if (!place_meeting(x, y, ObjWall) && vsp >= 0 && place_meeting(x, y + 2 + abs(hsp), ObjWall))
{
    while (!place_meeting(x, y + 1, ObjWall))
        y += 1;
}

if (place_meeting(x, y + vsp, ObjWall))
{
    while (!place_meeting(x, y + sign(vsp), ObjWall))
        y += sign(vsp);
    
    vsp = 0;
}

y += vsp;
grounded = place_meeting(x, y + 1, o_parentwall);

if (grounded)
{
    vsp = -14;
    
    if (!audio_is_playing(su_pizzaface_eye_bounce))
        audio_play_sound(su_pizzaface_eye_bounce, 50, false);
    
    hsp = 4 * facing;
}

if (place_meeting(x, y, o_player_vigilante))
{
    if (o_player_vigilante.state == (9 << 0) && player != 1)
    {
        hsp = -hsp;
        facing = -facing;
        player = 1;
    }
}

image_angle++;
