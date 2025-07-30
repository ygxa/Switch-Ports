for (var i = 0; room_exists(i); i++)
    global.roomlist[i] = room_get_name(i);

function sh_escape(argument0)
{
    var arg0 = string(argument0[1]);
    var arg1 = argument0[2];
    var arg2 = argument0[3];
    
    switch (arg0)
    {
        case "true":
        case "1":
            arg0 = true;
            break;
        
        case "false":
        case "0":
            arg0 = false;
            break;
        
        default:
            arg0 = !global.panic;
            break;
    }
    
    global.panic = arg0;
    global.minutes = real(string_digits(arg1));
    global.seconds = real(string_digits(arg2));
    global.wave = 0;
    global.maxwave = ((global.minutes * 60) + global.seconds) * 60;
    obj_camera.alarm[1] = 60;
    
    if (!instance_exists(obj_panicchanger))
        instance_create(x, y, obj_panicchanger);
}

function meta_escape()
{
    return 
    {
        description: "activates escape and sets escape time",
        arguments: ["<bool>", "<min>", "<sec>"],
        suggestions: [["true", "false"], [], []],
        argumentDescriptions: ["activate/deactivate escape", "set minutes", "set seconds"]
    };
}

function sh_toggle_collisions(argument0)
{
    var arg1 = argument0[1];
    
    switch (arg1)
    {
        case "true":
        case "1":
            arg1 = true;
            break;
        
        case "false":
        case "0":
            arg1 = false;
            break;
        
        default:
            arg1 = !global.showcollisions;
            break;
    }
    
    global.showcollisions = arg1;
    toggle_collision_function();
}

function meta_toggle_collisions()
{
    return 
    {
        description: "toggles collision object visibility",
        arguments: ["<bool>"],
        suggestions: [["true", "false"]],
        argumentDescriptions: ["toggles visibility"]
    };
}

function toggle_collision_function()
{
    if (!variable_global_exists("showcollisionarray"))
    {
        i = 0;
        global.showcollisionarray[i++] = 143;
        global.showcollisionarray[i++] = 48;
        global.showcollisionarray[i++] = 232;
        global.showcollisionarray[i++] = 261;
        global.showcollisionarray[i++] = 264;
        global.showcollisionarray[i++] = 24;
        global.showcollisionarray[i++] = 257;
        global.showcollisionarray[i++] = 108;
        global.showcollisionarray[i++] = 133;
        global.showcollisionarray[i++] = 136;
        global.showcollisionarray[i++] = 324;
        global.showcollisionarray[i++] = 99;
        global.showcollisionarray[i++] = 15;
        global.showcollisionarray[i++] = 195;
        global.showcollisionarray[i++] = 26;
        global.showcollisionarray[i++] = 58;
        global.showcollisionarray[i++] = 238;
        global.showcollisionarray[i++] = 85;
        global.showcollisionarray[i++] = 49;
        global.showcollisionarray[i++] = 56;
        global.showcollisionarray[i++] = 2;
        global.showcollisionarray[i++] = 235;
        global.showcollisionarray[i++] = 236;
        global.showcollisionarray[i++] = 237;
        global.showcollisionarray[i++] = 87;
        global.showcollisionarray[i++] = 72;
        global.showcollisionarray[i++] = 36;
    }
    
    var array = global.showcollisionarray;
    var length = array_length(array);
    var i = length - 1;
    
    while (i >= 0)
    {
        with (array[i])
        {
            if (object_index == array[i])
            {
                visible = global.showcollisions;
                image_alpha = 0.6;
            }
        }
        
        i--;
    }
}

function sh_toggle_debugmode(argument0)
{
    var arg1 = argument0[1];
    
    switch (arg1)
    {
        case "true":
        case "1":
            arg1 = true;
            break;
        
        case "false":
        case "0":
            arg1 = false;
            break;
        
        default:
            arg1 = !global.debugmode;
            break;
    }
    
    global.debugmode = arg1;
}

function meta_toggle_debugmode()
{
    return 
    {
        description: "toggles debugmode",
        arguments: ["<bool>"],
        suggestions: [["true", "false"]],
        argumentDescriptions: ["toggles debugmode"]
    };
}

function sh_room_goto(argument0)
{
    var arg1 = asset_get_index(argument0[1]);
    var arg2 = argument0[2];
    
    if (asset_get_type(argument0[1]) != 3)
        return "Can't find room " + string(argument0[1]);
    
    if (asset_get_type(argument0[1]) == 3)
    {
        obj_player.targetRoom = arg1;
        obj_player.targetDoor = arg2;
        instance_create(0, 0, obj_fadeout);
    }
}

function meta_room_goto()
{
    return 
    {
        description: "allows you to go to another room",
        arguments: ["<room>", "<door>"],
        suggestions: [global.roomlist, ["N/A", "A", "B", "C", "D", "E", "P", "S"]],
        argumentDescriptions: ["sets targetRoom", "sets targetDoor"]
    };
}

function sh_instance_create(argument0)
{
    instance_create(argument0[1], argument0[2], asset_get_index(argument0[3]));
}

function meta_instance_create()
{
    return 
    {
        description: "create an object",
        arguments: ["<x>", "<y>", "<object>"],
        suggestions: [[], [], []],
        argumentDescriptions: ["the X coordinate to create the object at", "the Y coordinate to create the object at", "the object to create"]
    };
}
