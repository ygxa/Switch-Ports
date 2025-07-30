searchfor = "";
files = [];
page = 0;
theotherway = false;
var file_name = file_find_first("Demos/" + searchfor + "*.demrec", 0);

while (file_name != "")
{
    array_push(files, file_name);
    file_name = file_find_next();
}

file_find_close();
var leng = array_length(files);

if (leng > 12)
    leng = 12;

for (var i = 0; i < leng; i++)
{
    var loadto = other.files[i];
    
    with (instance_create_depth(32, 69 + (i * 34), -100, obj_button))
    {
        image_xscale = 795;
        image_yscale = 31;
        hastoappear = true;
        timetoappear = i;
        name = "Load: \"" + loadto + "\"?";
        file = loadto;
        
        func = function()
        {
            with (obj_console)
                exec_command(["demrec_load", "Demos/" + other.file]);
        };
    }
    
    with (instance_create_depth(832, 70 + (i * 34), -100, obj_button))
    {
        image_xscale = 96;
        image_yscale = 29;
        name = "Delete";
        file = loadto;
        
        func = function()
        {
            if (show_question("Do you wish to delete this recording?"))
            {
                file_delete("Demos/" + file);
                obj_demrecloader.alarm[0] = 1;
            }
        };
    }
}
