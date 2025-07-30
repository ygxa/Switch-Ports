if (keyboard_check(vk_anykey))
    disabled = true;

if (mouse_x != prevx || mouse_y != prevy)
    disabled = false;

prevx = mouse_x;
prevy = mouse_y;

if (disabled)
{
    window_set_cursor(cr_none);
    x = -1000;
    y = -1000;
    exit;
}

window_set_cursor(cr_default);
x = mouse_x;
y = mouse_y;
