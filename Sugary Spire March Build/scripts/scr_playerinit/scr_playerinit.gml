#region Enums
	enum states 
	{
		//The numbers mean nothing now (Don't try obtaining the state from it)
		frozen, // = 01233545953460346295460540704w50623,
		normal, // = 0,
		titlescreen, // = 1,
		Nhookshot, // = 2,
		slap, // = 5,
		charge, // = 88, //watchout
		cheesepep, // = 6,
		cheeseball, // = 4,
		cheesepepstick, // = 7,
		boxxedpep, // = 8,
		pistolaim, // = 9,
		climbwall, // = 10,
		climbdownwall, // = 10,
		knightpepslopes, // = 11,
		portal, // = 12,
		secondjump, // = 13,
		chainsawbump, // = 14,
		handstandjump, // = 15,
		gottreasure, // = 16,
		knightpep, // = 17,
		knightpepattack, // = 18,
		meteorpep, // = 19,
		bombpep, // = 20,
		grabbing, // = 21,
		chainsawpogo, // = 22,
		shotgunjump, // = 23,
		stunned, // = 24,
		highjump, // = 25,
		chainsaw, // = 26,
		facestomp, // = 27,
		timesup, // = 29,
		machroll, // = 30,
		pistol, // = 32,
		shotgun, // = 31,
		machfreefall, // = 33,
		Throw, // = 34,
		superslam, // = 36,
		slam, // = 35,
		skateboard, // = 37,
		grind, // = 38,
		grab, // = 39,
		punch, // = 40,
		backkick, // = 41,
		uppunch, // = 42,
		shoulder, // = 43,
		backbreaker, // = 44,
		bossdefeat, // = 45,
		bossintro, // = 47,
		ufofloat, // = 55,
		ufodash, // = 55,
		pizzathrow, // = 46,
		gameover, // = 48,
		Sjumpland, // = 85,
		freefallprep, // = 84,
		runonball, // = 82,
		boulder, // = 81,
		keyget, // = 49,
		tackle, // = 50,
		slipnslide, // = 53,
		ladder, // = 52,
		jump, // = 51,
		victory, // = 57,
		comingoutdoor, // = 54,
		Sjump, // = 56,
		Sjumpprep, // = 58,
		crouch, // = 59, //Here
		crouchjump, // = 60,
		crouchslide, // = 61,
		mach1, // = 62,
		mach2, // = 63,
		mach3, // = 83,
		machslide, // = 64,
		bump, // = 65,
		hurt, // = 66,
		freefall, // = 67,
		freefallland, // = 70,
		hang, // = 68,
		door, // = 71,
		barrelnormal, // = 77,
		barrelfall, // = 76,
		barrelmach1, // = 75,
		barrelmach2, // = 74,
		barrelfloat, // = 73,
		barrelcrouch, // = 72,
		barrelslipnslide, // = 78,
		barrelroll, // = 79,
		current, // = 80,
		finishingblow, // = states.finishingblow, //mark
		cotton, // = 100,
		uppercut, // = 101, //mark
		pal, // = 102, //mark
		shocked, // = 103,
		bushdisguise, // = 104,
		parry, // = 105,
		talkto, // = 107,
		puddle, // = 108,
		tumble, // = 109,
		cottondrill, // = 110,
		cottonroll, // = 111,
		fling,
		breakdance, // = 114,
		minecart, // = 117,
		squished, // = 119,
		machtumble, // = 120,
		pizzanosidejump, // = 888,
		pizzanomach, // = 999,
		pizzanokungfu, // = 999,
		pizzanopummel,
		fireass, // = 100000,
		geyser,
		actor,
		donothing,
		changing,
		coneboyattack, // = 300,
		coneboydive, // = 301,
		coneboyinhale, // = 302,
		coneboykick,
		
		gumbobpropeller,
		gumbobmixnbrew,
		
		twirl,
		machtwirl,
		pizzanoshoulderbash,
		pizzanowalljump,
		
		mini,
		smirk,
		flushed,
		
		hooks,		
		
		trick,
		
		noclip,
		costumenormal,
		costumegrab,
		costumebreeze,
		costumechuck,

		bottlerocket,
		holdbomb,
		bombgroundpound,
		bombrun,
		
		donut,
		drown,		
		climbceiling,
		
		frostburn,
		frostburnwallrun,
		frostburnspin,
		frostburnbump,
		seacream,
		seacreamjump,
		seacreamstick,
		balloon,
		rupertnormal,
		rupertslide,
		rupertjump,
		rupertstick,
		fucking,
		honey,
		supergrab,
		tv_transition,
		tv_expression,

		

	}
	
	enum baddiestate 
	{
		idle,
		charge, 
		turn, //
		walk,
		land,
		hit,
		stun,
		Throw,
		grabbed,//
		scared, 
		frozen,
		shake,
		panicwait,
		secretwait,
		inhaled,
		cherrywait,
		cherryactive,
		applejimBash,
		kick,
		slugidle,
		slugjump,
		slugparry,
		float,
		theif,
		eyescreamwait,
		eyescream,
		rage,
		intro,

		/*
		idle = 86,
		charge = 88, 
		turn = states.finishingblow, //
		walk = 94,
		land = 96,
		hit = 97,
		stun = 98,
		Throw = 89,
		grabbed = 101, //
		inhaled = 9999999
		*/
	}
	

	
	
	enum cardtype {
	up,
	down,
	left,
	right,
	
	linear,
	interp,
	waving,
	shake,
	none
}
	
#endregion

function scr_playerrespawn() {
	if state != states.gameover && state != states.actor && state != states.fling && !place_meeting(x, y, obj_vertical_hallway) && !instance_exists(obj_fadeout) && room != outer_room2 && room != timesuproom && room != rank_room
	{
		var _checkpoint = instance_nearest(x, y, obj_checkpoint_invis);
		var _checkpointReal = noone;
		with obj_checkpoint {
			if Checkpointactivated == true {
				_checkpointReal = id;
			}
		}
		if instance_exists(_checkpoint) && _checkpoint.Checkpointactivated = true {
			x = _checkpoint.x;
			y = _checkpoint.y;
			instance_create(_checkpoint.x, _checkpoint.y, obj_poofeffect);
		} else if instance_exists(_checkpointReal) && _checkpointReal.Checkpointactivated = true {
			x = _checkpointReal.x;
			y = _checkpointReal.y;
			instance_create(_checkpointReal.x, _checkpointReal.y, obj_poofeffect);
		} else {
			x = roomstartx;
			y = roomstarty;
			instance_create(roomstartx, roomstarty, obj_poofeffect);	
		}
		if instance_exists(obj_train) { //Train Restart
			with obj_train {
				x = xstart;
				y = ystart;
				image_xscale = start_xscale;
				image_index = 0;
				sprite_index = spr_spray;
				vsp = 0;
				movespeed = 10;
				state = trainstate.idle;
			}
		}	
		state = states.hurt;
		alarm[8] = 60/2;
		alarm[7] = 120/2;
		hurted = 1;
		sprite_index = spr_hurt;
		movespeed = 0;
		vsp = -3;	
	}
}
function scr_playerstate() {
	var _stateFunction = undefined;
    switch state
    {
        case states.normal:
            _stateFunction = state_player_normal;//
            break
        case states.titlescreen:
            _stateFunction = state_player_titlescreen;//
            break
        case states.Nhookshot:
            _stateFunction = scr_playerN_hookshot;//
            break
        case states.slap:
            _stateFunction = state_player_slap;//
            break
        case states.charge:
            _stateFunction = state_player_charge;//
            break
        case states.cheesepep:
            _stateFunction = state_player_cheesepep;//
            break
        case states.cheeseball:
            _stateFunction = state_player_cheeseball;//
            break
        case states.cheesepepstick:
            _stateFunction = state_player_cheesepepstick;//
            break
        case states.boxxedpep:
            _stateFunction = state_player_boxxedpep;//
            break
        case states.pistolaim:
            _stateFunction = state_player_pistolaim;//
            break
        case states.climbwall:
            _stateFunction = state_player_climbwall;//
            break
        case states.climbdownwall:
            _stateFunction = state_player_climbdownwall;//
            break
        case states.knightpepslopes:
            _stateFunction = state_player_knightpepslopes;//
            break
        case states.portal:
            _stateFunction = state_player_portal;//
            break
        case states.secondjump:
            _stateFunction = state_player_secondjump;//
            break
        case states.chainsawbump:
            _stateFunction = state_player_chainsawbump;//
            break
        case states.handstandjump:
            _stateFunction = state_player_handstandjump;//
            break
        case states.gottreasure:
            _stateFunction = state_player_gottreasure;//
            break
        case states.knightpep:
            _stateFunction = state_player_knightpep;//
            break
        case states.knightpepattack:
            _stateFunction = state_player_knightpepattack;//
            break
        case states.meteorpep:
            _stateFunction = state_player_meteorpep;//
            break
        case states.bombpep:
            _stateFunction = state_player_bombpep;//
            break
        case states.grabbing:
            _stateFunction = state_player_grabbing;//
            break
        case states.chainsawpogo:
            _stateFunction = state_player_chainsawpogo;//
            break
        case states.shotgunjump:
            _stateFunction = state_player_shotgunjump;//
            break
        case states.stunned:
            _stateFunction = state_player_stunned;//
            break
        case states.highjump:
            _stateFunction = state_player_highjump;//
            break
        case states.chainsaw:
            _stateFunction = state_player_chainsaw;//
            break
        case states.facestomp:
            _stateFunction = state_player_facestomp;//
            break
        case states.timesup:
            _stateFunction = state_player_timesup;//
            break
        case states.machroll:
            _stateFunction = state_player_machroll;//
            break
        case states.pistol:
            _stateFunction = state_player_pistol;//
            break
        case states.shotgun:
            _stateFunction = state_player_shotgun;//
            break
        case states.machfreefall:
            _stateFunction = state_player_machfreefall;//
            break
        case states.Throw:
            _stateFunction = state_player_throw;//
            break
        case states.superslam:
            _stateFunction = state_player_superslam;//
            break
        case states.slam:
            _stateFunction = state_player_slam;//
            break
        case states.skateboard:
            _stateFunction = state_player_skateboard;//
            break
        case states.grind:
            _stateFunction = state_player_grind;//
            break
        case states.grab:
            _stateFunction = state_player_grab;//
            break
        case states.punch:
            _stateFunction = state_player_punch;//
            break
        case states.backkick:
            _stateFunction = state_player_backkick;//
            break
        case states.uppunch:
            _stateFunction = state_player_uppunch;//
            break
        case states.shoulder:
            _stateFunction = state_player_shoulder;//
            break
        case states.backbreaker:
            _stateFunction = state_player_backbreaker;//
            break
        case states.bossdefeat:
            _stateFunction = state_player_bossdefeat;//
            break
        case states.bossintro:
            _stateFunction = state_player_bossintro;//
            break
        case states.ufofloat:
            _stateFunction = state_player_ufofloat;//
            break
        case states.ufodash:
            _stateFunction = state_player_ufodash;//
            break
        case states.pizzathrow:
            _stateFunction = state_player_pizzathrow;//
            break
        case states.gameover:
            _stateFunction = state_player_gameover;//
            break
        case states.Sjumpland:
            _stateFunction = state_player_Sjumpland;//
            break
        case states.freefallprep:
            _stateFunction = state_player_freefallprep;//
            break
        case states.runonball:
            _stateFunction = state_player_runonball;//
            break
        case states.boulder:
            _stateFunction = state_player_boulder;//
            break
        case states.keyget:
            _stateFunction = state_player_keyget;//
            break
        case states.tackle:
            _stateFunction = state_player_tackle;//
            break
        case states.slipnslide:
            _stateFunction = state_player_slipnslide;//
            break
        case states.ladder:
            _stateFunction = state_player_ladder;//
            break
        case states.jump:
            _stateFunction = state_player_jump;//
            break
        case states.victory:
            _stateFunction = state_player_victory;//
            break
        case states.comingoutdoor:
            _stateFunction = state_player_comingoutdoor;//
            break
        case states.Sjump:
            _stateFunction = state_player_Sjump;//
            break
        case states.Sjumpprep:
            _stateFunction = state_player_Sjumpprep;//
            break
        case states.crouch:
            _stateFunction = state_player_crouch;//
            break
        case states.crouchjump:
            _stateFunction = state_player_crouchjump;//
            break
        case states.crouchslide:
            _stateFunction = state_player_crouchslide;//
            break
        case states.mach1:
            _stateFunction = state_player_mach1;//
            break
        case states.mach2:
            _stateFunction = state_player_mach2;//
            break
        case states.mach3:
            _stateFunction = state_player_mach3;//
            break
        case states.machslide:
            _stateFunction = state_player_machslide;//
            break
        case states.bump:
            _stateFunction = state_player_bump;//
            break
        case states.hurt:
            _stateFunction = state_player_hurt;//
            break
        case states.freefall:
            _stateFunction = state_player_freefall;//
            break
        case states.freefallland:
            _stateFunction = state_player_freefallland;//
            break
        case states.hang:
            _stateFunction = state_player_hang;//
            break
        case states.door:
            _stateFunction = state_player_door;//
            break
        case states.barrelnormal:
            _stateFunction = state_player_barrelnormal;//
            break
        case states.barrelfall:
            _stateFunction = state_player_barrelfall;//
            break
        case states.barrelmach1:
            _stateFunction = state_player_barrelmach1;//
            break
        case states.barrelmach2:
            _stateFunction = state_player_barrelmach2;//
            break
        case states.barrelfloat:
            _stateFunction = state_player_barrelfloat;//
            break
        case states.barrelcrouch:
            _stateFunction = state_player_barrelcrouch;//
            break
        case states.barrelslipnslide:
            _stateFunction = state_player_barrelslipnslide;//
            break
        case states.barrelroll:
            _stateFunction = state_player_barrelroll;//
            break
        case states.current:
            _stateFunction = state_player_current;//
            break
		case states.finishingblow:
			_stateFunction = state_player_finishingblow;//
			break
		case states.cotton:
			_stateFunction = state_player_cotton;//
			break
		case states.uppercut:
			_stateFunction = state_player_uppercut;//
			break
		case states.pal:
			_stateFunction = state_player_pal;//
			break
		case states.shocked:
			_stateFunction = state_player_shocked;//
			break
		case states.bushdisguise:
			_stateFunction = state_player_bushdisguise;//
			break
		case states.parry:
			_stateFunction = state_player_parry;//
			break
		case states.tumble:
			_stateFunction = state_player_tumble;//
			break
		case states.talkto:
			_stateFunction = state_player_talkto;//
			break
		case states.puddle:
			_stateFunction = state_player_puddle;//
			break
		case states.cottondrill:
			_stateFunction = state_player_cottondrill;//
			break
		case states.cottonroll:
			_stateFunction = state_player_cottonroll;//
			break
        case states.fling:
            _stateFunction = state_player_fling;//
            break			
		case states.breakdance:
			_stateFunction = state_player_breakdance;//
			break
		case states.gumbobpropeller:
			_stateFunction = scr_gumbob_propeller;//
			break
		case states.gumbobmixnbrew:
			_stateFunction = scr_gumbob_mixnbrew;//
			break
		case states.minecart:
			_stateFunction = state_player_minecart;//
			break
		case states.fireass:
			_stateFunction = state_player_fireass;//;
			break;
		case states.squished:
			_stateFunction = state_player_squished;//;
			break;
		case states.machtumble:
			_stateFunction = state_player_machtumble;//;
			break;
		case states.pizzanomach:
			_stateFunction = scr_mach_pizzano;//
			break;
		case states.pizzanosidejump:
			_stateFunction = scr_rocketfist_pizzano;//
			break;
		case states.pizzanokungfu:
			_stateFunction = scr_pizzano_kungfu;//
			break;
		case states.pizzanopummel:
			_stateFunction = scr_pizzano_pummel;//
			break;
		case states.coneboyattack:
			_stateFunction = scr_coneboy_inhale;//;
			break;
			
		case states.coneboydive:
			_stateFunction = scr_coneboy_inhale;//;
			break;
			
		case states.coneboyinhale:
			_stateFunction = scr_coneboy_inhale;//;
			break;
			
		case states.coneboykick:
			_stateFunction = scr_coneboy_kick;//;
			break;
		
		case states.geyser:
			_stateFunction = state_player_geyser;//;
			break;		
			
		case states.twirl:
			_stateFunction = scr_pizzano_twirl;//;
			break;	
		case states.machtwirl:
			_stateFunction = scr_pizzano_machtwirl;//;
			break;	
		case states.pizzanoshoulderbash:
			_stateFunction = scr_pizzano_shoulderbash;//;
			break;
		case states.pizzanowalljump:
			_stateFunction = scr_pizzano_wallcling;//;
			break;
			break;	
			
		case states.actor:
			_stateFunction = state_player_actor;//;
			break;			
			
		case states.changing:
			_stateFunction = state_player_changing;//;
			break;			
		
		case states.donothing:
			_stateFunction = state_player_donothing;//;
			break;
		
		case states.mini:
			_stateFunction = state_player_mini;//;
			break;
		
		case states.flushed:
			_stateFunction = state_player_flushed;//
			break
		case states.drown:
			_stateFunction = state_player_drown;//
			break
		case states.frozen:
	        _stateFunction = state_player_frozen;//
	        break
		case states.hooks:
	        _stateFunction = state_player_hooks;
	        break	
		case states.trick:
	        _stateFunction = state_player_trick;
	        break	
		case states.noclip:
	        _stateFunction = state_player_noclip;
	        break	
		case states.costumenormal:
	        _stateFunction = state_player_costumenormal;//;
	        break	
		case states.costumegrab:
	        _stateFunction = state_player_costumegrab;//;
	        break	
		case states.costumechuck:
	        _stateFunction = state_player_costumechuck;//;////;/;//;/;/;/;/;/;/;/;;/;///;;//;//;/;/;/;
	        break	
		case states.costumebreeze:
	        _stateFunction = state_player_costumebreeze;//;////;/;//;/;/;/;/;/;/;/;;/;///;;//;//;/;/;/;
	        break	
		case states.bottlerocket:
	        _stateFunction = state_player_bottlerocket;//;////;/;//;/;/;/;/;/;/;/;;/;///;;//;//;/;/;/;
	        break	
		case states.donut:
	        _stateFunction = state_player_donut;
			break
		case states.holdbomb:
	        _stateFunction = state_player_holdbomb;
	        break	
		case states.climbceiling:
	        _stateFunction = state_player_climbceiling;
	        break	
		case states.frostburn:
			_stateFunction = state_player_frostburn;
			break
		case states.frostburnwallrun:
			_stateFunction = state_player_frostburnwallrun;
			break
		case states.frostburnspin:
			_stateFunction = state_player_frostburnspin;
			break
		case states.seacream:
			_stateFunction = state_player_seacream;
			break
		case states.seacreamjump:
			_stateFunction = state_player_seacreamjump;
			break
		case states.seacreamstick:
			_stateFunction = state_player_seacreamstick;
			break
		case states.frostburnbump:
			_stateFunction = state_player_frostburnbump;
			break
		case states.balloon:
			_stateFunction = state_player_gumballoon;
			break
		case states.rupertnormal:
			_stateFunction = state_player_rupertnormal;
			break
		case states.rupertslide:
			_stateFunction = state_player_rupertslide;
			break
		case states.rupertjump:
			_stateFunction = state_player_rupertjump;
			break
		case states.rupertstick:
			_stateFunction = state_player_rupertstick;
			break
		case states.honey:
			_stateFunction = state_player_honey;
			break
		case states.supergrab:
			_stateFunction = state_player_supergrab;
			break
		case states.smirk:
			show_error("Smirk old code lmao", false);
			_stateFunction = state_player_ufodash;
			break
    }
	stateName = "states.undefined"
	if !is_undefined(_stateFunction) {
		_stateFunction();
		
		stateName = "states." + string_extract(script_get_name(_stateFunction), "_" ,1) + string_extract(script_get_name(_stateFunction), "_" , 3);
	}
}

function scr_taunt_storeVariables() {
	tauntStored = {
		state : state,
		hsp : hsp,
		prevHsp : prevHsp,
		vsp : vsp,
		prevVsp : prevVsp,
		movespeed : movespeed,
		verticalMovespeed : verticalMovespeed,
		sprite_index : sprite_index,
		image_index : image_index
	}
}

function scr_taunt_setVariables() {
	state = tauntStored.state;
	hsp = tauntStored.hsp;
    prevHsp = tauntStored.prevHsp;
    vsp = tauntStored.vsp;	
	prevVsp = tauntStored.prevVsp;
    movespeed = tauntStored.movespeed;
    verticalMovespeed = tauntStored.verticalMovespeed;
    sprite_index = tauntStored.sprite_index;
    image_index = tauntStored.image_index;
}