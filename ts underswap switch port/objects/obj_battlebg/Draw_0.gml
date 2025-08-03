switch (kind)
{
    default:
        draw_self();
        break;
    
    case 1:
        draw_set_color(#AA72BE);
        var r = kkRumbling;
        var centerX = 320;
        var centerY = 70 - kkWheelHeight;
        var width = 161;
        var height = 104;
        var dist = (2 * pi) / kkCarriageCount;
        
        if (kkWheelHeight < 300)
        {
            for (var i = 0; i < kkCarriageCount; i++)
            {
                var _x = centerX + (cos(kkAngle + (dist * i)) * width);
                var _y = centerY + (sin(kkAngle + (dist * i)) * height);
                
                if (r && irandom(2) == 0)
                {
                    _x += irandom(1);
                    _y += irandom(1);
                }
                
                draw_line_width_pix(centerX, centerY, _x, _y, 2);
            }
        }
        
        draw_sprite(lang_get_sprite(spr_battlebg_kk), 1, 0, 0);
        
        if (kkWheelHeight < 300)
        {
            for (var i = 0; i < kkCarriageCount; i++)
            {
                var _x = centerX + (cos(kkAngle + (dist * i)) * width);
                var _y = centerY + (sin(kkAngle + (dist * i)) * height);
                
                if (r && irandom(2) == 0)
                {
                    _x += irandom(1);
                    _y += irandom(1);
                }
                
                draw_sprite(spr_battlebg_kk_cabin, 2, _x, _y);
            }
        }
        
        draw_sprite(lang_get_sprite(spr_battlebg_kk), 0, r ? irandom(1) : 0, 0);
        var alpha = 0.8;
        
        if (global.lowvfx)
            alpha = 0.6;
        
        alpha *= image_alpha;
        draw_rectangle_pix(0, 0, 640, 250, 0, 1 - alpha);
        break;
    
    case 2:
        draw_sprite(spr_battlebg, 8, 0, 0);
        draw_sprite(spr_battlebg, 9, 0, 0);
        break;
    
    case 3:
        draw_sprite(spr_battlebg, 8, 0, 0);
        break;
}
