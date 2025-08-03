var px = x;
var py = y;
x += ((irandom(2) == 0) ? 1 : 0);
y += ((irandom(2) == 0) ? 1 : 0);
draw_self();
x = px;
y = py;
