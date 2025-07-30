if (global.GUIon == 1)
{
    if (global.mGUI == 0)
    {
        draw_set_font(F_GUI);
        draw_set_color(c_white);
        var str = "PIZZAFACE HP";
        draw_text(healthbar_x - 20, healthbar_y - 60, str);
        draw_sprite(s_pizzaface_HBorderB, 0, healthbar_x, healthbar_y);
        draw_sprite_stretched(S_HpBar_P, 0, healthbar_x, healthbar_y, (hp / hpmax) * healthbar_width, healthbar_height);
        draw_sprite(s_pizzaface_HBorder, 0, healthbar_x, healthbar_y);
    }
}
