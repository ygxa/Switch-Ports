if (global.debug && obj_debugger.gameSpeed == 9999)
    obj_debugger.gameSpeed = 30;

dx_scene("star.rm23");
layer_set_visible(layer_get_id("Gate_Opening"), false);
layer_set_visible(layer_get_id("Gate_Opened"), true);
