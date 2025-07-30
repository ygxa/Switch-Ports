with (obj_player1)
{
    if (state == 49 || state == 40)
    {
        global.combotime = 60;
        instance_destroy(other);
    }
}

if (other.state != 18)
{
    sprite_index = spr_grandpa_punch;
    image_index = 0;
    other.hurted = 0;
    scr_hurtplayer(other);
}
else
{
    global.combotime = 60;
    instance_destroy();
}
