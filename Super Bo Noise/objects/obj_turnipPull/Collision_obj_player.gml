if (other.state == 44)
{
    if (other.move == 0)
    {
        other.hsp = 0;
        other.state = 2;
        
        if (!is_undefined(onPick))
            self.onPick();
        
        instance_destroy();
    }
}
