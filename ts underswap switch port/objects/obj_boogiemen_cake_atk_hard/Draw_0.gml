if (bt_set_surface_cutoff())
    exit;

draw_sprite(spr_boogie_cake_wick, wickIndex, x, y - wickY);

if (step >= 70)
{
    if (lineAlpha < 1)
        lineAlpha += 0.1;
    
    draw_set_color(c_ltgray);
    draw_set_alpha(lineAlpha);
    var angle = 15;
    
    repeat (8)
    {
        draw_line_pix(x, y, x + (40 * dcos(angle)), y - (40 * dsin(angle)));
        angle += 45;
    }
    
    draw_set_color(c_white);
    draw_set_alpha(1);
}

draw_self();
