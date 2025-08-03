event_inherited();
x = obj_battleheart.xprevious - 17;
y = ystart + (10 * sin(siner));

if (!bananaFalling)
{
    with (bananaBul)
    {
        y = other.y + 23;
        x = other.x + 23;
    }
}

siner += 0.25;
