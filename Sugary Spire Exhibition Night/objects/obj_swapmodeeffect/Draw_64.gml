draw_set_color(c_black)
draw_set_alpha(0.7)
draw_rectangle(0,0,4000,4000,false)
draw_set_alpha(1)
if global.playerCharacter = Characters.Pizzelle
	draw_player_sprite_ext(playersprite, playerindex, playerx, playery, image_xscale, image_yscale, 0, c_white, 1,Characters.Pizzano);
else
	draw_player_sprite_ext(playersprite, playerindex, playerx, playery, image_xscale, image_yscale, 0, c_white, 1,Characters.Pizzelle);
