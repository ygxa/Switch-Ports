if (state == 136 && !other.brick && other.state == 261)
{
    var s = other.state;
    scr_hurtplayer(other);
    
    if (s != other.state)
    {
        if (state == 136)
        {
            state = 82;
            sprite_index = spr_null;
            image_index = 0;
        }
    }
}
