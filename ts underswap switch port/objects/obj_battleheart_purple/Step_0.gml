slowCheck();

if (canMove)
{
    moveSpeed = (global.control_cancel && !disableSlow) ? (baseMoveSpeed * 0.5) : baseMoveSpeed;
    var right, left, upPressed, downPressed;
    
    if (rotatedControls)
    {
        right = global.control_up;
        left = global.control_down;
        upPressed = global.control_left_pressed;
        downPressed = global.control_right_pressed;
    }
    else
    {
        right = global.control_right;
        left = global.control_left;
        upPressed = global.control_up_pressed;
        downPressed = global.control_down_pressed;
    }
    
    x += (moveSpeed * ((right ? 1 : 0) - (left ? 1 : 0)));
    var yStart = obj_battlemanager.boxY1 + (rowSep * 0.75);
    var target = (yStart + (currRow * rowSep)) - 8;
    y = number_approach_linear(y, target, rowSep / 3);
    movingRows = y != target;
    
    if (!movingRows)
    {
        if (upPressed && currRow > 0)
        {
            currRow--;
            movingRows = true;
        }
        else if (downPressed && currRow < (numRows - 1))
        {
            currRow++;
            movingRows = true;
        }
    }
    
    var colLeft = max(minRowBorderLeft, obj_battlemanager.boxX1) + 30;
    var colRight = min(maxRowBorderRight, obj_battlemanager.boxX2) - 30 - sprite_width;
    var colTop = obj_battlemanager.boxY1 + 5;
    var colBottom = obj_battlemanager.boxY2 - 5 - sprite_height;
    var angle = obj_battlemanager.boxAngleForced;
    
    if (angle != 0)
    {
        colLeft += (16 * (1 - ((90 - angle) / 90)));
        colRight += (16 * (1 - ((90 - angle) / 90)));
    }
    
    if (x < colLeft)
        x = colLeft;
    else if (x > colRight)
        x = colRight;
    
    if (y < colTop)
        y = colTop;
    else if (y > colBottom)
        y = colBottom;
}

event_inherited();
