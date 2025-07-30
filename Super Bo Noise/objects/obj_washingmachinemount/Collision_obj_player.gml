if (other.y < y && visible == true)
{
    other.image_index = 0;
    other.sprite_index = spr_null;
    other.state = 21;
    visible = false;
}
