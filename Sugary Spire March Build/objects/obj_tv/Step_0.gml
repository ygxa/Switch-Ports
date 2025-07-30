scr_tvsprites()
if !visible sprite_index = spr_tvoff
if (showtext == 1) {
    xi = (480 + random_range(1, -1));
    if (yi > 475)
        yi -= 5;
}
if (showtext == 0) {
    xi = (480 + random_range(1, -1));
    if (yi < 675)
        yi += 1;
}
if (!(obj_player.state == states.knightpep && obj_player.state == states.knightpepattack && obj_player.state == states.knightpepslopes)) 
	once = 0;

//The Funny TV Move
if (obj_player.y < 180 + obj_camera.Cam_y && obj_player.x > camera_get_view_width(view_camera[0]) - 350 + obj_camera.Cam_x) {
	DrawY = lerp(DrawY, -300, 0.15);
	alpha = 0.5;
}
else {
	DrawY = lerp(DrawY, 0, 0.15);
	alpha = 1;
}
if (global.collect > global.arank && shownranka == 0) {
    //image_speed = 0;
    message = "YOU GOT ENOUGH FOR RANK A";
    showtext = 1;
    alarm[0] = 200;
    //tvsprite = 635;
    shownranka = 1;
}
else if (global.collect > global.brank && shownrankb == 0) {
    //image_speed = 0;
    message = "YOU GOT ENOUGH FOR RANK B";
    showtext = 1;
    alarm[0] = 200;
    //tvsprite = 636;
    shownrankb = 1;
}
else if (global.collect > global.crank && shownrankc == 0) {
    //image_speed = 0;
    message = "YOU GOT ENOUGH FOR RANK C";
    showtext = 1;
    alarm[0] = 200;
    //tvsprite = 637;
    shownrankc = 1;
}
/*else if (obj_player.sprite_index == spr_player_levelcomplete)
{
    image_speed = 0.1;
    alarm[0] = 50;
    chose = 1;
    tvsprite = 645;
    once = 1;
}
else if (obj_player.state == states.hurt)
{
    image_speed = 0.1
    showtext = 1
    if (chose == 0)
        message = choose("OW!", "OUCH!", "OH!", "WOH!")
    alarm[0] = 50
    chose = 1
    tvsprite = 643
    once = 1
}
else if (obj_player.state == states.timesup)
{
    alarm[0] = 50
    image_speed = 0.1
    tvsprite = 630
}*/
if (global.hurtcounter >= global.hurtmilestone && global.hurtcounter >= 3) {
	showtext = 1;
    alarm[0] = 150;
    //image_speed = 0.1;
    if (obj_player.character == "P")
        character = "PIZZY";
    else
        character = "PIZZANO";
    message = (((("YOU HAVE HURT " + string(character)) + " ") + string(global.hurtmilestone)) + " TIMES...");
    //if (tvsprite != 634 && tvsprite != 633 && tvsprite != 632 && tvsprite != 631) tvsprite = choose(634, 633, 632, 631);
    global.hurtmilestone += 3;
}
/*else if (obj_player.state == states.skateboard)
{
    showtext = 1
    message = "SWEET DUDE!!"
    alarm[0] = 50
    tvsprite = 638
    once = 1
}
else if (obj_player.state == states.slipnslide)
{
    image_speed = 0.1
    showtext = 1
    message = "OOPS!!"
    alarm[0] = 50
    tvsprite = 640
    once = 1
}
else if (global.combo != 0 && global.combotime != 0 && (tvsprite == 647 || tvsprite == 648 || tvsprite == 649))
{
    tvsprite = 648
    image_speed = 0
    if (global.combo >= 4)
        imageindexstore = 3
    else
        imageindexstore = (global.combo - 1)
}
else if (global.combotime == 0 && tvsprite == 648)
{
    tvsprite = 646
    image_index = imageindexstore
    alarm[0] = 50
}
else if (global.panic == 1)
{
    image_speed = 0.1
    tvsprite = 649
}*/
if (obj_player.state == states.keyget) {
    showtext = 1;
    message = "KEY OBTAINED!";
    alarm[0] = 50;
}
if staticdraw
	statictimer--
if statictimer < 0
	staticdraw = false
var allstate = global.freezeframe ? obj_player.frozenstate : obj_player.state 




switch state {
	case states.normal:
		idlespr = idletvspr
		if obj_player.angry idlespr = angrytvspr
		var _transfo = true
		switch allstate {
			default: _transfo = false; break;	
			case states.mach1:
			case states.mach2:
			case states.handstandjump:
			case states.machslide:
			case states.climbwall:
			case states.machroll:
			case states.crouchslide:
			case states.mach3:
				_transfo = false;
				var my_mvsp = global.freezeframe ? abs(obj_player.frozenhsp) : abs(obj_player.hsp)
				if allstate == states.climbwall my_mvsp = global.freezeframe ? abs(obj_player.frozenvsp) : abs(obj_player.vsp)
				idlespr = mach1tvspr		
				if my_mvsp >= 8 || allstate == states.handstandjump idlespr = mach2tvspr
				if my_mvsp >= 12 || allstate == states.mach3 idlespr = mach3tvspr
				if my_mvsp >= 20 || obj_player.sprite_index == obj_player.spr_crazyrun idlespr = mach4tvspr
				if allstate == states.handstandjump || allstate == states.crouchslide idlespr = mach1tvspr
			break;
		
			case states.hooks:
				idlespr = hooktvspr
			break;
			case states.minecart:
				idlespr = minecarttvspr
			break;
			case states.fireass:
				idlespr = firetvspr
			break;
			case states.bombpep:
				idlespr = bombtvspr
			break;
			case states.cotton:
			case states.cottondrill:
			case states.cottonroll:
				idlespr = cottontvspr
			break;
			case states.frostburn:
			case states.frostburnspin:
			case states.frostburnwallrun:
			case states.rupertjump:
			case states.rupertnormal:
			case states.rupertslide:
			case states.rupertstick:
				idlespr = frostburntvspr;
			break;
			case states.fling: 
				idlespr = orbtvspr;
			break;	
			case states.ufofloat: 
				idlespr = ufotvspr;
			break;			
		}
		if !_transfo {
			if allstate == states.hurt scr_queue_tvanim(hurttvspr, 60)	
			//Combo TV anim
			if global.combo mod 3 == 0 && playComboVariable != global.combo && global.combotime > 0 && global.combo > 0 {
				scr_queue_tvanim(combotvspr, 250);
				playComboVariable = global.combo;
			}
		}
	
	
		switch sprite_index
		{
			case spr_tvoff:
				if visible
				{
					sprite_index = spr_tvturnon
					image_index = 0
				}
				break
			case spr_tvturnon:
				if (floor(image_index) == (image_number - 1))
					sprite_index = idletvspr
				break
			case idletvspr:
	
				idleanim--
				if (idleanim <= 0 && floor(image_index) == (image_number - 1))
				{
					sprite_index = choose(tvchange1, tvchange2)
					image_index = 0
				}
				break
			case tvchange1:
			case tvchange2:
				if (floor(image_index) == (image_number - 1))
				{
					sprite_index = idlespr
					idleanim = choose(500, 450, 400, 550);
				}
				//if (idlespr != idletvspr)
				//	sprite_index = idlespr
				break
		}
		if saved_tv_spr != idlespr && !draw_static && !global.freezeframe {
			saved_tv_spr = idlespr
			draw_static = true
			//trace("TO WHITE NOISE")
			state = states.tv_transition
			static_index = 0
				
		}
	
	break;
	case states.tv_transition:
		//sprite_index = spr_tv_whitenoise
		draw_static = true
		saved_tv_spr = idlespr
		if floor(static_index) >= 4
		{
			//trace("Switch")
			//noisebuffer = noisemax
			if (expressionsprite != -4)
			{
				state = states.tv_expression
				sprite_index = expressionsprite
			}
			else {
				state = states.normal
				sprite_index = saved_tv_spr	
			}
			image_index = 0
			draw_static = 0
		}
	break;
	case states.tv_expression:
		switch expressionsprite {
			case hurttvspr:
				if allstate != states.hurt expressiontime--
			break;
			default: expressiontime-- break;		
		}
		if expressiontime <= 0 {
			state = states.tv_transition
			expressionsprite = -4
			draw_static = true
			static_index = 0
		}
	
	break;
	
	
}



/*
if tvsprite != spr_tvturnon && ds_queue_size(global.newhudtvanim) < 1 && tvlength <= 0
{
	switch allstate {
		case states.hurt:
			ChannelState = 0;
			tvsprite = hurttvspr
		break;
		case states.hooks:
			ChannelState = 1;
			tvsprite = hooktvspr
		break;
		case states.minecart:
			ChannelState = 2;
			tvsprite = minecarttvspr
		break;
		case states.fireass:
			ChannelState = 3;
			tvsprite = firetvspr
		break;
		case states.bombpep:
			ChannelState = 4;
			tvsprite = bombtvspr
		break;
		case states.cotton:
		case states.cottondrill:
		case states.cottonroll:
			ChannelState = 5;
			tvsprite = cottontvspr
		break;
		case states.frostburn:
		case states.frostburnspin:
		case states.frostburnwallrun:
		case states.rupertjump:
		case states.rupertnormal:
		case states.rupertslide:
		case states.rupertstick:
			ChannelState = 6;
			tvsprite = frostburntvspr;
		break;
		case states.fling: 
			ChannelState = 7;
			tvsprite = orbtvspr;
		break;	
		case states.ufofloat: 
		case states.ufodash: 
			ChannelState = 8;
			tvsprite = ufotvspr;
		break;			
		case states.mach1:
		case states.mach2:
		case states.handstandjump:
		case states.machslide:
		case states.climbwall:
		case states.machroll:
		case states.crouchslide:
		case states.mach3:
			ChannelState = 9;
			tvsprite = mach2tvspr;
			if allstate == states.mach1 || allstate == states.handstandjump || allstate == states.crouchslide
				tvsprite = mach1tvspr;
			if allstate == states.mach3
				tvsprite = mach3tvspr;
			if allstate == states.mach3 && obj_player.movespeed > 20
				tvsprite = mach4tvspr;			
		break;

		default:
		
			if obj_player.angry == 0 {
				ChannelState = 9;
				//Normal Idles
				if tvsprite != idletvspr && !(tvsprite == tvchange1 || tvsprite == tvchange2) {
					tvcount = choose(500, 450, 400, 550);
					tvsprite = idletvspr;
					image_index = 0;					
				}
				//Idle Animations
				if tvsprite == idletvspr && tvcount < 1 {
					tvsprite = choose(tvchange1, tvchange2, tvchange2, tvchange1);
					image_index = 0;
				}				
				//End of Idle Animations
				if (tvsprite == tvchange1 || tvsprite == tvchange2) && animation_end() {
					tvcount = choose(500, 450, 400, 550);
					tvsprite = idletvspr;
					image_index = 0;
				}
				//Idle Animations Timer
				if tvsprite == idletvspr 
					tvcount--;
			}
			else {
				ChannelState = 9;
				tvsprite = angrytvspr
			}
			break;
	}
	
	if OLDChannelState != ChannelState
	{
		staticdraw = true;
		statictimer = 20;
		OLDChannelState = ChannelState;
	}	
}
//Textbubble
/*
if ds_queue_size(global.newhudmessage) > 1 && showingnewtext = false && tvsprite != spr_tvturnon && tvsprite != spr_tvstatic
{
	new_message = ds_queue_dequeue(global.newhudmessage);
	//var tvspr = ds_queue_dequeue(global.newhudmessage);
	//Anim Spr
	/*if tvspr != noone
	{
		newtvsprite = tvspr;
		tvanimtext = true;
		tvanim = true
		drawstatic = true
		drawstatictimer = 15
		oldsprite = newtvsprite 
	}
	shownewtext = true;
	showingnewtext = true;
	textbubblesprites = spr_tv_bubbleopen;
	textbubbleframes = 0;
	text_x = 300;
}
*/
if textbubblesprites = spr_tv_bubbleopen && floor(textbubbleframes) >= sprite_get_number(spr_tv_bubbleopen) - 1
	textbubblesprites = spr_tv_bubble
if textbubblesprites = spr_tv_bubble
	text_x += -3
if textbubblesprites = spr_tv_bubbleclose && floor(textbubbleframes) >= sprite_get_number(spr_tv_bubbleclose) - 1
{
	new_message = ""
	shownewtext = false;
	showingnewtext = false;
	textbubbleframes = 0;
	text_x = 300;		
}
#region Transformation text
switch(obj_player.state)
{
	case states.cotton:
	case states.cottondrill:
	case states.cottonroll:
	if ds_list_find_index(global.saveroom, "cotton") = -1  
	{
		scr_queue_message("Mmmph!! MMMPH!! MMPPH! (This cotton is quite a delicacy, isn't it?)");
		ds_list_add(global.saveroom, "cotton")
	}
	break;
	case states.minecart:
	if ds_list_find_index(global.saveroom, "minecart") = -1  
	{
		scr_queue_message("Easy... easy... hold on to your hats... hard hats, rather.");
		ds_list_add(global.saveroom, "minecart")
	}
	break;
	case states.fireass:
	if ds_list_find_index(global.saveroom, "fireass") = -1  
	{
		scr_queue_message("Breaking news... local candy maker finds himself burned by caramel.");
		scr_queue_message("What an idiot. How does that even happen?")
		ds_list_add(global.saveroom, "fireass")
	}
	break;
	case states.fling:
	if ds_list_find_index(global.saveroom, "fling") = -1  
	{
		scr_queue_message("Aughh!! What kind of black magic has this flying frog casted upon me?! Feels kinda nice.");
		ds_list_add(global.saveroom, "fling")
	}
	break;
	case states.flushed:
	if ds_list_find_index(global.saveroom, "flushed") = -1  
	{
		scr_queue_message("Incredibly cold temperatures are causing random individuals to be frozen solid. We recommend you stay inside during these chilly times.");
		ds_list_add(global.saveroom, "flushed")
	}
	break;
}
#endregion

#region Combo Text & Voicelines
switch obj_player.character
{
	case "P":
	voice1 = sfx_combovoice1p
	voice2 = sfx_combovoice2p
	voice3 = sfx_combovoice3p
	voice4 = sfx_combovoice4p
	voice5 = sfx_combovoice5p
	voice6 = sfx_combovoice6p
	voice7 = sfx_combovoice7p
	voice8 = sfx_combovoice8p
	break;
	default:
	case "N":
	voice1 = sfx_combovoice1n
	voice2 = sfx_combovoice2n
	voice3 = sfx_combovoice3n
	voice4 = sfx_combovoice4n
	voice5 = sfx_combovoice5n
	voice6 = sfx_combovoice6n
	voice7 = sfx_combovoice7n
	voice8 = sfx_combovoice8n
	break;
}
#endregion

//Propeller and Static Image Index Fix
propindex += .5

statindex += .3
/*
if statindex >= 12
statindex = 0
else if tvsprite != spr_tvturnon && ds_queue_size(global.newhudtvanim) > 1
{
	tvsprite = ds_queue_dequeue(global.newhudtvanim);
	tvlength = ds_queue_dequeue(global.newhudtvanim);
}

	
if tvlength > 0
{
	ChannelState = 99;
	if OLDChannelState != ChannelState
	{
		staticdraw = true;
		statictimer = 20;
		OLDChannelState = ChannelState;
	}	
}
	
tvlength--
textbubbleframes += 0.35;
*/


if global.key_inv == 1 
	invsprite = spr_invkey;
else if global.treat == 1 && global.key_inv != 1
	invsprite = spr_invdonut;
else 
	invsprite = spr_invempty;
	
/*
if tvsprite == spr_tvturnon && floor(image_index) == (image_number - 1) 
	tvsprite = idletvspr;
//sprite_index = tvsprite;
*/
var timeinsecs = floor(target_fill / 60)
var secs = max((timeinsecs % 60), 0)
goo_index += 0.22
if goo_index >= (sprite_get_number(spr_combometer_goo) - 1)
	goo_index = frac(goo_index)



if global.panic {
	if global.fill > 0 {
		var _spd = (1 - (target_fill / global.maxwave)) * (sprite_get_number(spr_bartimer_roll) * 10)
		roll_index = _spd % sprite_get_number(spr_bartimer_roll)
		oldTimer_index = secs % 2
		coneball_index += 0.35
		oldBall_index += 0.35
		if coneball_index >= (sprite_get_number(coneball_sprite))
			coneball_index = frac(coneball_index)	
		if oldBall_index >= (sprite_get_number(oldBall_sprite))
			oldBall_index = frac(oldBall_index)	
		if roll_index >= (sprite_get_number(roll_sprite))
			roll_index = frac(roll_index)	
		if !get_panic() timer_y = approach(timer_y, 150, 4)
		else if timer_in <= 0 timer_y = approach(timer_y, 0, 1)
	}
	else {
		if oldBall_sprite = spr_timer_coneball_idle {
			oldBall_sprite = spr_timer_coneball
			oldBall_index = 0
		}
		if coneball_sprite == spr_bartimer_normalFront {
			coneball_sprite = spr_bartimer_showtime
			coneball_index = 0
			
		}
		if coneball_index < (sprite_get_number(coneball_sprite) - 1)
			coneball_index += 0.35
		if oldBall_index < (sprite_get_number(oldBall_sprite) - 1)
			oldBall_index += 0.35
		if oldTimer_index < (sprite_get_number(oldTimer_sprite) - 1)
			oldTimer_index += 0.35	
		if timer_out > 0
			timer_out--
		else timer_y = approach(timer_y, 150, 1)
	}
	if timer_in > 0
		timer_in--
	
}
else {
	timer_y = 150
	timer_out = 220
	timer_in = 60
	oldTimer_sprite = spr_timer
	oldBall_sprite = spr_timer_coneball_idle
	coneball_sprite = spr_bartimer_normalFront
	
}
var tgtY = (1 - (global.combotime / 60))
if global.combo = 0 
	tgtY = 1
hand_y = lerp(hand_y, 54 * tgtY, 0.3)
//if keyboard_check_pressed(ord("I"))
	//scr_queue_tvanim(spr_pizzytvuncanny, 300)
if global.combo != 0 && global.combotime > 0 {
	switch combo_state {
		case states.changing:
			combo_vsp++
			combo_y = approach(combo_y, 40, combo_vsp)
			if combo_y >= 40
				combo_state = states.normal
		break
		case states.normal:
			var pct = (global.combotime / 60) 
			var _shk = 2
			var _t = 5
			if global.combotime < 30 {
				_shk = 3
				_t = 1.1
			}
			if global.combotime < 15 {
				_shk = 2
				_t = 0.15
			}

			combo_y = lerp(combo_y, wave(-2, 2, 8, 3), 0.05)
			combo_x = wave(-_shk, _shk, _t, 5)
		break
		
	}
	hand_x = approach(hand_x, combo_x, 5)
}
else {
	combo_y = approach(combo_y, -200, 5)
	hand_x = approach(hand_x, 80, 5)
	combo_vsp = 0
	combo_state = states.changing
	
}

if prompt_timer > 0 && !promptappear {
	promptalpha = approach(promptalpha, 1, 0.05)
	prompt_timer--	
}
else if promptappear || prompt_timer <= 0
{
	promptalpha = approach(promptalpha, 0, 0.05)
	if promptalpha <= 0
	{
		controlprompt = nexttext
		promptappear = false
	}
}