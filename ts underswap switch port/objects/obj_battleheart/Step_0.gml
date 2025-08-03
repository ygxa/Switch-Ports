slowCheck();

if (canMove && type == 0)
{
    moveSpeed = (global.control_cancel && !disableSlow) ? (baseMoveSpeed * 0.5) : baseMoveSpeed;
    x += (moveSpeed * ((global.control_right ? 1 : 0) - (global.control_left ? 1 : 0)));
    y += (moveSpeed * ((global.control_down ? 1 : 0) - (global.control_up ? 1 : 0)));
    var colLeft = obj_battlemanager.boxX1 + 5;
    var colRight = obj_battlemanager.boxX2 - 5 - sprite_width;
    var colTop = obj_battlemanager.boxY1 + 5;
    var colBottom = obj_battlemanager.boxY2 - 5 - sprite_height;
    
    if (x < colLeft)
        x = colLeft;
    else if (x > colRight)
        x = colRight;
    
    if (y < colTop)
        y = colTop;
    else if (y > colBottom)
        y = colBottom;
}

if (gotoX != -1 && gotoY != -1 && !gotoMode)
{
    var dir = point_direction(x, y, gotoX, gotoY);
    var dist = distance_to_point(gotoX, gotoY);
    var spd = dist * 0.5;
    gotoXChange = lengthdir_x(spd, dir);
    gotoYChange = lengthdir_y(spd, dir);
    gotoMode = true;
    alarm[0] = 2;
}

if (gotoMode)
{
    x += gotoXChange;
    y += gotoYChange;
}

if (obj_battlemanager.mainState == (4 << 0) && x <= -sprite_width)
{
    obj_battlemanager.battleTriggerEnd();
    
    with (obj_fader)
        fadeMusic = true;
}

if (instance_exists(obj_fader) && !obj_fader.toSolid)
    depth = obj_fader.depth - 5;
else
    depth = -10;

if (invincibilityTimer > 0)
{
    invincibilityTimer--;
}
else if (sprite_index != spr_heartflee && sprite_index != spr_heartflee_fail)
{
    invincibilityTimer = 0;
    image_speed = 0;
    image_index = 0;
}

var list = ds_list_create();
var count = instance_place_list(x, y, obj_bullet_parent, list, true);
var karmaBypass = obj_battlemanager.statsKarmaHandler != undefined;

for (var i = 0; i < count; i++)
{
    var bullet = ds_list_find_value(list, i);
    
    if (!instance_exists(bullet))
        continue;
    
    if (invincibilityTimer == 0 || bullet.damageAmount < 0 || karmaBypass)
    {
        var btype;
        
        if (variable_instance_exists(bullet, "bulletType"))
            btype = bullet.bulletType;
        else
            btype = (0 << 0);
        
        switch (btype)
        {
            case (1 << 0):
                if (x != beforeX || y != beforeY)
                {
                    with (bullet)
                        event_user(0);
                }
                
                break;
            
            case (2 << 0):
                if (x == beforeX && y == beforeY)
                {
                    with (bullet)
                        event_user(0);
                }
                
                break;
            
            default:
                with (bullet)
                    event_user(0);
                
                break;
        }
    }
}

ds_list_destroy(list);

if (global.playerhp <= 0)
{
    global.xstore = x;
    global.ystore = y;
    
    with (obj_battlemanager)
    {
        if (boxTransform)
        {
            var boxCenterX = (boxX2 + boxX1) * 0.5;
            var boxCenterY = (boxY2 + boxY1) * 0.5;
            var angle = boxAngle;
            var translateX = boxTranslateX;
            var translateY = boxTranslateY;
            
            if (global.lowvfx)
            {
                angle *= 0.1;
                translateX *= 0.7;
                translateY *= 0.7;
            }
            
            angle += boxAngleForced;
            var dist = point_distance(boxCenterX, boxCenterY, other.x, other.y);
            var dir = point_direction(boxCenterX, boxCenterY, other.x, other.y);
            global.xstore = boxCenterX + translateX + lengthdir_x(dist, dir + angle);
            global.ystore = boxCenterY + translateY + lengthdir_y(dist, dir + angle);
        }
        
        gameover = true;
    }
}
