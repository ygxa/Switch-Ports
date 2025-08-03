if (tempDrawFunction != undefined)
    tempDrawFunction();
else if (instance_exists(obj_alphys_monitor))
    draw_self_inbox(obj_alphys_monitor.x - 18, obj_alphys_monitor.y + 34, obj_alphys_monitor.x + 18, obj_alphys_monitor.y + 58);
else
    draw_self();
