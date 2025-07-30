if (global.player1 != 0)
{
    DrawSetText(16777215, global.font, 50, 50);
    draw_text(x, y, "HIGH SCORE:");
    draw_text(x, y + 30, hscore);
}
