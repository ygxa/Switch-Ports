if (instance_exists(heart) && heart.moving)
{
    alarm[0] = 1;
    exit;
}

instance_destroy(obj_transitionheart);
instance_destroy();

if (fake)
    exit;

global.currentroom = room;
global.undo_room_persistence = true;
room_persistent = true;

if (roomCtx)
    room_goto(rm_date);
else
    room_goto(rm_battle);
