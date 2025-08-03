var any = false;

for (var i = 0; i < 38; i++)
{
    var pti = partInactive[i];
    
    if (pti != 0)
    {
        if (pti < 1)
        {
            any = true;
            partInactive[i] += 0.05;
        }
    }
    else
    {
        any = true;
        partRot[i] += partRotSpd[i];
        partX[i] += partXSpd[i];
        partY[i] += partYSpd[i];
        partXSpd[i] -= 0.005;
        partYSpd[i] -= 0.015;
        partRotSpd[i] -= sign(partRotSpd[i]) * 0.3;
        
        if (partYSpd[i] < 2.7 && partY[i] > (sprite_height + (abs(partXSpd[i]) * 8)))
            partInactive[i] = 0.05;
    }
}

if (!any)
    instance_destroy();
