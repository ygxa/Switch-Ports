if (surface_exists(guisurf))
    surface_free(guisurf);

if (surface_exists(finalsurf))
    surface_free(finalsurf);

if (surface_exists(newssurf))
    surface_free(newssurf);

ds_map_destroy(global.inputs);
global.inputs = -1;
font_delete(global.font);
font_delete(global.thinfont);
font_delete(global.smallfont);
font_delete(global.smallerfont);
font_delete(global.smallnumber);
font_delete(global.collectfont);
font_delete(global.scorefont);
font_delete(global.combofont);
font_delete(global.nohitfont);
font_delete(global.speedruntimerfont);
font_delete(global.keyfont);
font_delete(global.npcdialoguefont);
font_delete(global.npcnamefont);
font_delete(global.manualfont);
ds_map_destroy(secretlayers);
