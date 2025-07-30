with (obj_button)
{
    if (!special)
    {
        var yy = y;
        var otherway = other.theotherway;
        
        with (instance_create_depth(other.x, yy, other.depth, obj_buttonunpressable))
        {
            theotherway = otherway;
            name = other.name;
            image_xscale = other.image_xscale;
            image_yscale = other.image_yscale;
            
            stepfunc = function()
            {
                if (theotherway)
                {
                    x += 50;
                    
                    if (x >= (xstart + 960))
                        instance_destroy();
                }
                else
                {
                    x -= 50;
                    
                    if (x <= (xstart - 960))
                        instance_destroy();
                }
            };
        }
        
        instance_destroy();
    }
}

searchfor = obj_typepart.textout;
files = [];
var file_name = file_find_first("Demos/" + searchfor + "*.demrec", 0);

while (file_name != "")
{
    array_push(files, file_name);
    file_name = file_find_next();
}

file_find_close();
show_debug_message(files);
var leng = array_length(files);

if (leng > 12)
    leng = 12;

var offset = 12 * page;

while ((leng + offset) > array_length(files))
    leng--;

for (var i = offset; i < (leng + offset); i++)
{
    var loadto = other.files[i];
    var otherway = other.theotherway;
    
    with (instance_create_depth(32, 69 + ((i - offset) * 34), -100, obj_button))
    {
        theotherway = otherway;
        
        if (!theotherway)
            x += 960;
        else
            x -= 960;
        
        image_xscale = 795;
        image_yscale = 31;
        hastoappear = true;
        timetoappear = i;
        name = "Load: \"" + loadto + "\"?";
        file = other.files[i];
        
        func = function()
        {
            exec_command(["demrec_load", "Demos/" + file]);
        };
        
        stepfunc = function()
        {
            x = approach(x, xstart, 50);
        };
    }
    
    with (instance_create_depth(832, 70 + ((i - offset) * 34), -100, obj_button))
    {
        theotherway = otherway;
        
        if (!theotherway)
            x += 960;
        else
            x -= 960;
        
        image_xscale = 96;
        image_yscale = 29;
        name = "Delete";
        file = other.files[i];
        
        func = function()
        {
            if (show_question("Do you want to delete this recording?"))
            {
                file_delete("Demos/" + file);
                obj_demrecloader.alarm[0] = 1;
            }
        };
        
        stepfunc = function()
        {
            x = approach(x, xstart, 50);
        };
    }
}

theotherway = false;
