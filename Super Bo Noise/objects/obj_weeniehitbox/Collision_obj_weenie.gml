if (other.id != baddieID && other.state != 7 && other.state != 140)
{
    with (other)
    {
        stunstate = 1;
        stuntimer = stunmax;
        stunned = 0;
        state = 7;
        vsp = -6;
        stunstate = 1;
    }
}
