// Movement Code
if !active 
	return;
oldx = x;
oldy = y;
pivotAngle += movespeed;
x = xstart + round(lengthdir_x(radius, pivotAngle));
y = ystart + round(lengthdir_y(radius, pivotAngle));

