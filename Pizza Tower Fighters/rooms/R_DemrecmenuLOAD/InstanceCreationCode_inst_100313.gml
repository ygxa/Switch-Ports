special = true;
name = "Search";

func = function()
{
    obj_demrecloader.alarm[0] = 1;
};

stepfunc = function()
{
    if (keyboard_check_pressed(vk_enter))
        func();
};
