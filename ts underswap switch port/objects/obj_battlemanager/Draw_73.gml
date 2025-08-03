if (boxCutoff)
{
    if (boxSurfaceCutoff == -1 || !surface_exists(boxSurfaceCutoff))
        boxSurfaceCutoff = surface_create(1024, 1024);
    
    surface_set_target(boxSurfaceCutoff);
    draw_clear_alpha(c_black, 0);
    boxCurrentlyDrawing = true;
    count = ds_list_size(boxObjectsCutoff);
    
    for (var i = 0; i < count; i++)
    {
        with (ds_list_find_value(boxObjectsCutoff, i))
            event_perform(ev_draw, ev_draw_normal);
    }
    
    ds_list_clear(boxObjectsCutoff);
    boxCurrentlyDrawing = false;
    surface_reset_target();
}
else if (boxSurfaceCutoff != -1 && surface_exists(boxSurfaceCutoff))
{
    surface_free(boxSurfaceCutoff);
    boxSurfaceCutoff = -1;
}

if (boxTransform)
{
    if (darkenAlpha != 0)
        draw_rectangle_pix(0, 0, 640, 480, 0, darkenAlpha);
    
    if (boxSurfaceTransform == -1 || !surface_exists(boxSurfaceTransform))
        boxSurfaceTransform = surface_create(1024, 1024);
    
    surface_set_target(boxSurfaceTransform);
    draw_clear_alpha(c_black, 0);
    boxCurrentlyDrawing = true;
    draw_menu_rectangle(boxX1, boxY1, boxX2, boxY2, 1, 9);
    
    with (obj_battleheart_purple)
        drawRows();
    
    count = ds_list_size(boxObjectsTransform);
    var bm = gpu_get_blendmode_ext_sepalpha();
    gpu_set_blendmode_ext_sepalpha(bm[0], bm[1], bm_one, bm_one);
    
    for (var i = 0; i < count; i++)
    {
        with (ds_list_find_value(boxObjectsTransform, i))
            event_perform(ev_draw, ev_draw_normal);
    }
    
    gpu_set_blendmode_ext_sepalpha(bm[0], bm[1], bm[2], bm[3]);
    ds_list_clear(boxObjectsTransform);
    
    if (boxCutoff)
    {
        var _x1 = boxX1 + 5;
        var _x2 = boxX2 - 5;
        var _y1 = boxY1 + 5;
        var _y2 = boxY2 - 5;
        draw_surface_part(boxSurfaceCutoff, _x1, _y1, _x2 - _x1, _y2 - _y1, _x1, _y1);
        
        if (global.debug)
        {
            if (obj_debugger.hitboxes)
            {
                draw_surface_part_ext(boxSurfaceCutoff, 0, 0, 640, _y1, 0, 0, 1, 1, 255, 0.5);
                draw_surface_part_ext(boxSurfaceCutoff, 0, _y1, _x1, _y2 - _y1, 0, _y1, 1, 1, 255, 0.5);
                draw_surface_part_ext(boxSurfaceCutoff, _x2, _y1, 640 - _x2, _y2 - _y1, _x2, _y1, 1, 1, 255, 0.5);
                draw_surface_part_ext(boxSurfaceCutoff, 0, _y2, 640, 480 - _y2, 0, _y2, 1, 1, 255, 0.5);
            }
        }
    }
    
    boxCurrentlyDrawing = false;
    surface_reset_target();
    var boxCenterX = (boxX2 + boxX1 + boxAngleXCenterOffset) * 0.5;
    var boxCenterY = (boxY2 + boxY1 + boxAngleYCenterOffset) * 0.5;
    var angle = boxAngle;
    var translateX = boxTranslateX;
    var translateY = boxTranslateY;
    
    if (global.lowvfx)
    {
        angle *= 0.1;
        translateX *= 0.7;
        translateY *= 0.7;
    }
    
    angle += boxAngleForced;
    var c = dcos(angle);
    var s = dsin(angle);
    draw_surface_ext(boxSurfaceTransform, (boxCenterX - (boxCenterX * c) - (boxCenterY * s)) + translateX, ((boxCenterY + (boxCenterX * s)) - (boxCenterY * c)) + translateY, 1, 1, angle, c_white, 1);
}
else if (boxCutoff)
{
    var _x1 = boxX1 + 5;
    var _x2 = boxX2 - 5;
    var _y1 = boxY1 + 5;
    var _y2 = boxY2 - 5;
    draw_surface_part(boxSurfaceCutoff, _x1, _y1, _x2 - _x1, _y2 - _y1, _x1, _y1);
    
    if (global.debug)
    {
        if (obj_debugger.hitboxes)
        {
            draw_surface_part_ext(boxSurfaceCutoff, 0, 0, 640, _y1, 0, 0, 1, 1, 255, 0.5);
            draw_surface_part_ext(boxSurfaceCutoff, 0, _y1, _x1, _y2 - _y1, 0, _y1, 1, 1, 255, 0.5);
            draw_surface_part_ext(boxSurfaceCutoff, _x2, _y1, 640 - _x2, _y2 - _y1, _x2, _y1, 1, 1, 255, 0.5);
            draw_surface_part_ext(boxSurfaceCutoff, 0, _y2, 640, 480 - _y2, 0, _y2, 1, 1, 255, 0.5);
        }
    }
}

boxCurrentlyDrawing = true;
var count = ds_list_size(boxObjectsPost);

for (var i = 0; i < count; i++)
{
    with (ds_list_find_value(boxObjectsPost, i))
        event_perform(ev_draw, ev_draw_normal);
}

ds_list_clear(boxObjectsPost);
boxCurrentlyDrawing = false;
boxCutoff = false;
