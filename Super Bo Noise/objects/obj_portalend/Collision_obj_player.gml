if (obj_player1.state != (41 << 0) && global.panic == true)
{
    obj_player1.hsp = 0
    sprite_index = spr_pizzaportalend
    image_index = 0
    obj_player1.state = (41 << 0)
    obj_player1.grav = 0
    obj_player1.visible = false
}
