var cam = view_get_camera(0);
var _x = camera_get_view_x(cam);
var _y = camera_get_view_y(cam);

if (global.debug && obj_debugger.objectDebugCamera)
{
    camera_set_view_pos(cam, obj_debugger.freecamX, obj_debugger.freecamY);
}
else if (forceView)
{
    camera_set_view_target(cam, -4);
    var dir = point_direction(_x, _y, forceViewX, forceViewY);
    var xChange = round(lengthdir_x(forceViewSpeed, dir));
    var yChange = round(lengthdir_y(forceViewSpeed, dir));
    var xDir = sign(xChange);
    var yDir = sign(yChange);
    var setX = _x;
    var setY = _y;
    
    if (xDir == 1)
        setX = viewXOffset + clamp(_x + xChange, _x, forceViewX);
    else if (xDir == -1)
        setX = viewXOffset + clamp(_x + xChange, forceViewX, _x);
    
    if (yDir == 1)
        setY = viewYOffset + clamp(_y + yChange, _y, forceViewY);
    else if (yDir == -1)
        setY = viewYOffset + clamp(_y + yChange, forceViewY, _y);
    
    camera_set_view_pos(cam, floor(setX), floor(setY));
}
else if (!customViewMode && instance_exists(obj_player))
{
    camera_set_view_target(cam, -4);
    var targetX = clamp(floor(obj_player.x) - 160, 0, room_width - 320);
    var targetY = clamp(floor(obj_player.y) - 120, 0, room_height - 240);
    var xChange = targetX - _x;
    var yChange = targetY - _y;
    var xDir = sign(xChange);
    var yDir = sign(yChange);
    var setX = _x;
    var setY = _y;
    
    if (xDir == 1)
    {
        xChange = clamp(xChange, 0, normalViewSpeed);
        setX = clamp(_x + xChange, _x, targetX) + viewXOffset;
    }
    else if (xDir == -1)
    {
        xChange = clamp(xChange, -normalViewSpeed, 0);
        setX = clamp(_x + xChange, targetX, _x) + viewXOffset;
    }
    else if (viewXOffset != 0)
    {
        setX = _x + viewXOffset;
    }
    
    if (yDir == 1)
    {
        yChange = clamp(yChange, 0, normalViewSpeed);
        setY = clamp(_y + yChange, _y, targetY) + viewYOffset;
    }
    else if (yDir == -1)
    {
        yChange = clamp(yChange, -normalViewSpeed, 0);
        setY = clamp(_y + yChange, targetY, _y) + viewYOffset;
    }
    else if (viewYOffset != 0)
    {
        setY = _y + viewYOffset;
    }
    
    camera_set_view_pos(cam, floor(setX), floor(setY));
}

viewMoving = _x != camera_get_view_x(cam) || _y != camera_get_view_y(cam);
