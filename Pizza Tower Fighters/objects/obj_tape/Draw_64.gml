draw_set_alpha(alpha);
draw_set_color(c_black);
draw_rectangle(0, 0, 960, 540, false);
draw_set_alpha(1);
alpha = approach(alpha, alphato, 0.01);
draw_set_font(global.tapefont);
draw_set_color(c_white);

if (enabled)
{
    draw_sprite_ext(spr_placeholdertape, 0, 480, 270 - xoff, scale, scale, 0, c_white, 1);
    scale = approach(scale, 1, 0.1);
    
    if (!gooff)
        otheralpha = approach(otheralpha, 1, 0.1);
    
    draw_set_alpha(otheralpha);
    draw_set_halign(fa_center);
    draw_text(480, 370, "NEW DEMO SAVED!\nView your demos in the demrec menu");
    draw_set_alpha(1);
}

if (gooff)
{
    otheralpha = approach(otheralpha, 0, 0.1);
    xoffbuff += 0.1;
    xoff += xoffbuff;
    
    if (xoff > 400)
        instance_destroy();
}

depth = -1000;
