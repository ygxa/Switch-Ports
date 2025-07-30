if (sprite_index != s_noiseBomb_land)
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
        sprite_index = s_noiseBomb_hitwall;
    }
    else
    {
        y -= yplus;
    }
}

if (sprite_index == s_noiseBomb)
    x += hsp;

var _movingPlatform = instance_place(x, y + max(1, vsp), o_way_platform);

if (_movingPlatform && bbox_bottom <= _movingPlatform.bbox_top)
{
    if (vsp > 0)
    {
        while (!place_meeting(x, y + sign(vsp), o_way_platform))
            y += sign(vsp);
        
        detect = 1;
        vsp = 0;
    }
}
else
{
    detect = 0;
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

if (sprite_index != s_noiseBomb_land)
    y += vsp;

grounded = place_meeting(x, y + 1, ObjWall);

if (grounded || detect)
{
    if (sprite_index != s_noiseBomb_land)
    {
        audio_play_sound(su_noise_bomb_bounce, 50, false);
        image_index = 0;
        sprite_index = s_noiseBomb_land;
    }
    
    vsp = -3;
}

if (place_meeting(x, y, o_player_vigilante))
{
    if (o_player_vigilante.state == (9 << 0) && player != 1)
    {
        hsp = -hsp;
        player = 1;
    }
}

if (place_meeting(x, y, o_player_vigilante2))
{
    if (o_player_vigilante2.state == (9 << 0) && player != 2)
    {
        hsp = -hsp;
        player = 2;
    }
}

if (sprite_index == s_noiseBomb)
{
    if (hsp != 0)
        image_xscale = sign(hsp);
}

timer--;

if (timer == 0)
{
    instance_destroy();
    instance_create_layer(x, y, layer, o_player_noise_explosion);
}

if (sprite_index != s_noiseBomb)
{
    if (animation_end())
        sprite_index = s_noiseBomb;
}
