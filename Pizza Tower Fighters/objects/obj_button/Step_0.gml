if (place_meeting(x, y, obj_mouse) && mouse_check_button_pressed(mb_left) && room != R_DemrecmenuSTYLE)
    func();

if (room != R_DemrecmenuSTYLE)
{
    if (!(name == "<" && obj_demrecloader.page == 0))
        selected = place_meeting(x, y, obj_mouse);
    else
        selected = false;
}
else
{
    selected = place_meeting(x, y, obj_mouse) && mouse_check_button(mb_left);
}

stepfunc();
