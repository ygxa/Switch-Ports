
if global.InternalLevelName = "random"
	global.randomroom = true
else
	global.randomroom = false
nodivejump = 1;
var a = instance_place(x, y, obj_secretwall);
secretArray = (a != -4) ? a.layerArray : [];

if (state != PlayerState.comingoutdoor)
    image_blend = c_white;

inputLadderBuffer = max(inputLadderBuffer - 1, 0);
wetTimer = approach(wetTimer, 0, 3);

if (wetTimer > 0 && wetTimerEffect-- <= 0)
    wetTimerEffect = 3;

if (!instance_exists(heatAfterEffectID))
{
    heatAfterEffectID = instance_create(x, y, obj_heatAfterEffect, 
    {
        playerID: id
    });
}

if (state != PlayerState.normal)
{
    breakdanceBuffer = 0;
    breakdanceSpeed = 0.25;
}

if (fireTrailBuffer > 0)
    fireTrailBuffer -= ((movespeed / 24) * 26);

if (fireTrailBuffer <= 0)
{
    if ((movespeed >= 12 && sprite_index != spr_longJump && sprite_index != spr_longJump_intro && (state == PlayerState.mach2 || state == PlayerState.mach3 || (state == PlayerState.run && movespeed >= 12) || (state == PlayerState.machroll && mach3Roll > 0)) && global.playerCharacter == Characters.Pizzelle) || (state == PlayerState.mach3 && movespeed >= 16 && global.playerCharacter == Characters.Pizzano))
    {
        instance_create(x, y, obj_flameCloud, 
        {
            playerID: id
        });
    }
    
    fireTrailBuffer = 100;
}

if (state != PlayerState.mach3 && state != PlayerState.climbwall)
    machFourMode = false;

if (can_jump && vsp > 0)
    spinminus = 0;

var conveyor_hsp = conveyorBelt_hsp();

if (abs(conveyor_hsp) > 0)
    conveyorHsp = conveyor_hsp;
else if (abs(conveyor_hsp) <= 0)
    conveyorHsp = approach(conveyorHsp, 0, grounded ? 0.75 : 0.5);

if (!hasSeenProgressionPrompt && (room == hub_demohallway || room == hub_paintstudio) && !instance_exists(obj_fadeoutTransition))
{
    hasSeenProgressionPrompt = true;
    scr_queueToolTipPrompt(lang_get("demo_judgement_hint"));
}

if (room == rm_mainmenu || room == rm_introVideo || room == rm_startupLogo || room == rm_disclaimer)
    state = PlayerState.titlescreen;

if (grounded)
{
    floatyGrab = 18;
    
    if (state != PlayerState.machroll)
        divejumped = 0;
    
    noglider = 0;
}

var ceiling = inBackgroundLayer ? (-global.BgInstanceLayerOffset - 600) : -600;

if ((y > (room_height + 400) || y < ceiling) && room != timesuproom && state != 76 && !instance_exists(obj_fadeoutTransition) && !instance_exists(obj_cutsceneManager))
    scr_playerrespawn();

if (state != 37 && state != PlayerState.freefallprep && state != 38 && state != 15)
    freeFallSmash = -14;

if (!global.freezeframe && state != PlayerState.frozen)
{
    if (!instance_exists(baddieGrabbedID) && (state == 17 || state == 4))
        state = PlayerState.normal;
    
    if (state != 17 && state != 4 && state != 15 && state != 46)
        baddieGrabbedID = -4;
    
    if (state != PlayerState.machroll && state != PlayerState.mach3)
        mach3Roll = 0;
}

if (sprite_index == spr_player_PZ_tired && state != PlayerState.normal)
    windingAnim = 0;

if (!global.freezeframe)
    global.ComboFreeze--;

global.ComboFreeze = clamp(global.ComboFreeze, 0, 15);
global.ComboTime = clamp(global.ComboTime, 0, 60);

if (!global.freezeframe && !instance_exists(obj_fadeoutTransition) && global.ComboFreeze <= 0 && !is_tutorial())
    global.ComboTime = approach(global.ComboTime, 0, 0.15);

var c_title = floor(global.Combo / 5);

if (oldComboTitle != c_title && c_title > 0)
{
    instance_destroy(obj_comboTitleEffect);
    instance_destroy(obj_comboEndEffect);
    instance_create(830, 265, obj_comboTitleEffect, 
    {
        title: c_title
    });
    oldComboTitle = c_title;
}

if (global.ComboTime <= 0 && global.Combo != 0)
{
    if (global.Combo > 5)
        scr_queueTVAnimation(global.TvSprPlayer_Happy, 200);
    
    event_play_oneshot("event:/SFX/ui/kashingcombo");
    playComboVariable = -4;
    instance_destroy(obj_comboEndEffect);
    
    with (instance_create(832, 265, obj_comboEndEffect, 
    {
        title: max(c_title, 0)
    }))
    {
        comboScore = global.ComboScore;
        subtractBy = round(global.ComboScore / 50);
        
        if (subtractBy < 25)
            subtractBy = 25;
        
        comboScoreMax = comboScore;
    }
    
    oldComboTitle = 0;
    global.ComboScore = 0;
    global.ComboLost = true;
    global.Combo = 0;
}

if (inputBufferSecondJump < 8)
    inputBufferSecondJump++;

if (inputBufferHighJump < 8)
    inputBufferHighJump++;

inputBufferSecondJump = min(inputBufferSecondJump + 1, 8);
inputBufferHighJump = min(inputBufferHighJump + 1, 8);

if (keyParticles)
    instance_create(x + irandom_range(-20, 20), y + irandom_range(-30, 30), obj_keyeffect);

if (!hurted)
    image_alpha = 1;

var machslide_check = sprite_index == spr_machslideboost3 || sprite_index == spr_machslideboost3FallStart || sprite_index == spr_machslideboost3Fall;
var killmove_states = [PlayerState.mach3, 22, 89, 88, 56, 47, 57, PlayerState.cottondig, 81, 65, 61, 67, 16, 39, 53, 42, 37, 27, 4, 93, 7, 78, 79, 80];

if (array_contains(killmove_states, state) || (state == 34 && machslide_check) || (state == PlayerState.run && movespeed >= 12) || (state == 48 && vsp < 0) || (state == 90 && vsp > 0) || (state == 54 && sprite_index != spr_tumblestart && sprite_index != spr_tumbleend) || (state == PlayerState.climbwall && verticalMovespeed > 8) || (state == 41 && abs(movespeed) >= 10) || (state == PlayerState.machroll && mach3Roll > 0) || (state == 15 && sprite_index == spr_piledriver) || ((state == 15 && sprite_index == spr_piledriverIntro) && sprite_index != spr_player_PZ_werecotton_drill_h) || (state == PlayerState.costumenormal && (sprite_index == spr_player_PN_glider_up || sprite_index == spr_player_PN_glider_up_start)) || sprite_index == spr_player_PN_kungfu_1 || sprite_index == spr_player_PN_kungfu_2 || sprite_index == spr_player_PN_kungfu_3 || sprite_index == spr_player_PN_kungfu_4 || sprite_index == spr_player_PN_kungfu_5 || sprite_index == spr_player_PN_kungfu_air_1_start || sprite_index == spr_player_PN_kungfu_air_2_start || sprite_index == spr_player_PN_kungfu_air_3_start || sprite_index == spr_player_PN_kungfu_air_1 || sprite_index == spr_player_PN_kungfu_air_2 || sprite_index == spr_player_PN_kungfu_air_3 || sprite_index == spr_player_PN_superJump_cancel || sprite_index == spr_player_PN_divejump || sprite_index == spr_player_PN_divejump_start || sprite_index == spr_player_PN_prep_divejump || sprite_index == spr_player_PN_prep_divehold || ((sprite_index == spr_crouchslipintro || sprite_index == spr_crouchslip) && global.blastmode))
    instakillmove = true;
else
    instakillmove = false;

if ((state != PlayerState.jump && state != 30) || vsp < 0)
    fallingAnimation = 0;

if (state != 38 && state != PlayerState.normal && state != 34)
    slamHurt = 0;

if (state != 36)
    player_hurt_buffer = 100;

if (state != PlayerState.normal && state != 34)
    machSlideAnim = false;

if (state != PlayerState.normal)
{
    idle = 0;
    dashdust = 0;
}

if (state != 31 && state != PlayerState.jump && state != PlayerState.grabdash && state != PlayerState.normal && state != PlayerState.mach2 && state != PlayerState.mach3 && state != PlayerState.freefallprep && state != PlayerState.swingclub && state != 47 && state != 57 && state != PlayerState.cottondig)
    momentum = false;

if (state != PlayerState.mach2)
    machPunchAnim = false;

if (state != PlayerState.jump)
    ladderBuffer = 0;

if (state != PlayerState.jump && state != 18)
    stompAnim = false;

if (state != 53)
    slipSlopeBounces = 7;

if (state == PlayerState.mach3 || state == PlayerState.mach2 || state == 27 || state == PlayerState.costumenormal || (state == PlayerState.machroll && mach3Roll > 0) || state == 80 || state == 4 || sprite_index == spr_player_PN_kungfu_1 || sprite_index == spr_player_PN_kungfu_2 || sprite_index == spr_player_PN_kungfu_3 || sprite_index == spr_player_PN_kungfu_4 || sprite_index == spr_player_PN_kungfu_5 || sprite_index == spr_player_PN_kungfu_air_1_start || sprite_index == spr_player_PN_kungfu_air_1 || sprite_index == spr_player_PN_kungfu_air_2_start || sprite_index == spr_player_PN_kungfu_air_2 || sprite_index == spr_player_PN_kungfu_air_3_start || sprite_index == spr_player_PN_kungfu_air_3)
{
    machAfterimage--;
    
    if (machAfterimage <= 0)
    {
        if (global.blastmode)
        {
            if (!grounded)
            {
                with (create_afterimage(choose(PlayerState.titlescreen), xscale, true))
                    mach3Afterimage = true;
            }
            else if (grounded && sprite_index == spr_machdashpad)
            {
                with (create_afterimage(choose(9), xscale, true))
                    mach3Afterimage = true;
            }
            else if (grounded && sprite_index != spr_machdashpad)
            {
                with (create_afterimage(choose(PlayerState.normal), xscale, true))
                    mach3Afterimage = true;
            }
        }
        else
        {
            with (create_afterimage(choose(PlayerState.normal, PlayerState.titlescreen), xscale, true))
                mach3Afterimage = true;
        }
        
        machAfterimage = 6;
    }
}
else
{
    machAfterimage = 0;
}

var up_arrow = ((place_meeting(x, y, obj_door) && !(place_meeting(x, y, obj_doorblocked) || place_meeting(x, y, obj_keydoor) || place_meeting(x, y, obj_janitorDoor))) || (place_meeting(x, y, obj_startGate) && state != PlayerState.victory) || place_meeting(x, y, obj_soundTest_Button) || (place_meeting(x, y, obj_janitorDoor) && (global.janitorRudefollow || ds_list_find_index(global.SaveRoom, instance_place(x, y, obj_janitorDoor).id) != -1)) || (place_meeting(x, y, obj_keydoor) && (ds_list_size(global.KeyFollowerList) > 0 || ds_list_find_index(global.SaveRoom, instance_place(x, y, obj_keydoor).id) != -1)) || (place_meeting(x, y, obj_exitgate) && global.panic == 1)) && !instance_exists(obj_uparrow) && scr_solid(x, y + 1) && state == PlayerState.normal;

if (up_arrow)
    instance_create(x, y, obj_uparrow);

if ((state == PlayerState.mach3 || (state == PlayerState.costumenormal && (sprite_index == spr_player_PN_glider || sprite_index == spr_player_PN_glider_transition)) || (state == 61 && global.paul)) && !instance_exists(obj_speedlines))
{
    instance_create(x, y, obj_speedlines, 
    {
        playerID: id
    });
}

if (state == 7 || (state == 37 && vsp > 0 && buffedpoundcancel && global.playerCharacter == Characters.Pizzano) || state == 78 || state == 79 || ((state != 70 && state == 80) || (((state == 37 && vsp > 0) && scale == 1) && global.blastmode)))
{
    if (global.blastmode)
    {
        hammerAfterimage--;
        
        if (hammerAfterimage <= 0)
        {
            with (create_afterimage(9, xscale, true))
                mach3Afterimage = true;
            
            hammerAfterimage = 3;
        }
    }
    
    blueAfterimage--;
    
    if (blueAfterimage <= 0)
    {
        if (global.blastmode)
        {
            if ((state == 80 || (state == 37 && vsp > 0)) && global.blastmode)
            {
                with (create_afterimage(PlayerState.grabdash, xscale, true))
                    mach3Afterimage = true;
            }
        }
        else
        {
            with (create_afterimage(8, xscale, true))
                mach3Afterimage = true;
        }
        
        blueAfterimage = 6;
    }
}
else
{
    blueAfterimage = 0;
}

if (superTauntBuffer >= 10 && state != 18 && global.Combo >= 10)
{
    if (!superTauntCharged)
        event_play_oneshot("event:/SFX/player/gotsupertaunt", x, y);
    
    superTauntCharged = true;
}

if (place_meeting(x, y + 9, obj_molassesGround))
{
    if (hsp != 0 && (floor(image_index) % 4) == 0 && grounded)
    {
        create_debris(x, y + 43, spr_molassesgoop);
        event_play_oneshot("event:/SFX/player/goopfloor", x, y);
    }
    
    if (state == PlayerState.climbwall && vsp < 0)
        state = PlayerState.normal;
    
    if (vsp < 0 && grounded)
    {
        vsp /= 2;
        create_debris(x, y + 43, spr_molassesgoop);
        event_play_oneshot("event:/SFX/player/goopjump", x, y);
    }
}

if (place_meeting(x, y + 3, obj_icyGround) && grounded)
{
    if (sign(hsp) != sign(prevHsp))
        slideHsp += (prevHsp / 1.5);
    
    if (scr_slope())
        slideHsp += (0.25 * slopeMomentum_acceleration());
}
else if (grounded)
{
    slideHsp = approach(slideHsp, 0, 0.35);
}

if (!grounded)
    slideHsp = approach(slideHsp, 0, 0.6);

slideHsp = approach(slideHsp, 0, 0.15);
slideHsp = clamp(abs(slideHsp), 0, 3) * sign(slideHsp);

if (state == PlayerState.climbwall)
    slideHsp = 0;

dashpadBuffer = max(dashpadBuffer - 1, 0);
kungBuffer = max(kungBuffer - 1, 0);
global.HighestCombo = max(global.Combo, global.HighestCombo);

if (playerNoInputBuffer < playerNoInputBufferMax)
    playerNoInputBuffer++;

if (any_input_check())
    playerNoInputBuffer = 0;

if ((room == hub_paintstudio || room == hub_demohallway || room == hub_molasses) && state != PlayerState.door && state != PlayerState.victory)
    blastunlock();

if (((key_up && key_jump2) || key_superjump) && state != PlayerState.mach3 && grounded && can_jump && vsp > 0 && (state == PlayerState.normal || state == PlayerState.mach2) && global.playerCharacter == Characters.Pizzano && !global.blastmode)
{
    sprite_index = spr_superjumpPrep;
    state = 28;
    hsp = 0;
    image_index = 0;
}

if (global.playerCharacter == Characters.Pizzano && !global.paul)
{
    windingAnim = 0;
    breakdanceBuffer = 0;
    
    if (sprite_index != spr_player_PN_fastfall)
        buffedpoundcancel = 0;
    
    if (state != PlayerState.mach2 && state != PlayerState.machroll && nodivejump == 1)
        nodivejump = 0;
    
    obj_achievementTracker.paletteUnlockspr = spr_paletteUnlock_PN;
}
else
{
    obj_achievementTracker.paletteUnlockspr = spr_paletteUnlock;
}

if (instance_exists(obj_parent_enemy))
{
    if (state == 80 && global.blastmode)
        obj_parent_enemy.canBeStomped = false;
    else
        obj_parent_enemy.canBeStomped = true;
}

if (global.blastmode)
{
    if (!global.freezeframe)
    {
        if (timesboosted == 0)
            dashbuffer = 0;
        
        if (dashbuffer > 0)
            dashbuffer--;
        else
            dashbuffer = 0;
    }
    
    if ((state == PlayerState.normal && !machSlideAnim && buffersavespeed <= 0) || state == PlayerState.door || state == PlayerState.ladder || state == PlayerState.victory || state == 48 || state == PlayerState.jump || (scr_transformationCheck(state) == "Werecotton" || scr_transformationCheck(state) == "Ball" || scr_transformationCheck(state) == "Fling" || scr_transformationCheck(state) == "Minecart" || scr_transformationCheck(state) == "Frostburn" || scr_transformationCheck(state) == "Marshdog" || scr_transformationCheck(state) == "Rocket"))
    {
        timesboosted = 0;
        speedreducebuffer = 20;
        buffersavespeed = 0;
    }
    
    if (global.truepaul)
    {
        if (timesboosted < 0)
            timesboosted = 0;
    }
    else
    {
        timesboosted = clamp(timesboosted, 0, 7);
    }
    
    if (state == PlayerState.mach3)
    {
        if (runbufferhud > 0)
            runbufferhud--;
        else
            runbufferhud = 0;
        
        if (runaddspeed < 56)
        {
            if (fastincrease == 1)
                runaddspeed += 2.15;
            else
                runaddspeed += 1.15;
        }
        else
        {
            fastincrease = 0;
            runaddspeed = 56;
        }
        
        if (runbuffer < 10 && runbufferhud >= 10)
            runbufferhud = runbuffer;
    }
    else
    {
        runbufferhud = 45;
        runaddspeed = 0;
    }
    
    if (state != 70 || (state == 70 && (sprite_index == spr_lappingportal_enter || sprite_index == spr_lappingportal_enter_PN || sprite_index == spr_gotTreasure || instance_exists(obj_judgmentpainter))))
    {
        if (scalexblast != 1)
            scalexblast = approach(scalexblast, 1, 0.05);
        
        if (scaleyblast != 1)
            scaleyblast = approach(scaleyblast, 1, 0.05);
    }
    
    if (mask_index == spr_crouchmask)
    {
        paulscale = 0.5;
    }
    else if ((paulsprite == spr_paulHDremaster_enter || paulsprite == spr_paulHDremaster_enter_painting || paulsprite == spr_paulHDremaster_enter_key || paulsprite == spr_paul_enter || paulsprite == spr_paul_enter_painting || paulsprite == spr_paul_enter_key || paulsprite == spr_paulHDremaster_lappingportal_enter || paulsprite == spr_paul_lappingportal_enter) && room != rank_room && !instance_exists(obj_endlevelfade))
    {
        if (paulsprite == spr_paulHDremaster_enter_painting || paulsprite == spr_paul_enter_painting)
        {
            paulscale = approach(paulscale, 0, 0.015);
            paulxscale = approach(paulxscale, 0, 0.015);
            xpos = lerp(xpos, 49, 0.15);
        }
        else if ((paulsprite == spr_paulHDremaster_enter_key || paulsprite == spr_paul_enter_key) && image_index > 28)
        {
            paulscale = approach(paulscale, 0, 0.04);
            paulxscale = approach(paulxscale, 0, 0.04);
            xpos = lerp(xpos, 23, 0.1);
        }
        else if (paulsprite == spr_paulHDremaster_lappingportal_enter || paulsprite == spr_paul_lappingportal_enter)
        {
            paulscale = approach(paulscale, 0, 0.1);
            paulxscale = approach(paulxscale, 0, 0.1);
        }
        else if (paulsprite != spr_paulHDremaster_enter_key && paulsprite != spr_paulHDremaster_enter_painting && paulsprite != spr_paul_enter_key && paulsprite != spr_paul_enter_painting)
        {
            paulscale = approach(paulscale, 0, 0.04);
            paulxscale = approach(paulxscale, 0, 0.04);
            xpos = lerp(xpos, 23, 0.1);
        }
    }
    else if (paulsprite == spr_paulHDremaster_walkfront || paulsprite == spr_paul_walkfront)
    {
        paulscale = approach(paulscale, 1, 0.025);
        paulxscale = approach(paulxscale, 1, 0.025);
        
        if (image_index > 5)
        {
            xpos = lerp(xpos, 0, 0.06);
            
            if (xpos > 0)
                xpos -= 0.2;
        }
    }
    else if (room == rank_room)
    {
        paulxscalerank = approach(paulxscalerank, 10, 0.075);
        paulyscalerank = approach(paulyscalerank, 10, 0.075);
        
        if (yposrankjump == 1)
            yposrank = lerp(yposrank, -800, 0.05);
        else
            yposrank = lerp(yposrank, 800, 0.05);
        
        if (yposrankjumpbuffer > 0)
            yposrankjumpbuffer--;
        else
            yposrankjump = 0;
    }
    else if (paulsprite == spr_paulHDremaster || paulsprite == spr_paulHDremaster_point || paulsprite == spr_paul_point || paulsprite == spr_paul)
    {
        paulscale = 1;
        paulxscale = 1;
        xpos = 0;
    }
    
    if (global.paul)
    {
        paulindex += 0.35;
        
        if (room == hub_mindpalace || room == hub_mindvault)
            global.paul = 0;
        
        if (key_taunt && (paulsprite == spr_paulHDremaster || paulsprite == spr_paul))
        {
            if (pointBuffer++ >= 10)
            {
                if (global.paulAB)
                    paulsprite = spr_paul_point;
                else
                    paulsprite = spr_paulHDremaster_point;
            }
        }
        else if (!key_taunt || sprite_index == spr_cottonIntroLeft || sprite_index == spr_cottonIntroRight || sprite_index == spr_lookdoor || sprite_index == spr_walkfront || sprite_index == spr_victory || sprite_index == spr_player_PZ_enter_painting || sprite_index == spr_player_PN_enter_painting)
        {
            pointBuffer = 0;
        }
    }
    
    if (pointBuffer <= 0)
    {
        switch (sprite_index)
        {
            case spr_cottonIntroLeft:
                if (global.paulAB)
                    paulsprite = spr_paul_werecottonintroLeft;
                else
                    paulsprite = spr_paulHDremaster_werecottonintroLeft;
                
                break;
            
            case spr_cottonIntroRight:
                if (global.paulAB)
                    paulsprite = spr_paul_werecottonintroRight;
                else
                    paulsprite = spr_paulHDremaster_werecottonintroRight;
                
                break;
            
            case spr_player_PZ_enter_painting:
            case spr_player_PN_enter_painting:
                if (global.paulAB)
                    paulsprite = spr_paul_enter_painting;
                else
                    paulsprite = spr_paulHDremaster_enter_painting;
                
                break;
            
            case spr_lookdoor:
                if (global.paulAB)
                    paulsprite = spr_paul_enter;
                else
                    paulsprite = spr_paulHDremaster_enter;
                
                break;
            
            case spr_walkfront:
                if (global.paulAB)
                    paulsprite = spr_paul_walkfront;
                else
                    paulsprite = spr_paulHDremaster_walkfront;
                
                break;
            
            case spr_victory:
                if (!place_meeting(x, y, obj_startGate))
                {
                    if (global.paulAB)
                        paulsprite = spr_paul_enter_key;
                    else
                        paulsprite = spr_paulHDremaster_enter_key;
                }
                
                break;
            
            case spr_lappingportal_enter:
            case spr_lappingportal_enter_PN:
                if (global.paulAB)
                    paulsprite = spr_paul_lappingportal_enter;
                else
                    paulsprite = spr_paulHDremaster_lappingportal_enter;
                
                break;
            
            default:
                if (state != 61)
                {
                    if (global.paulAB)
                        paulsprite = spr_paul;
                    else
                        paulsprite = spr_paulHDremaster;
                }
                
                break;
        }
    }
    
    if (paulsprite != spr_paulHDremaster && paulsprite != spr_paulHDremaster_point && paulsprite != spr_paulHDremaster_point && paulsprite != spr_paul)
        paulindex = image_index;
    
    if ((place_meeting(x, y + 1, obj_minecartRail) || place_meeting(x, y + 1, obj_minecartRail_Slope) || place_meeting(x + 1, y, obj_minecartRail) || place_meeting(x + 1, y, obj_minecartRail_Slope)) && state != 61 && (state != 35 || (state == 35 && vsp > 0)) && vsp > 0 && global.paul && state != 70 && state != 0 && state != 76)
    {
        if (movespeed < 12)
            movespeed = 12;
        
        if (move != 0)
            xscale = move;
        
        state = 61;
        image_index = 0;
        sprite_index = spr_mach3player;
    }
}

if (global.playerCharacter == Characters.Pizzano)
{
    if (workinprogressbuffer > 0 && workinprogress)
    {
        workinprogressbuffer--;
    }
    else if (workinprogressbuffer <= 0 && workinprogress)
    {
        create_debris(x, y, spr_workinprogress);
        workinprogress = 0;
    }
    
    if ((sprite_index == spr_player_PZ_minecart || sprite_index == spr_player_PZ_minecart_jump || sprite_index == spr_player_PZ_minecart_fall || sprite_index == spr_player_PZ_idle_dance || sprite_index == spr_player_PZ_walk_dance || sprite_index == spr_player_PZ_werecotton_idle || sprite_index == spr_player_PZ_werecotton_walk) && workinprogressbuffer > 0)
    {
        workinprogress = 1;
        
        if (workinprogressbuffer == 100)
            instance_create_depth(x, y, -100, obj_poofeffectwip);
    }
}
