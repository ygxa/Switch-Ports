//global.scribble_saved_profile = "[pPrompt]"

/*
function scribble_quick_button(arg0)
{
	return string("[c_white]" + get_control_sprite(arg0) + global.scribble_saved_profile);
}
*/

global.DefaultCursor = 0

/*
scribble_add_macro("kL", function()
{
	return scribble_quick_button("left");
})
scribble_add_macro("kU", function()
{
	return scribble_quick_button("up");
})
scribble_add_macro("kD", function()
{
	return scribble_quick_button("down");
})
scribble_add_macro("kR", function()
{
	return scribble_quick_button("right");
})
scribble_add_macro("kJ", function()
{
	return scribble_quick_button("jump");
})
scribble_add_macro("kG", function()
{
	return scribble_quick_button("slap");
})
scribble_add_macro("kM", function()
{
	return scribble_quick_button("attack");
})
scribble_add_macro("kT", function()
{
	return scribble_quick_button("taunt");
})
scribble_add_macro("kSJ", function()
{
	return scribble_quick_button("dialogSJ");
})
scribble_add_macro("kGP", function()
{
	return scribble_quick_button("dialogGP");
})
scribble_add_macro("kFWD", function()
{
	return scribble_quick_button("forward");
})
scribble_add_macro("kBCK", function()
{
	return scribble_quick_button("backward");
})
scribble_add_macro("pNPC", function()
{
	global.scribble_saved_profile = "[pNPC]"
	return "[npcfont][c_black]";
})
scribble_add_macro("pPrompt", function()
{
	global.scribble_saved_profile = "[pPrompt]"
	return "[promptfont][c_white]";
})
scribble_add_macro("iSl", function()
{
	return scr_getDialogIcon("SLUGGY", "c_white", "c_white");
})
scribble_add_macro("iGH", function()
{
	return scr_getDialogIcon("HARRY", "c_white", "c_white");
})
scribble_add_macro("iCw", function()
{
	return scr_getDialogIcon("COTTONWITCH", "c_white", "c_white");
})
scribble_add_macro("iGu", function()
{
	return scr_getDialogIcon("GUARDIAN", "c_white", "c_white");
})
scribble_add_macro("iFf", function()
{
	return scr_getDialogIcon("FLINGFROG", "c_white", "c_white");
})
*/

global.allTexturePages = ["Default", "Player", "Baddies", "HUD", "Backgrounds", "Unused", "Devs", "Entryway", "Cottontown", "Mines", "Molasses", "Hub", "Structure", "Cafe", "Fudgetop", "Sucrose", "geyserwaves", "effectsGroup", "titleGroup", "testingGroup"]
global.MainMenuRefresh = false
global.langUpdated = false
randomize()
global.RandomSeed = random_get_seed()
global.GLOBAL_FUN = 0

#macro debugRelease DebugType.Dev;
#macro Playtest:debugRelease DebugType.Playtest;
#macro Release:debugRelease DebugType.None;

function scr_gameInit()
{
	global.parallaxbg_surface = -4
	global.ParallaxMap = ds_map_create()
	scr_default_parallax(true)
	init_option()
	scr_judgment_init()
}
