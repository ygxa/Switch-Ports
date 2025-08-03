timer = 0;
xShake = 2;
yShake = 1;
forTransition = obj_koffink_monster.soulTransDiannex;
audioGain = 1;
depth = obj_battleheart.depth - 2;
sfxRumble = -1;
image_speed = 0;
image_xscale = 2;
image_yscale = 2;
image_blend = obj_koffink_monster.image_blend;

function makeBats()
{
    var batObj;
    
    if (forTransition)
        batObj = obj_kk_batbul_trans;
    else
        batObj = obj_kk_batbul;
    
    var xoff = 0;
    var angle, angleMax, rangeLow, rangeHigh;
    
    if (forTransition)
    {
        rangeLow = -4;
        rangeHigh = 4;
        angle = 265;
        angleMax = 305;
        xoff = -16;
    }
    else
    {
        if (image_index == 1)
        {
            angle = 246;
            angleMax = 280;
        }
        else
        {
            angle = 246;
            angleMax = 278;
        }
        
        rangeLow = -3;
        rangeHigh = 3;
    }
    
    var ind = 0;
    var numBats = 6;
    
    repeat (numBats)
    {
        var bul = bt_bullet(batObj, x + 48 + xoff, y + 72, obj_koffink_monster);
        
        with (bul)
        {
            direction = angle + ((angleMax - angle) * (ind / numBats)) + irandom_range(rangeLow, rangeHigh);
            speed = 16;
            image_speed = 2;
        }
        
        ind++;
    }
}
