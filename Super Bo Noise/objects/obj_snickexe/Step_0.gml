x = median((x - maxspeed), obj_player1.x, (x + maxspeed))
y = median((y - maxspeed), obj_player1.y, (y + maxspeed))
if (x != obj_player1.x)
    image_xscale = (-(sign(x - obj_player1.x)))
if (global.snickchallenge == 0)
    instance_destroy()
if (hitboxcreate == 0 && obj_player1.instakillmove == 0 && obj_player1.state != (44 << 0))
{
    hitboxcreate = 1
    with (instance_create(x, y, obj_tackhitbox))
    {
        sprite_index = other.sprite_index
        ID = other.id
    }
}
if (place_meeting(x, y, obj_player1) && (obj_player1.instakillmove == 1 || obj_player1.state == (44 << 0)))
{
    repeat (6)
    {
        with (instance_create((x + (random_range(-100, 100))), (y + (random_range(-100, 100))), obj_balloonpop))
            sprite_index = spr_shotgunimpact
    }
    x = room_width / 2
    y = -100
}
if (room == rm_missing || room == rm_missing)
{
    x = room_width / 2
    y = -100
}
