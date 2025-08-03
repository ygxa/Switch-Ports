var maxX, maxY;

switch (room)
{
    case rm_crys_start_save:
        maxX = 280;
        maxY = 220;
        break;
    
    case rm_crys_premines:
        maxX = 1000;
        maxY = 160;
        break;
}

var playerX = min(obj_player.x, maxX);
var playerY = min(obj_player.y, maxY);

if (room == rm_crys_premines)
    playerX += 160;

with (instance_create_xy(playerX, playerY, obj_ambush_shadow))
    shake = other.shouldShake;

cycles++;

if (room == rm_crys_start_save)
{
    if (cycles >= 15)
    {
        if (!obj_crys_gate.open)
            instance_create_xy(350, 140, obj_ambush_shadow).gateDestroyer = true;
        
        alarm[0] = 55;
    }
    else
    {
        alarm[0] = 30;
    }
}
else
{
    alarm[0] = 30;
}
