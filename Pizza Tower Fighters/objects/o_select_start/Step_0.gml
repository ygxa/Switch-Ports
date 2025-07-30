if ((global.player1 != 0 && global.player2 != 0) && room == R_CharacterSelect)
{
    y = approach(y, ystart, 20);
    time += hoverSpeed;
    var sine_value = sin(time);
    x = (original_x - (hoverHeight / 2)) + ((hoverHeight / 2) * sine_value);
}

if ((global.player1 == 0 || global.player2 == 0) && room == R_CharacterSelect)
    y = approach(y, 750, 20);

if (global.player1 != 0 && room == R_CharacterSelect_Sing)
{
    y = approach(y, ystart, 20);
    time += hoverSpeed;
    var sine_value = sin(time);
    x = (original_x - (hoverHeight / 2)) + ((hoverHeight / 2) * sine_value);
}

if (global.player1 == 0 && room == R_CharacterSelect_Sing)
    y = approach(y, 750, 20);
