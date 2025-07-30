if (other.instakillmove || other.state == 44)
{
    with (other)
    {
        scr_pummel();
        instance_destroy(other);
    }
}
