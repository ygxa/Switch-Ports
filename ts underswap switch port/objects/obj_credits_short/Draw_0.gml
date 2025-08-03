switch (stage)
{
    case 0:
        draw_sprite_ext(spr_titlecard, 0, 0, 0, 4, 4, 0, c_white, 1);
        break;
    
    case 1:
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_color(c_white);
        set_font(fnt_main);
        draw_text_transformed(320, 240, dxd_raw("credits.short1"), 2, 2, 0);
        draw_text(320, 400, dxd_raw("credits.short2"));
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        break;
}
