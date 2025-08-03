var yOff;

if (horzSiner != 0)
{
    xOff[0] = sin(horzSiner) * 1.5;
    xOff[1] = sin(horzSiner + 1) * 1.5;
    xOff[2] = sin(horzSiner + 2) * 1.5;
    xOff[3] = sin(horzSiner + 2.5) * 2;
    yOff = [0, 0, 0, 0];
}
else
{
    if ((spared || attackType == 1) && attackStage == 1)
    {
        xOff[0] = number_approach_smooth(xOff[0], -9, 0.4, 0.25);
        xOff[1] = number_approach_smooth(xOff[1], -6, 0.4, 0.25);
        xOff[2] = number_approach_smooth(xOff[2], -3, 0.4, 0.25);
        xOff[3] = number_approach_smooth(xOff[3], 0, 0.4, 0.25);
    }
    else
    {
        xOff[0] = number_approach_smooth(xOff[0], 0, 0.5, 0.25);
        xOff[1] = number_approach_smooth(xOff[1], 0, 0.5, 0.25);
        xOff[2] = number_approach_smooth(xOff[2], 0, 0.5, 0.25);
        xOff[3] = number_approach_smooth(xOff[3], 0, 0.5, 0.25);
    }
    
    yOff = [sin(siner) * 4, sin(siner + 1) * 4, sin(siner + 2) * 4, sin(siner + 2.5) * 2];
}

if (attackType == 1 && attackStage == 3)
{
    var xL = x - 20;
    var xR = (x < 0) ? 640 : (x + 640);
    draw_primitive_begin(pr_trianglestrip);
    draw_vertex_color(xL, y + 50, c_ltgray, headlightAlpha);
    draw_vertex_color(xL, y + 90, c_ltgray, headlightAlpha);
    draw_vertex_color(xR, max(y + 20, obj_battlemanager.boxY1), c_ltgray, headlightAlpha);
    draw_vertex_color(xR, min(y + 84, obj_battlemanager.boxY2), c_ltgray, headlightAlpha);
    draw_primitive_end();
}

draw_sprite_ext(spr_butchy, 3, x + ((63 + xOff[0]) * image_xscale), y + yOff[0], image_xscale, 2, 0, image_blend, image_alpha);
draw_sprite_ext(spr_butchy, 2, x + ((50 + xOff[1]) * image_xscale), y + yOff[1], image_xscale, 2, 0, image_blend, image_alpha);
draw_sprite_ext(spr_butchy, 1, x + ((37 + xOff[2]) * image_xscale), y + yOff[2], image_xscale, 2, 0, image_blend, image_alpha);
draw_sprite_ext(spr_butchy, (vpunk >= 1) ? 5 : ((spared || shaking) ? 4 : 0), x + ((headShake + xOff[3]) * image_xscale), y + yOff[3], image_xscale, 2, 0, image_blend, image_alpha);
