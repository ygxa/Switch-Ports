switch (state)
{
    case (0 << 0):
        eye_state_sleep();
        break;
    
    case (1 << 0):
        eye_state_appear();
        break;
    
    case (2 << 0):
        eye_state_idle();
        break;
    
    case (3 << 0):
        eye_state_close();
        break;
    
    case (4 << 0):
        eye_state_appear_spawn();
        break;
    
    case (5 << 0):
        eye_state_idle_spawn();
        break;
    
    case (6 << 0):
        eye_state_close_spawn();
        break;
}
