with (other)
{
    if (input_check_pressed("up"))
    {
        if (state == 2)
            state = 193;
        else if (state == 193)
            state = 2;
    }
}
