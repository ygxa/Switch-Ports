if (x >= 150 && funnycounter < 2)
{
    funnylag = 2;
    funnycounter = 2;
}

event_inherited();

if (funnylag < funnycounter)
    funnylag = funnycounter;
