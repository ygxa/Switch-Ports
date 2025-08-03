event_inherited();
bt_set_boxtype((17 << 0));
boxLeft = 240;
boxTop = 250;
boxRight = 400;
boxBottom = 390;
boxLeftStart = boxLeft;
boxRightStart = boxRight;
mouthSpace = 50;
mouthSpaceStart = mouthSpace;
destMouthSpace = 50;
boxCenter = (boxLeft + boxRight) / 2;
playedSound = false;
mouthMoveSpeed = 0.25;
middleFrame = 0;
var safeTooth = xirandom(4);
var healTooth = ((safeTooth - 1) < 0) ? 4 : (safeTooth - 1);

if (obj_harry_monster.isRuth)
    healTooth = -1;

var i = 0;
toothSide = 1;
var offset = 52;

repeat (5)
{
    if (i != safeTooth)
    {
        var bul = bt_bullet(obj_harry_tooth_bul, -99, obj_battlemanager.boxY1 + offset, obj_harry_monster);
        
        with (bul)
        {
            parent = other;
            
            if (other.toothSide == 1)
                image_index = 0;
            else
                image_index = 1;
        }
        
        if (i == healTooth)
        {
            with (bul)
            {
                image_blend = c_lime;
                damageAmount *= -1;
            }
        }
    }
    
    toothSide *= -1;
    offset += 11;
    i++;
}

image_xscale = 2;
image_yscale = 2;
step = 0;
