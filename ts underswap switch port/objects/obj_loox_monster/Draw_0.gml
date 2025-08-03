function drawArms()
{
    draw_sprite_ext(spr_looxarms, 0, x, y + (floor(armOffset) * 2), 2, 2, 0, image_blend, 1);
}

if (visible)
{
    switch (sprite_index)
    {
        case spr_looxstare2:
            var _px = x;
            var _py = y;
            
            if (irandom(8) == 0)
            {
                x += (irandom(4) - 2);
                y += (irandom(4) - 2);
            }
            
            drawArms();
            draw_self();
            x = _px;
            y = _py;
            break;
        
        case spr_looxstare3:
            var _px = x;
            var _py = y;
            
            if (irandom(1) == 0)
            {
                x += (irandom(6) - 3);
                y += (irandom(6) - 3);
            }
            
            drawArms();
            draw_self();
            x = _px;
            y = _py;
            break;
        
        case spr_looxlookleft:
        case spr_looxlookright:
            var _px = x;
            var _py = y;
            
            if (irandom(1) == 0)
            {
                if (image_index == 1)
                {
                    x += (irandom(4) - 2);
                    y += (irandom(4) - 2);
                }
                else if (image_index == 2)
                {
                    x += (irandom(6) - 3);
                    y += (irandom(6) - 3);
                }
            }
            
            draw_self();
            x = _px;
            y = _py;
            break;
        
        default:
            if (sprite_index != spr_looxdamage && sprite_index != spr_looxbite && sprite_index != spr_loox_turn && sprite_index != spr_looxvegattack && sprite_index != spr_looxvegattack2 && sprite_index != spr_looxvegattack3)
                drawArms();
            
            draw_self();
            break;
    }
}
