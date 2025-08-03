if (state == 0)
    image_angle = number_approach_smooth(image_angle, targetDir, 0.3, 0.5);
else if (x < (camera_get_view_x(view_camera[0]) - 20))
    instance_destroy();
else if (x > (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 80))
    instance_destroy();
else if (y < (camera_get_view_y(view_camera[0]) - 20))
    instance_destroy();
else if (y > (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 20))
    instance_destroy();
