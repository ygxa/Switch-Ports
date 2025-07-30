if (selected == o_matchhistory.selected)
    image_alpha = approach(image_alpha, 1, 0.1);
else
    image_alpha = approach(image_alpha, 0.5, 0.1);

if (playanim)
{
    playindex += 0.35;
    
    if (floor(playindex) >= 6)
        playanim = false;
}

if (yto > 50)
    yto = 50;

yactual = lerp(yactual, yto, 0.2);
