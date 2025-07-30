if (appearbuffertimer <= appearbuffer)
{
    appearbuffertimer++;
}
else
{
    image_alpha = lerp(image_alpha, 1, 0.1);
    y = lerp(y, ystart, 0.1);
}

pointed = place_meeting(x, y, o_hand_player1);

if (dorandomize || map_prev == map)
{
    Scr_SelectRandomMap();
    dorandomize = false;
}
