var dir = point_direction(x, y, targetX, targetY);
var distDiv = point_distance(x, y, targetX, targetY) / time;
xChange = lengthdir_x(distDiv, dir);
yChange = lengthdir_y(distDiv, dir);
started = true;
