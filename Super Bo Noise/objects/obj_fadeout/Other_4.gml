if (obj_player1.state == (121 << 0))
{
    if (!global.pizzadelivery)
    {
        with (instance_create((obj_stopsign.x - 480), obj_stopsign.y, obj_taxidud))
            playerid = obj_player1
    }
    else
    {
        with (instance_create((obj_checkpoint.x - 480), (obj_checkpoint.y - 50), obj_taxidud))
            playerid = obj_player1
        with (obj_player1)
        {
            x = obj_checkpoint.x
            y = obj_checkpoint.y - 50
        }
    }
}
if (obj_player1.state == (154 << 0))
{
    with (obj_player1)
    {
        visible = true
        state = (2 << 0)
    }
}
