function ScrCheckPlayerInsideRoom()
{
    if (player1.x < room_width || player1.x > 0 || player1.y > room_height || player1.y < 0)
        player1inroom = false;
    else
        player1inroom = true;
    
    if (player2.x < room_width || player2.x > 0 || player2.y > room_height || player2.y < 0)
        player2inroom = false;
    else
        player2inroom = true;
}
