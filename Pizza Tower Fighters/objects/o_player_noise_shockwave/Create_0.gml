playerhit = false;
created = false;
damagemeter = 0;
damagemetermax = 0;
damagenull = false;
event_inherited();

if (!place_meeting(x, y + 1, ObjWall))
    instance_destroy(self, false);
