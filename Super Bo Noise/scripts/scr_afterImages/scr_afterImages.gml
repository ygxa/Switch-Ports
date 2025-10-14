global.AftImgColorDefinitions[(0 << 0)] = 
{
    light: [16777215],
    dark: [0]
}

global.AftImgColorDefinitions[(1 << 0)] = 
{
    light: [16777215],
    dark: [0]
}

global.AftImgColorDefinitions[(2 << 0)] = 
{
    light: [14717951, 8446200],
    dark: [3670136, 10344]
}

global.AftImgColorDefinitions[(3 << 0)] = 
{
    light: [12512],
    dark: [64]
}

global.AftImgColorDefinitions[(4 << 0)] = 
{
    light: [12512],
    dark: [12512]
}

global.AftImgColorDefinitions[(5 << 0)] = 
{
    light: [16292088],
    dark: [4726800]
}

global.AftImgColorDefinitions[(6 << 0)] = 
{
    light: [16292088],
    dark: [16292088]
}

global.AftImgColorDefinitions[(7 << 0)] = 
{
    light: [12512],
    dark: [12512]
}

function afterimage_create(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) //afterimage_create
{
    if (argument5 == undefined)
        argument5 = 1
    if (argument6 == undefined)
        argument6 = 15
    if (argument7 == undefined)
        argument7 = false
    if (argument8 == undefined)
        argument8 = id
    var struc = 
    {
        afterImageType: argument0,
        x: argument1,
        y: argument2,
        sprite_index: argument3,
        image_index: argument4,
        lifeTime: argument6,
        doesBlink: argument7,
        image_blend: global.AftImgColorDefinitions[argument0],
        afterImageIndex: 0,
        image_xscale: argument5,
        image_yscale: 1,
        image_alpha: 1,
        fadingAlpha: 1,
        image_angle: 0,
        vanish: false,
        ownerID: argument8,
        visible: true
    }

    ds_list_add(global.AfterImageList, struc)
    return struc;
}

function create_mach3effect(argument0, argument1, argument2, argument3, argument4, argument5, argument6) //create_mach3effect
{
    if (argument5 == undefined)
        argument5 = id
    if (argument6 == undefined)
        argument6 = 1
    var struc = afterimage_create((2 << 0), argument0, argument1, argument2, argument3, argument4, undefined, true, argument5)
    struc.image_yscale = argument6
    struc.image_alpha = 0.5
    struc.afterImageIndex = choose(0, 1)
    return struc;
}

function create_spink_afterimage(argument0, argument1, argument2, argument3, argument4, argument5) //create_spink_afterimage
{
    if (argument5 == undefined)
        argument5 = 1
    var struc = afterimage_create((6 << 0), argument0, argument1, argument2, argument3, argument4, -1)
    struc.image_yscale = argument5
    struc.image_alpha = 1.25
    return struc;
}

function create_red_afterimage(argument0, argument1, argument2, argument3, argument4, argument5) //create_red_afterimage
{
    if (argument5 == undefined)
        argument5 = 1
    var struc = afterimage_create((4 << 0), argument0, argument1, argument2, argument3, argument4, -1)
    struc.image_yscale = argument5
    struc.image_alpha = 0.6
    return struc;
}

function create_blur_afterimage(argument0, argument1, argument2, argument3, argument4, argument5, argument6) //create_blur_afterimage
{
    var struc = afterimage_create((1 << 0), argument0, argument1, argument2, argument3, argument4, -1)
    struc.image_alpha = 0.8
    struc.image_yscale = argument5
    struc.image_angle = argument6
    return struc;
}

function create_heatattack_afterimage(argument0, argument1, argument2, argument3, argument4) //create_heatattack_afterimage
{
    return afterimage_create((1 << 0), argument0, argument1, argument2, argument3, argument4);
}

function create_firemouth_afterimage(argument0, argument1, argument2, argument3, argument4) //create_firemouth_afterimage
{
    return afterimage_create((4 << 0), argument0, argument1, argument2, argument3, argument4);
}

