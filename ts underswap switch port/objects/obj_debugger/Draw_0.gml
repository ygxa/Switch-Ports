var doHitboxRender = true;
var doDebugOverlay = true;

if (hitboxes)
{
    if (room == rm_battle && obj_battlemanager.boxTransform)
    {
        if (bt_set_surface_transform())
            doHitboxRender = false;
        else
            doDebugOverlay = false;
    }
    
    if (doHitboxRender)
    {
        draw_set_color(c_red);
        
        with (obj_bullet_parent)
            draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
        
        draw_set_color(c_blue);
        
        with (obj_interactable_parent)
            draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
        
        with (obj_cb_platform)
            draw_rectangle((x - len) + 2, y + 2, (x + len) - 2, y - 4, true);
        
        with (obj_dodgemode_handler)
        {
            with (obj_player)
            {
                draw_set_color(c_lime);
                draw_set_alpha(0.5);
                draw_rectangle(x + -4, y + 0, x + 4, y + 8, false);
                draw_set_alpha(1);
            }
        }
        
        for (var i = 0; i < array_length(debugLineDraws); i++)
        {
            draw_set_color(c_red);
            var l = debugLineDraws[i];
            draw_line_pix(l[0], l[1], l[2], l[3]);
            draw_set_color(c_white);
        }
        
        if (keyboard_check(vk_f3))
        {
            draw_set_color(c_lime);
            
            with (all)
            {
                if (!visible)
                    continue;
                
                if (depth > 0 || depth < -room_height)
                    continue;
                
                draw_line_pix(bbox_left, -depth, bbox_right, -depth);
            }
        }
        
        draw_set_color(c_white);
    }
}

if (objectDebug && objectDebugOverlays && doDebugOverlay)
{
    var camX = camera_get_view_x(view_camera[0]);
    var camY = camera_get_view_y(view_camera[0]);
    var scaleX = camera_get_view_width(view_camera[0]) / 640;
    var scaleY = camera_get_view_height(view_camera[0]) / 480;
    draw_set_alpha(0.6);
    
    for (var i = 0; i < instance_count; i++)
    {
        with (instance_id_get(i))
        {
            if (visible && !persistent && sprite_index != -1)
            {
                var _x, _y;
                
                switch (other.objectDebugRelative)
                {
                    case (0 << 0):
                        _x = _string(x);
                        _y = _string(y);
                        break;
                    
                    case (1 << 0):
                        _x = _string(x - camX);
                        _y = _string(y - camY);
                        break;
                    
                    case (2 << 0):
                        _x = _string(x - xstart);
                        _y = _string(y - ystart);
                        break;
                }
                
                draw_set_font(fnt_mainsm);
                draw_set_color(c_black);
                var str = object_get_name(object_index) + "\n" + _x + ", " + _y;
                
                if (variable_instance_exists(id, "___TRACK_VARIABLE___"))
                {
                    for (var j = 0; j < array_length(___TRACK_VARIABLE___); j++)
                        str += ("\n" + ___TRACK_VARIABLE___[j] + ": " + _string(variable_instance_get(id, ___TRACK_VARIABLE___[j])));
                }
                
                var vert = (string_count("\n", str) + 1) * 16;
                draw_rectangle(x - (4 * scaleX), y - (vert * scaleY), x + (string_width(str) * scaleX), y, false);
                draw_set_color(c_aqua);
                draw_text_transformed(x, y - (vert * scaleY), str, scaleX, scaleY, 0);
                draw_set_color(c_red);
                draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
            }
        }
    }
    
    draw_set_color(c_white);
    draw_set_alpha(1);
}

debugLineDraws = [];
