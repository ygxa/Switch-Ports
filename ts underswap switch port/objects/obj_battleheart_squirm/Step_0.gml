x += (moveSpeed * ((global.control_right ? 1 : 0) - (global.control_left ? 1 : 0)));
y += (moveSpeed * ((global.control_down ? 1 : 0) - (global.control_up ? 1 : 0)));
x = clamp(x, borderLeft, borderRight);
y = clamp(y, borderTop, borderBottom);
