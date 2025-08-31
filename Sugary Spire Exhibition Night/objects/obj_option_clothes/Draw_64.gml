if (!instance_exists(obj_option))
	exit;

draw_set_alpha(0.5)
draw_set_color(c_black)
draw_rectangle(-64, -64, 1024, 604, false)
draw_set_alpha(1)

if (deleteFileBuffer > 0)
	_sprite = spr_fileDelete_unlit

if (deleteFileBuffer > (deleteFileBufferMax / 2))
	_sprite = spr_fileDelete

//var circle_visual = string("[{0},{1}]", sprite_get_name(spr_holdCircle), )
//var _string = string("[c_white][{0},{1}][fontDefault][c_red][fa_center][fa_middle]{2}[c_white][{3},{4}]\n[{5}]{6}{7}         [{8}]{9}", , image_index, lang_get(_text, [_filenum]), sprite_get_name(_sprite), image_index, (optionSelection == 1) ? "c_gray" : "c_white", lang_get("main_menu_yes"), circle_visual, (optionSelection == 0) ? "c_gray" : "c_white", lang_get("main_menu_no"))
//draw_text_scribble(480, 270, _string)

draw_set_color(c_red)
draw_set_font(global.fontDefault)

draw_text(480, 270, "HOLD TO DELETE SAVE")
if optionSelection = 0{
	draw_set_color(c_white)
	draw_sprite(spr_holdCircle,(deleteFileBuffer / deleteFileBufferMax) * sprite_get_number(spr_holdCircle), 330, 360)	
}
if optionSelection = 1{
	draw_set_color(c_gray)
	draw_sprite_ext(spr_holdCircle,(deleteFileBuffer / deleteFileBufferMax) * sprite_get_number(spr_holdCircle), 330, 360, 1, 1, 0, c_gray, 1)
}
	
draw_text(260, 360, "YES")


if optionSelection = 0
	draw_set_color(c_gray)
if optionSelection = 1
	draw_set_color(c_white)
draw_text(680, 360, "NO")

var _y = 270

if !obj_player1.key_jump2
	draw_sprite(spr_fileDelete_snore, ass, 130, _y)
if obj_player1.key_jump2 && deleteFileBuffer / deleteFileBufferMax * sprite_get_number(spr_holdCircle) <= 2
	draw_sprite(spr_fileDelete_unlit, ass, 130, _y)
if obj_player1.key_jump2 && deleteFileBuffer / deleteFileBufferMax * sprite_get_number(spr_holdCircle) > 2
	draw_sprite(spr_fileDelete, ass, 130, _y)

if !obj_player1.key_jump2
	draw_sprite(spr_fileDelete_snore, ass, 810, _y)
if obj_player1.key_jump2 && deleteFileBuffer / deleteFileBufferMax * sprite_get_number(spr_holdCircle) <= 2
	draw_sprite(spr_fileDelete_unlit, ass, 810, _y)
if obj_player1.key_jump2 && deleteFileBuffer / deleteFileBufferMax * sprite_get_number(spr_holdCircle) > 2
	draw_sprite(spr_fileDelete, ass, 810, _y)