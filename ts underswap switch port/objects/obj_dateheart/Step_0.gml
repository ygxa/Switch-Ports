slowCheck();

if (canMove)
{
    moveSpeed = (global.control_cancel && !disableSlow) ? (baseMoveSpeed * 0.5) : baseMoveSpeed;
    x += (moveSpeed * ((global.control_right ? 1 : 0) - (global.control_left ? 1 : 0)));
    y += (moveSpeed * ((global.control_down ? 1 : 0) - (global.control_up ? 1 : 0)));
    x = clamp(x, boundsX[0], boundsX[1]);
    y = clamp(y, boundsY[0], boundsY[1]);
}

if (instance_exists(obj_fader) && !obj_fader.toSolid)
    depth = obj_fader.depth - 5;
else
    depth = -10;

if (invincibilityTimer > 0)
    invincibilityTimer--;
else
    image_speed = 0;
