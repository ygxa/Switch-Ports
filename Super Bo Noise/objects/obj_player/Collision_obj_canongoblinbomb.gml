if (hurted == 0 && other.grounded == false && state != 86 && state != 149)
{
    instance_destroy(other);
    instance_create(x, y, obj_canonexplosion);
}
