function fadeToRoom(argument0, argument1, argument2, argument3 = false)
{
    var _inst;
    
    if (argument3 == false)
        _inst = instance_create_depth(0, 0, 0, O_Fade);
    else
        _inst = instance_create_depth(0, 0, -999, O_FadeDoors);
    
    with (_inst)
    {
        targetRoom = argument0;
        duration = argument1;
        color = argument2;
    }
}
