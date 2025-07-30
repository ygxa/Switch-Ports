if (instance_exists(o_demrec) && o_demrec.state == (1 << 0))
{
    instance_create_depth(x, y, depth, o_demrecdoll2);
    instance_destroy();
}

switch (global.player2)
{
    case "PS":
        if (!instance_exists(o_player_default2))
        {
            global.player2intro = true;
            instance_create_layer(x, y, layer, o_player_default2);
        }
        
        break;
    
    case "NO":
        if (!instance_exists(o_player_noise2))
        {
            global.player2intro = true;
            instance_create_layer(x, y, layer, o_player_noise2);
        }
        
        break;
    
    case "TV":
        if (!instance_exists(o_player_vigilante2))
        {
            global.player2intro = true;
            instance_create_layer(x, y, layer, o_player_vigilante2);
        }
        
        break;
    
    case "FP":
        if (!instance_exists(o_player_fakepep2))
        {
            global.player2intro = true;
            instance_create_layer(x, y, layer, o_player_fakepep2);
        }
        
        break;
    
    case "DO":
        if (!instance_exists(o_player_doise2))
        {
            global.player2intro = true;
            instance_create_layer(x, y, layer, o_player_doise2);
        }
        
        break;
    
    case "PF":
        if (!instance_exists(O_Pizzaface))
        {
            global.player2intro = true;
            instance_create_layer(x, y + 25, layer, O_Pizzaface);
        }
        
        break;
}

damagemeteract = 0;
blue_aftereffect = 0;
blastdamaged = 0;
noisebomb = 0;
inv = false;
damagenull = false;
detect = 0;
parry = false;
landanim = false;
justspawned = 150;
crouchanim = false;
crouch = false;
unparry = false;
healthbar_width = 180;
healthbar_height = 50;
healthbar_x = 750;
healthbar_y = 82;
pause = 0;
introanim = false;
doublekey = 0;
doublekey_t = 0;
doublekey_t_max = 15;
sprint = false;
sprintstartanim = false;
cputimerbaybee = 0;
cpu_recovering = false;
stun = 0;
hi_squidward = 40;
hmove = 1;
key_left = 0;
key_right = 0;
key_jump = 0;
key_up = 0;
key_down = 0;
key_E = 0;
key_Q = 0;
key_taunt = 0;
key_double_pressed = 0;
rightstickup = false;
rightstickdown = false;
rightstickleft = false;
rightstickright = false;
sprintcurrent = 0;
CPUtimetillpath = 200;
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

if (global.P2Cpu == false)
{
    enable_controller();
    controller_initialize(global.P2controllerport);
}

sprintstopping = 5;
damagemeter = 0;
damagemetermax = 100;
damagemeter_height = 25;
damagemeter_width = 177;
projectilehit = 0;
lerpto = 0;
surf = -4;
offsetx = 0;
arrowalpha = 0;
punchcooldown = 3;

if (!instance_exists(o_maker2))
    instance_create_layer(x, y, layer, o_maker2);
