if (!drawgui)
    return draw_set_font(F_Tutorial);

draw_set_valign(fa_top);
draw_set_alpha(1);
draw_set_color(c_white);
draw_text(40, 40, "The game found " + string(array_length(arr)) + " controllers");

if (state != 2)
    draw_text(40, 80, "Player " + string(state + 1) + " please hold the A button for 2 seconds");
else
    draw_text(40, 80, "Going to the tilte screen...");

if (state == 1)
    draw_text(40, 100, "If you dont have a second player, press START and SELECT");

if (state == 0)
    draw_text(40, 100, "If you want to use the keyboard press ENTER and TAB");

for (var i = 0; i < array_length(arr); i++)
{
    if (arr[i][0] == global.P1controllerport)
        draw_set_color(c_blue);
    else if (arr[i][0] == global.P2controllerport)
        draw_set_color(c_red);
    else
        draw_set_color(c_white);
    
    draw_text(40, 200 + (i * 20), arr[i][1]);
}
