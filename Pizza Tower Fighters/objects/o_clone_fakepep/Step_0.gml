timerr -= 1;

if (instance_exists(o_youwon) || timerr == 0)
    state = (3 << 0);

switch (state)
{
    case (0 << 0):
        clone_faker_reform();
        break;
    
    case (1 << 0):
        clone_faker_follow();
        break;
    
    case (2 << 0):
        clone_faker_sideE();
        break;
    
    case (3 << 0):
        clone_faker_deform();
        break;
}
