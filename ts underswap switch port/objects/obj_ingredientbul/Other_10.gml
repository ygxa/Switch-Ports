with (obj_ingredientbul)
{
    selected = false;
    disabled = true;
}

selected = true;
textColor = 65280;
sfx_play(snd_ding);

switch (ingType)
{
    case 0:
        obj_muffetdate.dryChoice = nameIdx;
        break;
    
    case 1:
        obj_muffetdate.wetChoice = nameIdx;
        break;
}

alarm[0] = 30;

with (obj_dateheart)
    canMove = false;
