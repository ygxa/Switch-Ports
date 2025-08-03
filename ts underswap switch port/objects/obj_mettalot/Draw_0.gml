if (visible)
{
    var py = y;
    y += (sin(siner) * 2);
    
    if (room == rm_ruinc_grillbys && sprite_index == spr_met_up)
        draw_sprite(spr_met_grillbyup, 0, 50, 110);
    
    draw_self();
    
    if (modeLag <= 1)
    {
        draw_set_alpha(handAlpha);
        
        if (handLX != -1)
        {
            draw_sprite(spr_met_hands, handLInd, floor(handLX), floor(handLY));
            draw_sprite(spr_met_hands, handRInd, floor(handRX), floor(handRY));
        }
        else if (lookDirectionLag == 1)
        {
            draw_sprite(spr_met_hands, 0, (x - 3) + micXOffset, y + 11);
            draw_sprite(spr_met_hands, handIndexLag, x + 25, y + 17);
        }
        else if (lookDirectionLag == 3)
        {
            draw_sprite(spr_met_hands, 0, x + 5 + micXOffset, y + 16);
        }
        else if (lookDirectionLag == 2)
        {
            draw_sprite(spr_met_hands, handIndexLag, x + 15, y + 16);
        }
        
        draw_set_alpha(1);
    }
    else if (modeLag == 4)
    {
        draw_sprite(spr_met_hands, 0, (defaultX - 3) + micXOffset, y + 11);
    }
    
    y = py;
}
