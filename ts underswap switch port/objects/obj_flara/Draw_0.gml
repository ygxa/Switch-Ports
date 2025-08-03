var px, py;

if (sprite_index == spr_flara_down_notamused)
{
    px = x;
    py = y;
    
    if (irandom(1) == 0)
        x += irandom(1);
    
    if (irandom(1) == 0)
        y += irandom(1);
}

draw_self();
var hairOffset;

if (sprite_index != spr_flara_down_talk && sprite_index != spr_flara_left_talk && sprite_index != spr_flara_up_talk && sprite_index != spr_flara_right_talk)
    hairOffset = ((floor(image_index) % 2) == 1) ? 1 : 0;
else
    hairOffset = 0;

var hairSprite;

switch (sprite_index)
{
    case spr_flara_down_notamused:
    case spr_flara_down:
    case spr_flara_down_talk:
    case spr_flara_down_smirk:
        hairSprite = spr_flara_down_hair;
        break;
    
    case spr_flara_left:
    case spr_flara_left_talk:
        hairSprite = spr_flara_left_hair;
        break;
    
    case spr_flara_up:
    case spr_flara_up_talk:
        hairSprite = spr_flara_up_hair;
        break;
    
    case spr_flara_right:
    case spr_flara_right_talk:
        hairSprite = spr_flara_right_hair;
        break;
    
    default:
        hairSprite = spr_cockbone;
        break;
}

draw_sprite(hairSprite, floor(hairFrame), x, y + hairOffset);

if (sprite_index == spr_flara_down_notamused)
{
    x = px;
    y = py;
}
