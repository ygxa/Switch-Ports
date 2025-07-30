scr_getinput();
scr_characterspr();
scr_playerstate();

if (place_meeting(x, y, obj_exitgate) && state == 59)
{
    var _check = false;
    
    with (instance_place(x, y, obj_exitgate))
        _check = ds_list_find_index(global.saveroom, id) != -1;
    
    if (!_check)
    {
        global.playmiliseconds = 0;
        global.playseconds = 0;
        global.playminutes = 0;
        global.playhour = 0;
    }
}

if (state != 59)
    image_blend = make_color_hsv(0, 0, 255);

if (firetrailbuffer > 0)
    firetrailbuffer -= ((movespeed / 24) * 26);

if (firetrailbuffer <= 0)
{
    if (movespeed >= 12 && (state == 66 || state == 67 || state == 29))
        instance_create(x, y, obj_flamecloud);
    
    firetrailbuffer = 100;
}

if (global.playerrotate == 1)
{
    if (grounded && vsp >= 0 && !(state == 10 || state == 93 || state == 38 || state == 72 || state == 31 || state == 84 || state == 98))
    {
        var targetangle, RotationStep;
        
        if (abs(hsp) >= 8)
        {
            targetangle = scr_slopeangle();
            RotationStep = (((abs(hsp) / 16) + (abs(hsp) / 32)) - 2) * -1;
        }
        else
        {
            targetangle = 360;
            RotationStep = ((abs(hsp) / 16) - 2) * -1;
        }
        
        draw_angle = darctan2(dsin(targetangle) + (dsin(draw_angle) * RotationStep), dcos(targetangle) + (dcos(draw_angle) * RotationStep));
    }
    else
    {
        if (draw_angle <= 0)
            draw_angle += 360;
        
        if (draw_angle < 180)
            draw_angle = max(draw_angle - 2.8125, 0);
        else
            draw_angle = min(draw_angle + 2.8125, 360);
    }
}

if (room == realtitlescreen || room == scootercutsceneidk)
    state = 1;

if (grounded)
    groundedcot = 1;

if (y > (room_height + 64))
    scr_playerrespawn();

if (state != 71 && state != 50 && state != 72)
    freefallsmash = 0;

if (!instance_exists(baddiegrabbedID) && (state == 38 || (state == 34 && sprite_index != spr_piledriverland) || state == 4))
    state = 0;

if (!(state == 38 || state == 4 || state == 34 || state == 84))
    baddiegrabbedID = -4;

if (character == "P")
{
    if (anger == 0)
        angry = 0;
    
    if (anger > 0)
    {
        angry = 1;
        anger -= 1;
    }
}

if (angry == 1 && sprite_index == spr_idle)
    sprite_index = spr_player_3hpidle;

scr_playersounds();

if (state == 29)
{
    if (!audio_is_playing(sound_tumble))
        scr_sound(80);
}
else
{
    audio_stop_sound(sound_tumble);
}

if (sprite_index == spr_player_winding && state != 0)
    windingAnim = 0;
else
    audio_stop_sound(sound_superjumpcharge2);

if (suplexmove == true && grounded)
{
    suplexmove = false;
    flash = true;
}

if (obj_player.state != 15)
    grav = 0.5;

if (sprite_index == spr_player_idlevomit && image_index > 28 && image_index < 43)
    instance_create(x + random_range(-5, obj_ridetest3), y + 46, obj_vomit);

if (sprite_index == spr_player_idlevomitblood && image_index > 28 && image_index < 43)
{
    with (instance_create(x + random_range(-5, obj_ridetest3), y + 46, obj_vomit))
        sprite_index = spr_vomit2;
}

if (angry == 1 && !instance_exists(obj_angrycloud) && obj_player.state == 0)
    instance_create(x, y, obj_angrycloud);

global.combotime = clamp(global.combotime, 0, 60);

if (global.combofreeze <= 0)
    global.combotime = approach(global.combotime, 0, 0.15);

if ((global.combo % 3) == 0 && playComboVariable != global.combo && global.combotime > 0 && global.combo > 0)
{
    scr_queue_tvanim(791, 250);
    playComboVariable = global.combo;
}

global.combofreeze--;
global.combofreeze = clamp(global.combofreeze, 0, 75);

if (global.combotime <= 0 && global.combo != 0)
{
    if (global.combo > 5)
        scr_queue_tvanim(467, 200);
    
    global.combo = 0;
    playComboVariable = -4;
}

if (input_buffer_jump < 8)
    input_buffer_jump++;

if (input_buffer_secondjump < 8)
    input_buffer_secondjump++;

if (input_buffer_highjump < 8)
    input_buffer_highjump++;

if (key_particles == 1)
    instance_create(random_range(x + 25, x - 25), random_range(y + 35, y - 25), obj_keyeffect);

if (inv_frames == 0 && hurted == 0)
    image_alpha = 1;

if (state == 66 || state == 4 || state == 36 || state == 17 || state == 8 || state == 5 || state == 11 || state == 18 || state == 20 || state == 27 || state == 32 || state == 27 || state == 29 || state == 67 || state == 71 || state == 60)
    attacking = 1;
else
    attacking = 0;

if (state == 33 || state == 39 || state == 40 || state == 42 || state == 41)
    grabbing = 1;
else
    grabbing = 0;

if ((state == 67 || (state == 95 && movespeed > 8) || state == 100 || state == 98 || state == 103 || state == 92 || state == 2 || state == 36 || state == 28 || state == 71 || state == 60 || state == 29 || state == 32 || state == 4 || (state == 34 && sprite_index == spr_piledriver) || (state == 34 && sprite_index == spr_player_piledriverstart) || state == 17 || state == 18 || state == 11 || state == 8 || state == 5 || state == 6) || state == 86)
    instakillmove = 1;
else
    instakillmove = 0;

if (flash == 1 && alarm[0] <= 0)
    alarm[0] = 0.15 * room_speed;

if (state != 67 && state != 68)
    autodash = 0;

if ((state != 57 && state != 63 && state != 3) || vsp < 0)
    fallinganimation = 0;

if (state != 72 && state != 0 && state != 68)
    facehurt = 0;

if (state != 0 && state != 68)
    machslideAnim = 0;

if (state != 0)
{
    idle = 0;
    dashdust = 0;
}

if (state != 65 && state != 57 && state != 2 && state != 15 && state != 0 && state != 66 && state != 67 && state != 50 && state != 17 && state != 31 && state != 11 && state != 85 && state != 95)
    momemtum = 0;

if (state != 60 && state != 61)
    a = 0;

if (state != 27)
    facestompAnim = 0;

if (state != 71 && state != 27 && state != 34 && state != 72)
    superslam = 0;

if (state != 66)
    machpunchAnim = 0;

if (state != 57)
    ladderbuffer = 0;

if (state != 57)
    stompAnim = 0;

if (toomuchalarm1 > 0)
    toomuchalarm1 -= 1;

if (toomuchalarm1 <= 0 && (state == 67 || state == 2 || state == 66 || state == 4 || (state == 68 && mach2 >= 100) || state == 29 || state == 15 || state == 94 || state == 98 || (state == 101 && sprite_index != spr_pizzano_sjumpprepside) || state == 112 || (state == 26 && mach2 >= 100)))
{
    with (instance_create(x, y, obj_mach3effect))
    {
        playerid = other.object_index;
        image_index = other.image_index - 1;
        image_xscale = other.xscale;
        sprite_index = other.sprite_index;
    }
    
    toomuchalarm1 = 6;
}

if (state != 69 && state != 95 && state != 62 && state != 8 && state != 30 && state != 93 && sprite_index != spr_player_crouchshoot && state != 61 && state != 26 && state != 29 && state != 70 && state != 64 && state != 63 && sprite_index != spr_pizzano_crouchslide)
    mask_index = spr_player_mask;
else
    mask_index = spr_crouchmask;

if (state == 16 || sprite_index == spr_knightpep_start || sprite_index == spr_knightpep_thunder || state == 53 || state == 74 || state == 58 || state == 59 || state == 48)
    cutscene = 1;
else
    cutscene = 0;

if (state != 70)
    hurtsound = mu_rankd;

if (((place_meeting(x, y, obj_door) && !place_meeting(x, y, obj_doorblocked)) || (place_meeting(x, y, obj_startgate) && state != 58) || place_meeting(x, y, obj_keydoorclock) || place_meeting(x, y, obj_keydoor) || (place_meeting(x, y, obj_exitgate) && global.panic == 1)) && !instance_exists(obj_uparrow) && scr_solid(x, y + 1) && state == 0)
    instance_create(x, y, obj_uparrow);

if ((state == 66 || state == 67) && !instance_exists(obj_speedlines))
    instance_create(x, y, obj_speedlines);

if (state != 43)
{
    if (global.combo >= 3 && supertauntbuffer < 500 && supertauntcharged == false)
        supertauntbuffer++;
    
    if (supertauntbuffer >= 500 && supertauntcharged == false && state != 43)
    {
        supertauntbuffer = 500;
        supertauntcharged = true;
    }
    
    if (global.combo < 3)
    {
        supertauntbuffer = 0;
        supertauntcharged = false;
    }
    
    if (supertauntcharged == true && room != rank_room)
    {
        if (!instance_exists(supertaunteffect))
        {
            with (instance_create(x, y, obj_supertaunteffect))
            {
                other.supertaunteffect = id;
                playerid = other.id;
            }
        }
    }
}

scr_collide_destructibles();

if (place_meeting(x, y + 1, obj_molassesGround))
{
    if (hsp != 0 && (floor(image_index) % 4) == 0)
    {
        with (instance_create(x, y + 43, obj_debris))
        {
            sprite_index = spr_molassesgoop;
            image_index = irandom_range(0, 5);
        }
    }
    
    if (vsp < 0 && grounded)
    {
        vsp /= 2;
        
        with (instance_create(x, y + 43, obj_debris))
        {
            sprite_index = spr_molassesgoop;
            image_index = irandom_range(0, 5);
        }
    }
}

if (state != 89)
    bushdetection = 0;

if (state != 62)
    crouchjumptimer = 0;

if (gumbobpropellercooldown > 0)
    gumbobpropellercooldown--;

if (global.starrmode == 1)
{
    if (global.starrmode == 1 && state == 67)
        movespeed = 12;
    else if (state == 67 && movespeed > 12)
        movespeed = 12;
}

if (state == 74 || place_meeting(x, y, obj_hallway) || state == 58)
    global.roomsave = 0;

if (Dashpad_buffer > 0)
    Dashpad_buffer = max(Dashpad_buffer - 1, 0);

if (sprite_index == spr_player_machpunch1 && floor(image_index) == (image_number - 1))
    sprite_index = spr_mach;

if (sprite_index == spr_player_machpunch2 && floor(image_index) == (image_number - 1))
    sprite_index = spr_mach;
