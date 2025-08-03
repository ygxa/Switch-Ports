if (isMiss)
{
    draw_sprite(lang_get_sprite(spr_battlemiss), 0, x, y);
}
else
{
    var blend = (isHeal == true) ? 65280 : 255;
    
    for (var i = 0; i < damageLength; i++)
        draw_sprite_ext(spr_battledmgnum, damageIndices[damageLength - i - 1], (x - damageLeftSub) + (i * 32), y, 1, 1, 0, blend, 1);
    
    var _w2 = floor(width * 0.5);
    var _x1 = x - _w2;
    var _y1 = ystart + 8;
    var _x2 = x + _w2;
    var _y2 = ystart + 20;
    var _surfW = _x2 - _x1;
    var _surfH = _y2 - _y1;
    
    if (width != prevWidth)
    {
        surface_free(surface);
        prevWidth = width;
    }
    
    if (surface == -1 || !surface_exists(surface))
    {
        var _realSurfW = 1;
        var _realSurfH = 1;
        
        while (_realSurfW < _surfW)
            _realSurfW = _realSurfW << 1;
        
        while (_realSurfH < _surfH)
            _realSurfH = _realSurfH << 1;
        
        surface = surface_create(_realSurfW, _realSurfH);
    }
    
    surface_set_target(surface);
    draw_clear_alpha(c_black, 0);
    var _xbreak = floor(_surfW * (max(minHpDisplay, monsterHpApparent) / monsterHpMax));
    draw_rectangle_pix(_xbreak, 0, _surfW - _xbreak, _surfH, 4210752, 1);
    
    if (_xbreak > 0)
        draw_rectangle_pix(0, 0, _xbreak, _surfH, 65280, 1);
    
    if (global.uiborder != spr_menuparts_ut)
    {
        gpu_set_blendmode(bm_subtract);
        draw_sprite(spr_roundhp_enemy, 0, 0, 0);
        draw_sprite(spr_roundhp_enemy, 1, _surfW - 4, 0);
        draw_sprite(spr_roundhp_enemy, 2, _surfW - 4, _surfH - 4);
        draw_sprite(spr_roundhp_enemy, 3, 0, _surfH - 4);
        gpu_set_blendmode(bm_normal);
    }
    
    surface_reset_target();
    gpu_set_fog(true, c_black, 0, 0);
    draw_surface(surface, _x1 - 1, _y1 - 1);
    draw_surface(surface, _x1 + 1, _y1 - 1);
    draw_surface(surface, _x1 - 1, _y1 + 1);
    draw_surface(surface, _x1 + 1, _y1 + 1);
    gpu_set_fog(false, c_black, 0, 0);
    draw_surface(surface, _x1, _y1);
}
