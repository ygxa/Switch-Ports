function get_control_sprite(argument0) //get_control_sprite
{
    var icon = scr_input_get_icon(argument0)
    var str = string("[{0}]", (sprite_get_name(icon[0]) + "," + string(floor(icon[1]))))
    return str;
}

function scr_queueToolTipPrompt(argument0, argument1, argument2) //scr_queueToolTipPrompt
{
    if (argument0 == undefined)
        argument0 = ""
    if (argument1 == undefined)
        argument1 = argument0
    if (argument2 == undefined)
        argument2 = string_length(argument0) * 15
    argument2 = clamp(argument2, 60, 450)
    var type = 0
    if (argument1 == -4)
        type = 1
    else if (argument1 == -1)
        type = 2
    with (obj_tv)
    {
        if (type != 2)
        {
            if ((!(ds_list_find_index(global.saveroom, argument1))) || type == 1)
            {
                global.ControlPrompt = argument0
                promptTimer = argument2
                ds_list_add(global.saveroom, argument1)
            }
        }
        else
        {
            global.ControlPrompt = argument0
            promptTimer = 2
        }
    }
    return argument2;
}

function scr_setTransfoTip(argument0) //scr_setTransfoTip
{
    switch argument0
    {
        case (271 << 0):
        case (272 << 0):
        case (273 << 0):
        case (270 << 0):
            global.TransfoPrompt = string("[fa_middle][spr_transfopromptfont]{0} Move {1} Dash", (get_control_sprite("right") + get_control_sprite("left") + get_control_sprite("up") + get_control_sprite("down")), get_control_sprite("slap"))
            break
        default:
            global.TransfoPrompt = ""
            break
    }

    return global.TransfoPrompt;
}

