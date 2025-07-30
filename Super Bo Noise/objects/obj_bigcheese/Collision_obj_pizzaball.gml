if (state != 76 && (other.hsp != 0 || other.thrown || other.state == 7))
{
    pizzaball = 1;
    golfid = other.id;
    shot = 0;
    state = 76;
    sprite_index = spr_bigcheese_walk;
    image_index = 0;
}
