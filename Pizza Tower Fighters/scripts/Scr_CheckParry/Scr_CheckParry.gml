function Scr_CheckParry()
{
    if (other.unparry == false)
    {
        if (state == (12 << 0) && image_index < 5 && state != (16 << 0))
        {
            parry = true;
            
            if (projectilehit == 0)
                ScrStun_OtherPlayer(60);
            
            state = (16 << 0);
        }
        else
        {
            parry = false;
        }
    }
}
