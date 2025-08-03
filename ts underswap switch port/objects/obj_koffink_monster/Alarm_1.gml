with (obj_battleheart)
{
    with (instance_create_xy(x, y, obj_battleheart_purple))
    {
        canMove = other.canMove;
        invincibilityTimer = other.invincibilityTimer;
        moveSpeed = other.moveSpeed;
        baseMoveSpeed = other.baseMoveSpeed;
        disableSlow = other.disableSlow;
        wasMoving = other.wasMoving;
        drawLines = true;
        wantDangerRows = true;
    }
    
    instance_destroy();
    break;
}
