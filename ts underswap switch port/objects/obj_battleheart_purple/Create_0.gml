event_inherited();
movingRows = false;
numRows = 3;
rowSep = 40;
currRow = 1;
drawLines = false;
type = 1;
lineAlpha = 0;
rotatedControls = false;
wantDangerRows = false;
dangerRow = -1;
dangerRowState = 0;
dangerRowSiner = 0;
dangerRowCountdown = 0;
shockTimer = 0;
shockInvincibilityTimer = 0;
shockBullet = -4;
minRowBorderLeft = -1000;
maxRowBorderRight = 1000;

setRowBorderBounds = function(argument0, argument1)
{
    minRowBorderLeft = argument0;
    maxRowBorderRight = argument1;
};

resetRowBorderBounds = function()
{
    minRowBorderLeft = -1000;
    maxRowBorderRight = 1000;
};

getRowY = function(argument0)
{
    return obj_battlemanager.boxY1 + (rowSep * 0.75) + (argument0 * rowSep);
};

setDangerRow = function(argument0, argument1, argument2 = 30)
{
    clearDangerRow();
    dangerRow = argument0;
    dangerRowCountdown = argument1;
    dangerRowState = 1;
    shockTimer = argument2;
};

clearDangerRow = function()
{
    dangerRow = -1;
    dangerRowCountdown = 0;
    dangerRowState = 0;
    
    if (shockBullet != -4)
    {
        with (shockBullet)
            instance_destroy();
        
        shockBullet = -4;
    }
};

drawRow = function(argument0, argument1 = 8388736)
{
    draw_set_color(argument1);
    draw_line_pix(max(minRowBorderLeft, obj_battlemanager.boxX1) + 30, argument0, min(maxRowBorderRight, obj_battlemanager.boxX2) - 30, argument0);
};

drawRows = function()
{
    if (!visible)
        exit;
    
    if (drawLines)
    {
        var left = max(minRowBorderLeft, obj_battlemanager.boxX1);
        var right = min(maxRowBorderRight, obj_battlemanager.boxX2);
        
        if (lineAlpha < 1)
            lineAlpha += 0.05;
        else
            lineAlpha = 1;
        
        draw_set_alpha(lineAlpha);
        
        for (var i = 0; i < numRows; i++)
        {
            var _y = obj_battlemanager.boxY1 + (rowSep * 0.75) + (i * rowSep);
            
            if (wantDangerRows)
            {
                if (i == dangerRow)
                {
                    switch (dangerRowState)
                    {
                        case 0:
                            drawRow(_y);
                            break;
                        
                        case 1:
                            draw_battle_warner(left + 30, _y, right - 30, _y + 1, dangerRowSiner, false);
                            dangerRowSiner += 1;
                            
                            if (dangerRowCountdown == 0)
                            {
                                sfx_play_ext(snd_electrify, 0.7, random_range(0.9, 1.1));
                                dangerRowState = 2;
                                dangerRowSiner = 0;
                                shockBullet = instance_create_xy(left + 30, _y - 3, obj_areahitbox_sound);
                                
                                with (shockBullet)
                                {
                                    timer = other.shockTimer;
                                    damageAmount = 8;
                                    destroy = false;
                                    image_xscale = right - 30 - (left + 30);
                                    image_yscale = 3;
                                    sound = snd_shock;
                                }
                            }
                            
                            dangerRowCountdown -= 1;
                            break;
                        
                        case 2:
                            var startX = left + 30;
                            var endX = right - 30;
                            var frequency = irandom_range(16, 22);
                            var currX = startX;
                            var height;
                            
                            if ((shockTimer % 2) == 0)
                            {
                                height = irandom_range(-2, -5);
                                draw_set_color(c_white);
                            }
                            else
                            {
                                height = irandom_range(2, 5);
                                draw_set_color(c_yellow);
                            }
                            
                            if (shockTimer <= 30)
                            {
                                frequency = 16 + ((frequency - 16) * (shockTimer / 45));
                                height *= (shockTimer / 30);
                            }
                            
                            var segLength = (endX - startX) / frequency;
                            
                            for (var j = 0; j < frequency; j++)
                            {
                                var toX = currX + segLength;
                                draw_line_pix(currX, _y + height, toX, _y - height);
                                currX = toX;
                                height *= -1;
                            }
                            
                            shockTimer -= 1;
                            
                            if (shockTimer <= 0)
                                clearDangerRow();
                            
                            break;
                    }
                }
                else
                {
                    drawRow(_y);
                }
            }
            else
            {
                drawRow(_y);
            }
        }
        
        draw_set_alpha(1);
    }
};
