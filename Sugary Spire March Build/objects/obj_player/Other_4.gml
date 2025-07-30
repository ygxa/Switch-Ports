//Surface
if !surface_exists(surf_pallete)
	surf_pallete = surface_create(surf_width,surf_height);
//Colors
scr_playercolors();
customupdate = true;
event_user(0)