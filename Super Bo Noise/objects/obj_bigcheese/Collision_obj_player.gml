if (state != 76)
{
    pizzaball = 0;
    playerid = other.id;
    shot = 0;
    state = 76;
    sprite_index = spr_bigcheese_walk;
    image_index = 0;
    other.state = 7;
    other.sprite_index = other.spr_tumble;
}
