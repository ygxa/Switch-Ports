function concat()
{
    var _string = "";
    
    for (var i = 0; i < argument_count; i++)
        _string += string(argument[i]);
    
    return _string;
}

if (instance_number(object_index) > 1)
{
    instance_destroy();
    exit;
}

levels = [steamy_secret_1,steamy_secret_2,steamy_secret_3,entryway_secret_1,entryway_secret_2,entryway_secret_3,
molasses_secret_1,molasses_secret_2,molasses_secret_3,mineshaft_secret_1,mineshaft_secret_2,mineshaft_secret_3]
selected = false;
selected_level = -4;
minutes = 0;
seconds = 0;
start = false;
startstate = 1;
depth = -999;
