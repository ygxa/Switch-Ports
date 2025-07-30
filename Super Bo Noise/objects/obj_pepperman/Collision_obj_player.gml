if (state == 155)
{
    var s = other.state;
    scr_hurtplayer(other);
    
    if (s != other.state && other.state == 109)
        pepperman_nearestspot();
}
