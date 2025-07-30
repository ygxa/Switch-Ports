special = true;
name = ">";

func = function()
{
    obj_demrecloader.page++;
    
    if (obj_demrecloader.page < 0)
        obj_demrecloader.page = 0;
    
    obj_demrecloader.alarm[0] = 1;
};
