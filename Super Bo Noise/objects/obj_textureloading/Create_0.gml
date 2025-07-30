global.resolutions[0] = [[480, 270], [960, 540], [1024, 576], [1280, 720], [1600, 900], [1920, 1080]];
global.resolutions[1] = [[640, 480], [800, 600], [1024, 768], [1152, 864], [1440, 1080]];

scr_init_options();
tex_list = -4;
draw_flush();
var group_arr = ["playergroup", "baddiegroup", "hubgroup", "hudgroup", "structuregroup"];
tex_list = ds_list_create();
tex_pos = 0;

for (var i = 0; i < array_length(group_arr); i++)
{
    var _tex_array = texturegroup_get_textures(group_arr[i]);
    ds_list_add(tex_list, _tex_array);
}

tex_max = ds_list_size(tex_list);
alarm[0] = 70;
