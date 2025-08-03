var leverToPull = 0;

switch (leversPulled)
{
    case 0:
        leverToPull = 3;
        break;
    
    case 1:
        leverToPull = 1;
        break;
    
    case 2:
        leverToPull = 2;
        obj_ruin_door.open = true;
        view_shake(2, 2);
        sfx_play(snd_dooropen);
        break;
}

with (inst_get(leverToPull))
    event_user(0);

leversPulled++;
alarm[2] = 10;
