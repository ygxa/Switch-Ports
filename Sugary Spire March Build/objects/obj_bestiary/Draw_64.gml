
draw_sprite(spr_lorebook, -1, 0, 0)
//draw_sprite_tiled(bg_oldpauseTile, -1, x++, y++)
draw_set_font(font_console)
draw_set_halign(fa_center)
draw_set_color(c_black)

var tileArea = rows * columns
var entryAmt = array_length(entry)
var toPage = ((pgnum - 1) * tileArea)
var extraEntries = entryAmt mod tileArea
var entriesLeft = ((entryAmt - toPage))
var rowNum = floor(selected / columns)
var unlocked = entry[selected, 4] == 1

#region Entry Selection
var yy = starty
var xx = startx
for (var i = 0; i < (entriesLeft >= tileArea ? tileArea : extraEntries); i++) {
	if i mod columns = 0 {
		yy += spacingy	
		xx = startx
	}
	draw_sprite(entry[i + toPage, 0], entry[i + toPage, 4], xx, yy)
	xx += spacingx
}	
#endregion

#region Selection Box
var selectX = startx + (spacingx * (selected mod columns))
var selectYspace = ((pgnum - 1) * (spacingy * (rows )))
var selectY = starty + ((spacingy * (rowNum + 1)) - selectYspace)
var clampY = clamp(selectY, spacingy, (spacingy * (rows + 1)))
draw_sprite(spr_lorebook_select, -1, selectX, clampY)
#endregion 

#region Nav
// need to improve this later
var select0 = ((selected2 == 0) ? c_white : c_black)
var select1 = ((selected2 == 1) ? c_white : c_black)
var select2 = ((selected2 == 2) ? c_white : c_black)
var select3 = ((selected2 == 3) ? c_white : c_black)
var totalPages = (entryAmt mod tileArea == 0 ? floor(entryAmt / tileArea) : floor(entryAmt / tileArea) + 1)
draw_sprite_ext(spr_arrow, -1, 110, 450, -1, 1, 0, select0, 1)
draw_sprite_ext(spr_arrow, -1, 232, 450, 1, 1, 0, select1, 1)
draw_sprite_ext(spr_arrow, -1, 380, 270, -1, 1, 0, select2, 1)
draw_sprite_ext(spr_arrow, -1, 900, 270, 1, 1, 0, select3, 1)
draw_text(171, 450, string(pgnum) + "/" + string(totalPages))
#endregion

#region Entry Details
var currentSpr = entry[selected, 1]
var sety = 217// - sprite_get_yoffset(currentSpr)) 
var setx = 673 //- ((sprite_get_width(currentSpr) / 2))/// - sprite_get_xoffset(currentSpr)) 
var titleY = 50
var killY = titleY + 20


scrolling = 101 < string_height_ext((entry[selected, 4]), 15, 400)


var cLocked = entry[selected, 4] == true ? c_white : c_black
draw_sprite_ext(currentSpr, -1, setx, sety, 1, 1, 0, cLocked, 1)

draw_text_ext(680, titleY, entry[selected, 2], 15, 200)
draw_text_ext(680, killY, entry[selected, 5][unlocked] , 18, 300)


//desc
#region scrolling text
draw_set_halign(fa_left)
if !surface_exists(descSurface)
	descSurface = surface_create(417, 101)
surface_set_target(descSurface)	
draw_clear_alpha(c_black, 0)
draw_text_ext(6, texty, entry[selected, 3], 15, 400)	
/*draw_set_blend_mode(bm_subtract)
draw_sprite(spr_elevatorfadeoff, -1, 0, 0)
draw_set_blend_mode(bm_normal)*/
surface_reset_target()
if surface_exists(descSurface)
	draw_surface(descSurface, 462, 359)
#endregion
#endregion






