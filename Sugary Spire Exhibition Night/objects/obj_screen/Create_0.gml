depth = -99
gameframe_init()
__display_set_gui_size_hook(960, 540)
global.gameframe_caption_text = "Sugary Spire"
global.gameframe_caption_font = global.captionfont
global.gameframe_caption_icon = spr_gameframe_icon
global.gameframe_caption_margin = 6
global.gameframe_border_width = 2
bgSprite = new subSprite(spr_letterboxBg_simple, 0, 0, false)
bgSpriteOld = ds_list_create()

updateLetterBox = function(arg0, arg1)
{
	ds_list_add(bgSpriteOld, variable_clone(bgSprite, 1))
	bgSprite.sprite_index = arg0
	bgSprite.image_index = arg1
}

event_user(1)
alarm[0] = 1
previousMouseX = get_mouse_x_screen(0)
previousMouseY = get_mouse_y_screen(0)
captionBuffer = 100
global.GameSurface = -4
application_surface_draw_enable(false)

nextPowTwo = function(arg0)
{
	return power(2, ceil(log2(arg0) / log2(2)));
}

var surfW = 960
var surfH = 540
var wScalar = nextPowTwo(surfW)
var hScalar = nextPowTwo(surfH)
uRes = shader_get_uniform(shd_pixelscale, "uRes")
sRes = [wScalar, hScalar]
