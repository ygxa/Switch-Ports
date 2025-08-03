if (bt_set_surface_transform())
    exit;

var px = x;
var py = y;
actor_shake_visual();
draw_self();
x = px;
y = py;
