if (!instance_exists(obj_player1))
{
    alarm[0] = 60;
    exit;
}

var player = obj_player1;
var jumping = input_check("jump");
var mach = player.state == 106 || player.state == 123 || player.state == 65;
var earnArr = [];

if ((player.move != 0 || mach) && player.grounded)
{
    var amt = (abs(player.hsp) > 8) ? 2 : 1;
    array_push(earnArr, ["movespeed", amt]);
}

if ((player.vsp <= -4 || jumping) && !player.grounded)
    array_push(earnArr, ["jump", 1]);

switch (player.state)
{
    case 81:
    case 44:
        array_push(earnArr, ["attack", 1]);
        break;
    
    case 82:
        array_push(earnArr, ["defense", 1]);
        array_push(earnArr, ["attack", 1]);
        break;
    
    case 99:
        array_push(earnArr, ["jump", 1]);
        break;
    
    case 101:
    case 7:
    case 102:
    case 103:
    case 109:
        array_push(earnArr, ["defense", 2]);
        break;
    
    case 271:
        array_push(earnArr, ["attack", 1]);
    
    case 270:
        if (player.move_h != 0 || player.move_v != 0)
            array_push(earnArr, ["swimming", 1]);
        
        break;
    
    case 110:
    case 124:
    case 113:
        array_push(earnArr, ["groundpound", 2]);
        break;
}

if (array_length(earnArr) > 0)
{
    for (var i = 0; i < array_length(earnArr); i++)
    {
        var st = earnArr[i][0];
        var a = earnArr[i][1];
        var stat = struct_get(playerStats, st);
        stat.addExp(a);
    }
    
    event_user(0);
}

while (levelup > 0)
{
    instance_create(player.x + random_range(-10, 10), player.y + random_range(-10, 10), obj_levelup);
    levelup--;
}

alarm[0] = 60;
