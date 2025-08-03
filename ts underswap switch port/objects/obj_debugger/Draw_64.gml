if (reloading)
{
    draw_set_font(fnt_main);
    draw_set_color(c_red);
    draw_set_halign(fa_left);
    draw_text_transformed(2, 2, "Reloading...", 0.5, 0.5, 0);
    exit;
}

obj_gamemanager.setGuiSurface();

if (buffer > 0)
{
    buffer--;
    label = true;
}

if (label)
{
    draw_set_font(fnt_main);
    draw_set_color(c_yellow);
    draw_set_halign(fa_left);
    draw_text_transformed(2, 2, "DEBUG", 0.5, 0.5, 0);
    
    if (labelMore)
    {
        draw_text_transformed(2, 28, "Instances: " + _string(instance_count), 0.5, 0.5, 0);
        draw_text_transformed(2, 42, "Music streams: " + _string(instance_number(obj_musicstream)), 0.5, 0.5, 0);
        draw_text_transformed(2, 56, "Room: " + room_get_name(room), 0.5, 0.5, 0);
        draw_text_transformed(2, 70, "Area: " + _string(global.currentarea), 0.5, 0.5, 0);
        draw_text_transformed(2, 84, "Pop: " + _string(global.areapopulations[(global.currentarea < 0) ? 0 : global.currentarea]), 0.5, 0.5, 0);
        draw_text_transformed(2, 98, "Tempflag: " + _string(global.tempflag), 0.5, 0.5, 0);
    }
}

if (objectDebug)
{
    var str = "";
    
    if (objectDebugOverlays)
    {
        str += "Using overlays (1)\nOrigin: ";
        
        switch (objectDebugRelative)
        {
            case (0 << 0):
                str += "Room (Bksp)";
                break;
            
            case (1 << 0):
                str += "Camera (Bksp)";
                break;
            
            case (2 << 0):
                str += "Start (Bksp)";
                break;
        }
    }
    else
    {
        str += "No overlays (1)";
    }
    
    if (objectDebugAlign)
        str += "\nAligning (2)";
    else
        str += "\nNot aligning (2)";
    
    with (objectDebugSelected)
        str += _string("\nSelected: {0}\n          at {1}, {2}", object_get_name(object_index), x, y);
    
    if (objectDebugCamera)
        str += _string("\nFreecam (WASD) at {0}, {1}\n(RMB)", camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]));
    else
        str += "\nFreecam off (RMB)";
    
    if (objectDebugClipboard != "")
        str += "\nClipboard copy (Tab)";
    
    if (objectDebugHovering)
        str += "\nTrack variable (/)";
    
    if (keyboard_check(vk_alt))
        str += _string("\nMouse pos in room: {0}, {1}", mouse_x, mouse_y);
    
    draw_set_font(fnt_mainsm);
    draw_rectangle_pix(0, 0, max(200, string_width(str) + 16), max(100, string_height(str) + 16), 0, 0.6);
    draw_set_color(c_aqua);
    draw_text(8, 8, str);
}
else if (faceDebug)
{
    draw_rectangle_pix(0, 0, 640, 480, 0, 0.8);
    var len = array_length(faceArray);
    var ind = floor(faceIndex);
    
    for (var i = 0; i < len; i++)
    {
        var curr = faceArray[i];
        draw_sprite(curr[0], ind, curr[1], curr[2]);
    }
    
    draw_set_color(c_white);
    draw_set_font(fnt_main);
    draw_set_valign(fa_bottom);
    draw_text(8, 472, faceInfo);
    draw_set_valign(fa_top);
    
    if (faceHovering != undefined)
        draw_rectangle(faceHovering[3], faceHovering[4], faceHovering[5], faceHovering[6], true);
}

surface_reset_target();
