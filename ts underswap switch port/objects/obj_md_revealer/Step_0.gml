if (state == 1)
{
    if (internalEnd)
        state = 2;
}
else if (state == 2)
{
    var cam = view_get_camera(0);
    var _x = camera_get_view_x(cam);
    var _y = camera_get_view_y(cam);
    var _w = camera_get_view_width(cam);
    var _h = camera_get_view_height(cam);
    
    if (_w != 640 || _h != 480 || _x != 0 || _y != 0)
    {
        camera_set_view_pos(cam, number_approach_smooth(_x, 0, 0.2, 5), number_approach_smooth(_y, 0, 0.2, 5));
        camera_set_view_size(cam, number_approach_smooth(_w, 640, 0.2, 5), number_approach_smooth(_h, 480, 0.2, 5));
    }
    else
    {
        if (global.flush_textures)
            texture_flush("bigtemp");
        
        music_lcplay("dummyencounter", true);
        obj_gamemanager.customViewMode = false;
        obj_md_monster.state = (1 << 0);
        scene_resume();
        instance_destroy();
    }
}
