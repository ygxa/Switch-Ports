if (bananaFalling)
{
    with (bananaBul)
    {
        if (landedOnRow)
            continue;
        
        var rowY = obj_battleheart_purple.getRowY(other.bananaTargetRow);
        
        if (y >= rowY)
        {
            y = rowY;
            speed = 0;
            gravity = 0;
            other.bananaTargetRow = irandom(2);
            landedOnRow = true;
        }
    }
}
