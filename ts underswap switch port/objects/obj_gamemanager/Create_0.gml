alarm[2] = game_get_speed(gamespeed_fps);
cleanedUp = false;
waitTimer = 0;
waitSound = -1;
waitMusVolume = 1;
waitInst = undefined;
waitCallback = undefined;
waitCallbackResumeScene = true;
hideScreen = false;
screenXOffset = 0;
screenYOffset = 0;
screenXScale = 1;
screenYScale = 1;
borderXScale = 1;
borderYScale = 1;
borderXOffset = 0;
borderYOffset = 0;
currentBorderSprite = -1;
targetBorderSprite = -1;
borderFade = 0;
borderOverrideFade = 1;
customViewMode = false;
forceView = false;
forceViewX = 0;
forceViewY = 0;
forceViewSpeed = 4;
normalViewSpeed = 4;
viewMoving = false;
viewWaitFrame = false;
viewXOffset = 0;
viewYOffset = 0;
forcedViewThisFrame = false;
global.draw_dark_tiles = false;
drawDarkTilesEnable = false;
textHandler = undefined;
textHandlerBound = false;
sceneEndHandler = undefined;
sceneWaitHandler = undefined;

bindTextHandler = function(argument0, argument1 = undefined, argument2 = undefined)
{
    textHandler = argument0;
    textHandlerBound = true;
    
    if (argument1 != undefined)
        sceneEndHandler = argument1;
    
    if (argument2 != undefined)
        sceneWaitHandler = argument2;
};

guiSurface = -1;

setGuiSurface = function()
{
    if (guiSurface != -1 && surface_exists(guiSurface))
    {
        surface_set_target(guiSurface);
    }
    else
    {
        guiSurface = surface_create(1024, 512);
        surface_set_target(guiSurface);
        draw_clear_alpha(c_black, 0);
    }
};

lastBorder = -1;
dialog = -1;
game_init();

if (global.gamebroke == -1)
    alarm[11] = 1;

defaultDrawScreen = function()
{
    draw_surface_ext(application_surface, screenXOffset, screenYOffset, screenXScale, screenYScale, 0, c_white, 1);
};

baseDefaultDrawScreen = defaultDrawScreen;

drawBorder = function(argument0, argument1)
{
    var xs = 2 * borderXScale;
    var ys = 2 * borderYScale;
    var count = sprite_get_number(argument0);
    var a = argument1 * borderOverrideFade;
    
    for (var i = 0; i < count; i++)
        draw_sprite_ext(argument0, i, borderXOffset, borderYOffset, xs, ys, 0, c_white, a);
};

checkingPadIndex = -1;
checkingPadPress = false;
checkingPadTimer = 0;

if (global.last_connected_gamepad != -1)
{
    checkingPadIndex = global.last_connected_gamepad;
    alarm[6] = 2;
}

restartGame = false;

if (global.debug)
    instance_create(obj_debugger);
