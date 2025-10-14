// Note added by UTMTCE: "GMS2.3 object function definitions" has been automatically enabled
image_speed = 0.5
credTime = -1
final = false
finalAlpha = 0
finaleBuffer = 300
creditIndex = -1
hurryUp = false
creditSpeed = 0.005
creditArr = []
thrownArr = []
tomatoArr = []
cheerArr = []
completed = false
threwCheer = false
tomatoBuffer = 0
cheerBuffer = 0
endAlpha = 0
instance_create(-100, -100, obj_cursorSpecial)
with (obj_player1)
{
    state = (114 << 0)
    x = -100
    y = -100
}
addCredit = function(argument0, argument1, argument2) //anon@598@gml_Object_obj_credits_Create_0
{
    if (argument2 == undefined)
        argument2 = undefined
    var c = new creditEntry(argument1, argument0)
    if (!is_undefined(argument2))
        c.func = method(c, argument2)
    array_push(creditArr, c)
    return c;
}

addTomato = function(argument0, argument1) //anon@822@gml_Object_obj_credits_Create_0
{
    if (threwCheer == false)
        threwCheer = true
    var t = new creditTomato(argument0, argument1)
    array_push(tomatoArr, t)
    array_push(thrownArr, t)
}

addCheer = function(argument0, argument1) //anon@1020@gml_Object_obj_credits_Create_0
{
    var c = new creditCheer(argument0, argument1)
    array_push(cheerArr, c)
    array_push(thrownArr, c)
}

creditEntry = function(argument0, argument1, argument2) constructor //anon@1173@gml_Object_obj_credits_Create_0
{
    if (argument2 == undefined)
        argument2 = undefined
    sprite_index = argument0
    image_xscale = 1
    image_yscale = 1
    image_angle = 0
    image_alpha = 0
    image_index = 0
    image_blend = c_white
    x = 960 / 2
    y = 540 / 2
    xstart = x
    ystart = y
    func = argument2
    arg_arr = []
    index = argument1
    step = function() //anon@1517@anon@1173_gml_Object_obj_credits_Create_0
    {
        var spd = 0.02 * (obj_credits.hurryUp ? 4 : 1)
        if (index != obj_credits.creditIndex)
            image_alpha = approach(image_alpha, 0, spd)
        else
            image_alpha = approach(image_alpha, 1, spd)
        if ((!is_undefined(func)) && floor(obj_credits.creditIndex) == floor(index))
            self.func(arg_arr)
    }

    draw = function() //anon@1947@anon@1173_gml_Object_obj_credits_Create_0
    {
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
    }

}

creditTomato = function(argument0, argument1) constructor //anon@2130@gml_Object_obj_credits_Create_0
{
    x = argument0
    y = argument1
    xstart = argument0
    ystart = argument1
    image_xscale = 4
    image_yscale = 4
    velocity = random_range(0.2, 0.5)
    angvelocity = random_range(-5, 5)
    image_angle = random_range(0, 360)
    splat = false
    image_alpha = 1
    image_index = chance(1)
    draw = function() //anon@2443@anon@2130_gml_Object_obj_credits_Create_0
    {
        if splat
        {
            y += (2 * velocity * (obj_credits.hurryUp ? 4 : 1))
            image_alpha = approach(image_alpha, 0, (0.005 * (obj_credits.hurryUp ? 4 : 1)))
            draw_sprite_ext(spr_tomatoSplat, image_index, xstart, (ystart - 48), 1, ((y - ystart) / 96 + 1), 0, c_white, image_alpha)
        }
        else
        {
            image_xscale = approach(image_xscale, 1, velocity)
            image_yscale = approach(image_yscale, 1, velocity)
            image_angle += (angvelocity * (obj_credits.hurryUp ? 4 : 1))
            if (image_xscale <= 1)
            {
               
                splat = true
            }
        }
        draw_sprite_ext(spr_tomato, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha)
    }

}

creditCheer = function(argument0, argument1) constructor //anon@3256@gml_Object_obj_credits_Create_0
{
    x = argument0
    y = argument1
    xstart = argument0
    ystart = argument1
    image_xscale = 4
    image_yscale = 4
    velocity = random_range(0.2, 0.5)
    angvelocity = random_range(-5, 5)
    image_angle = random_range(0, 360)
    splat = false
    image_alpha = 1
    image_index = 0
    draw = function() //anon@3553@anon@3256_gml_Object_obj_credits_Create_0
    {
        if splat
        {
            y += (2 * velocity * (obj_credits.hurryUp ? 4 : 1))
            image_alpha = approach(image_alpha, 0, (0.005 * (obj_credits.hurryUp ? 4 : 1)))
            draw_sprite_ext(spr_cheerTucTrail, image_index, xstart, ystart, 1, 1, image_angle, c_white, image_alpha)
        }
        else
        {
            image_xscale = approach(image_xscale, 1, velocity)
            image_yscale = approach(image_yscale, 1, velocity)
            image_angle += (angvelocity * (obj_credits.hurryUp ? 4 : 1))
            if (image_xscale <= 1)
            {
                splat = true
                image_index = 1
                scr_soundeffect(sfx_stompenemy)
            }
        }
        draw_sprite_ext(spr_cheerTuc, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha)
    }

}

event_user(0)
