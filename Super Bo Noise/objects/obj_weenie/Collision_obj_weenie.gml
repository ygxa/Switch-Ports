if (state == 140 && thrown && other.state != 7 && other.state != 140)
{
    with (other)
    {
        state = 140;
        vsp = -5;
        stunstate = 0;
        stunned = 100;
    }
}
