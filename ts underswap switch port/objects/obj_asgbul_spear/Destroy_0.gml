with (obj_asgore_monster)
{
    if (other.specialAttack)
    {
        sprite_index = spr_asgb_kneel;
        cantAttack = true;
    }
    else
    {
        sprite_index = -1;
    }
}

if (sequence != undefined)
{
    with (obj_asgore_monster)
        visible = true;
    
    layer_sequence_destroy(sequence);
}
