if (DestroyedBy.object_index == obj_player)
{
    if ((place_meeting(x, y - DestroyedBy.vsp, DestroyedBy) || place_meeting(x, y - sign(DestroyedBy.vsp), DestroyedBy)) && DestroyedBy.vsp < 0 && DestroyedBy.state == 57)
        DestroyedBy.vsp = 0;
    
    instance_destroy();
}
else
{
    instance_destroy();
}
