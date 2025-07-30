draw_set_alpha(fadealpha);
draw_set_color(c_white);
//draw_rectangle(0, 0, (__view_get(0, 0) + __view_get(2, 0)), (__view_get(1, 0) + __view_get(3, 0)), 0)
draw_rectangle(-64, -64, 960 + 64, 540 + 64, false)
draw_set_alpha(1);
draw_set_color(c_white);

#region Speedrun Timer
if global.levelname != "none" && global.showplaytimer && room != hub_w1 && room != timesuproom
{
	var tiny = ":";
	var tinier = ":";
	var tinyish = ":";
	if (global.playseconds < 10)
		tiny = ":0";
	if (global.playmiliseconds < 10)
		tinier = ":0";
	if (global.playminutes < 10)
		tinyish = ":0";
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_font(global.smallfont);
	draw_text(823, 512, string_hash_to_newline(((string(global.playhour) + string(tinyish) + string(global.playminutes) + string(tiny)) + string(global.playseconds) + string(tinier) + string(global.playmiliseconds))));
}
#endregion
