if (global.GUIon == 1)
{
    if (global.mGUI == 0)
    {
        draw_set_font(F_GUI);
        draw_set_color(c_white);
        draw_text(healthbar_x + 20, healthbar_y - 60, "Player 2");
        draw_sprite(S_HpBorder_DoiseBack, 0, healthbar_x, healthbar_y);
        draw_sprite_stretched(S_HpBar, 0, healthbar_x, healthbar_y, (hp / hpmax) * healthbar_width, healthbar_height);
        draw_sprite(S_HpBorder_Doise, 0, healthbar_x, healthbar_y);
        draw_sprite_stretched(S_FakePep_Damagemeter, 0, healthbar_x, healthbar_y + 80, lerpto, damagemeter_height);
        var _width = (damagemeter / damagemetermax) * damagemeter_width;
        var _height = damagemeter_height;
        
        if (round(lerpto) > 0 && _height > 0)
        {
            if (!surface_exists(surf))
                surf = surface_create(_width, _height);
            
            surface_set_target(surf);
            draw_clear_alpha(c_black, 0);
            offsetx++;
            
            if (offsetx == 64)
                offsetx = 0;
            
            draw_sprite_tiled(arrowbg, 0, 0 + offsetx, 0);
            surface_reset_target();
            draw_set_alpha(arrowalpha);
            draw_surface(surf, healthbar_x, healthbar_y + 80);
            draw_set_alpha(1);
            surface_resize(surf, round(lerpto), _height);
        }
        
        lerpto = lerp(lerpto, _width, 0.1);
        
        if ((lerpto + 0.15) > _width)
            arrowalpha = approach(arrowalpha, 0, 0.01);
        else
            arrowalpha = approach(arrowalpha, 1, 0.01);
        
        draw_sprite(S_FakePep_Damagemeter_Border, 0, healthbar_x, healthbar_y + 80);
        
        switch (ObjGame.Player2live)
        {
            case 1:
                draw_sprite(S_Stock_Doise, 0, healthbar_x + 10, healthbar_y + 120);
                break;
            
            case 2:
                draw_sprite(S_Stock_Doise, 0, healthbar_x + 10, healthbar_y + 120);
                draw_sprite(S_Stock_Doise, 0, healthbar_x + 60, healthbar_y + 120);
                break;
            
            case 3:
                draw_sprite(S_Stock_Doise, 0, healthbar_x + 10, healthbar_y + 120);
                draw_sprite(S_Stock_Doise, 0, healthbar_x + 60, healthbar_y + 120);
                draw_sprite(S_Stock_Doise, 0, healthbar_x + 110, healthbar_y + 120);
                break;
            
            case 4:
                draw_sprite(S_Stock_Doise, 0, healthbar_x + 10, healthbar_y + 120);
                draw_sprite(S_Stock_Doise, 0, healthbar_x + 60, healthbar_y + 120);
                draw_sprite(S_Stock_Doise, 0, healthbar_x + 110, healthbar_y + 120);
                draw_sprite(S_Stock_Doise, 0, healthbar_x + 160, healthbar_y + 120);
                break;
        }
    }
    else
    {
        DrawSetText(16777215, F_MGui, 50, 50);
        draw_text(healthbar_x, healthbar_y - 60, "P2 HP: " + string(hp));
        draw_text(healthbar_x, healthbar_y - 40, "DAMAGE METER: " + string(damagemeter) + "/" + string(damagemetermax));
        draw_text(healthbar_x, healthbar_y - 20, "STOCKS: " + string(ObjGame.Player2live));
    }
}
