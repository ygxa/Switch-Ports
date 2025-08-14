draw_set_font(global.textfont)
if turn = "playerselect"{
	draw_sprite(spr_battleselect,0,40,100)
	draw_sprite(spr_battleselect,0,170,100)
	draw_sprite(spr_battleselect,0,310,100)
	draw_sprite(spr_battleselect,0,440,100)
	if selection = 0{
		draw_sprite(spr_soul,0,105,465)
	}
	if selection = 1
		draw_sprite(spr_soul,0,232,465)

	draw_text(77,475,"fight")
	draw_text(205,475,"items")
}


draw_text(300, 100,"player hp: " + string(global.playerhp))

if instance_exists(baddieid)
	draw_text(500, 100,"baddie hp: " + string(baddieid.hp))