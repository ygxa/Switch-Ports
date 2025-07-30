DrawSetText(16777215, global.font, 50, 50);
draw_text(300, 150, "TOTAL SCORE:" + string(scoringgg));

if (scoringgg == global.TOTALSCORE)
    draw_text(450, 200, "RANK");

if (showrank)
    draw_sprite_ext(ranksprite, 0, 495, 350, scale, scale, 0, c_white, 1);
