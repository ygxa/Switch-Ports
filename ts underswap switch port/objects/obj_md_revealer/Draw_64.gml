if (global.lowvfx)
    exit;

if (dio && state != 2)
{
    draw_sprite(spr_md_actionlines, floor(actionFrame), 0, 0);
    var s = sin(actionSizer);
    draw_sprite_ext(lang_get_sprite(spr_md_actiondummy), 0, 510, 350, 1 + (s * 0.125), 1 + (cos(actionSizer) / 6), 3 * s, c_white, 1);
    draw_sprite_ext(lang_get_sprite(spr_md_actiondummy), 0, 80 + irandom(10), 260 + irandom(10), 1, 1, 0, c_white, 1);
    draw_sprite_ext(lang_get_sprite(spr_md_actiondummy), 0, 370, 50, 0.5, 0.5, actionRot, c_white, 1);
    actionFrame += 0.3;
    actionSizer += 0.2;
    actionRot += 15;
    
    if (actionRot >= 360)
        actionRot -= 360;
}
