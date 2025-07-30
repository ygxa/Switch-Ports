playerhit = false;
created = false;
amountleft = 1;
damagemeter = 0;
damagemetermax = 0;
damagenull = false;
event_inherited();

if (amountleft == 0 || !place_meeting(x, y + 1, ObjWall))
    instance_destroy(self, false);
