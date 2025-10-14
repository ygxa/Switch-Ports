if ((!global.horse) && (obj_player1.state == (2 << 0) || obj_player1.state == (105 << 0) || obj_player1.state == (60 << 0) || obj_player1.state == (106 << 0) || obj_player1.state == (123 << 0) || obj_player1.state == (101 << 0)) && input_check("up") && obj_player1.grounded && (global.gerome == 1 || image_index == 1) && place_meeting(x, y, obj_player1))
{
    ds_list_add(global.saveroom, id)
    with (obj_player1)
    {
        targetRoom = other.targetRoom
        targetDoor = other.targetDoor
    }
    if global.gerome
    {
        obj_geromefollow.visible = false
        with (instance_create((x + 25), (y + 50), obj_geromeanim))
        {
            sprite_index = spr_gerome_opendoor
            image_index = 0
            image_speed = 0.5
        }
        obj_player1.state = (100 << 0)
        obj_player1.image_index = 0
        if (instance_exists(obj_player2) && global.coop == true)
        {
            obj_player2.x = obj_player1.x
            obj_player2.y = obj_player1.y
            obj_player2.state = (100 << 0)
            obj_player2.image_index = 0
        }
        global.gerome = false
    }
}
if (place_meeting(x, y, obj_player1) && floor(obj_player1.image_index) == (obj_player1.image_number - 1) && (obj_player1.state == (100 << 0) || obj_player1.state == (114 << 0)))
{
    with (obj_player1)
    {
        obj_player1.targetDoor = other.targetDoor
        obj_player1.targetRoom = other.targetRoom
        if (instance_exists(obj_player2) && global.coop == true)
        {
            obj_player2.targetDoor = other.targetDoor
            obj_player2.targetRoom = other.targetRoom
        }
        if (!instance_exists(obj_fadeout))
            instance_create(x, y, obj_fadeout)
    }
}
