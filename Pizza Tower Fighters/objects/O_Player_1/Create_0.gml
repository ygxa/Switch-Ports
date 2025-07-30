if (instance_exists(o_demrec) && o_demrec.state == (1 << 0))
{
    instance_create_depth(x, y, depth, o_demrecdoll);
    instance_destroy();
}

switch (global.player1)
{
    case "PS":
        if (!instance_exists(o_player_default))
        {
            global.player1intro = true;
            instance_create_layer(x, y, layer, o_player_default);
        }
        
        break;
    
    case "NO":
        if (!instance_exists(o_player_noise))
        {
            global.player1intro = true;
            instance_create_layer(x, y, layer, o_player_noise);
        }
        
        break;
    
    case "TV":
        if (!instance_exists(o_player_vigilante))
        {
            global.player1intro = true;
            instance_create_layer(x, y, layer, o_player_vigilante);
        }
        
        break;
    
    case "FP":
        if (!instance_exists(o_player_fakepep))
        {
            global.player1intro = true;
            instance_create_layer(x, y, layer, o_player_fakepep);
        }
        
        break;
    
    case "DO":
        if (!instance_exists(o_player_doise))
        {
            global.player1intro = true;
            instance_create_layer(x, y, layer, o_player_doise);
        }
        
        break;
    
    case "sheen":
        if (!instance_exists(o_player_sheen))
        {
            global.player1intro = true;
            instance_create_layer(x, y, layer, o_player_sheen);
        }
        
        break;
		
    default:
        if (!instance_exists(o_player_default))
        {
            global.player1intro = true;
            instance_create_layer(x, y, layer, o_player_default);
        }
        
        break;
}

blue_aftereffect = 0;
blastdamaged = 0;
landanim = false;
noisebomb = 0;
vsp = 0;
damagenull = false;
stun = 0;
inv = false;
crouchanim = false;
parry = false;
unparry = false;
crouch = false;
detect = 0;
healthbar_width = 180;
healthbar_height = 50;
healthbar_x = 29;
healthbar_y = 82;
pause = 0;
justspawned = 150;
introanim = false;
axis_left_prev2 = false;
axis_right_prev2 = false;
axis_up_prev2 = false;
axis_down_prev2 = false;
b_left_press2 = false;
b_right_press2 = false;
b_down_press2 = false;
b_up_press2 = false;
rightstickLeftPressed = false;
rightstickRightPressed = false;
rightstickDownPressed = false;
rightstickUpPressed = false;
controller_initialize(global.P1controllerport);
doublekey = 0;
doublekey_t = 0;
doublekey_t_max = 15;
sprint = false;
sprintstartanim = false;
sprint_controller_trigger = false;
hi_squidward = 40;
sprintcurrent = 0;
sprintstopping = 5;
damagemeter = 0;
damagemetermax = 100;
damagemeter_height = 25;
damagemeter_width = 177;
damagemeteract = 0;
projectilehit = 0;
lerpto = 0;
surf = -4;
offsetx = 0;
arrowalpha = 0;
punchcooldown = 3;

if (!instance_exists(o_marker))
    instance_create_layer(x, y, layer, o_marker);
