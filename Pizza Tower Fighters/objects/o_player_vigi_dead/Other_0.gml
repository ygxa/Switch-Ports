if (!instance_exists(o_youwon))
{
    with (instance_create_depth(x, y, -998, o_youwon))
    {
        if (!instance_exists(O_Player_1))
            playerwon = "PLAYER 2";
    }
}
