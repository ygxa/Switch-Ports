if (room == rm_ruinc_main && x == 300)
{
    var _x = x - floor(sprite_xoffset);
    var _y = (y - floor(sprite_yoffset)) + (floor(sprite_height * 0.25) * 3);
    s.x = _x;
    s.y = _y;
    direction = point_direction(x + (sprite_width * 0.5), y + sprite_height, obj_player.x, obj_player.y + (obj_player.sprite_height * 0.5));
    lookDirection = direction_calculate();
}

if (moving == -1 && obj_overworldui.state == (1 << 0) && obj_overworldui.currentCharacter == "flara")
{
    switch (lookDirection)
    {
        case 1:
            sprite_index = spr_flara_down_talk;
            break;
        
        case 2:
            sprite_index = spr_flara_left_talk;
            break;
        
        case 0:
            sprite_index = spr_flara_up_talk;
            break;
        
        case 3:
            sprite_index = spr_flara_right_talk;
            break;
    }
    
    image_index = obj_overworldui.portraitIndex;
}
else
{
    if (image_speed == 0)
        image_index = 0;
    
    if (room == rm_ruinc_grillbys)
        lookDirection = obj_ruinc_grillbys.musicStopped ? 2 : 1;
    
    if (sprite_index != spr_flara_down_notamused && sprite_index != spr_flara_down_smirk)
        event_user(15);
}

hairFrame += 0.2;

if (hairFrame >= 5)
    hairFrame -= 5;
