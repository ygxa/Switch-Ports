if stopInputs
{
    if (alarm[0] <= 0)
        alarm[0] = 15
    return;
}
var can_pause = (!((instance_exists(obj_fadeout) || room == rm_evilleafyishere || instance_exists(obj_titlecard) || instance_exists(obj_levelselect) || instance_exists(obj_technicaldifficulty) || instance_exists(obj_option) || instance_exists(obj_optionNew) || instance_exists(obj_rank) || instance_exists(obj_endlevelfade) || instance_exists(obj_antiPiracy) || instance_exists(obj_credits))))
with (obj_player1)
{
    if ((state == (100 << 0) && place_meeting(x, y, obj_startgate)) || state == (91 << 0))
        can_pause = false
}
if (input_check_pressed("start") && global.shellactivate == false && can_pause)
{
    if (room == rm_mainmenu && state == (1 << 0))
    {
        if (obj_mainmenu.state != (1 << 0))
            return;
        scr_soundeffect(choose(wackySound__01, wackySound__02, wackySound__03, wackySound__04, wackySound__05, wackySound__06, wackySound__07, wackySound__08, wackySound__09, wackySound__10, wackySound__11, wackySound__14, wackySound__16, wackySound__17, wackySound__18, wackySound__19, wackySound__20, wackySound__21))
        instance_create(0, 0, obj_optionNew)
        state = (0 << 0)
        return;
    }
    if (state == (1 << 0))
    {
        state = (0 << 0)
        toppin_has[0] = global.tomatofollow
        toppin_has[1] = global.pineapplefollow
        toppin_has[2] = global.shroomfollow
        toppin_has[3] = global.sausagefollow
        toppin_has[4] = global.cheesefollow
        savedSecrets = global.secretfound
        savedJanitor = global.gerome
        savedPanic = global.panic
        if (!surface_exists(pause_surf))
            pause_surf = surface_create(960, 540)
        if surface_exists(pause_surf)
        {
            surface_set_target(pause_surf)
            draw_clear_alpha(c_black, 0)
            gpu_set_blendenable(false)
            draw_surface_stretched_ext(application_surface, 0, 0, 960, 540, 16777215, 1)
            gpu_set_blendenable(true)
            gpu_set_blendmode(bm_normal)
            shader_reset()
            with (obj_tv)
            {
                if visible
                    event_perform(ev_draw, ev_gui)
            }
            with (obj_camera)
            {
                if visible
                    event_perform(ev_draw, ev_gui)
            }
            with (obj_greenifier)
            {
                if visible
                    event_perform(ev_draw, ev_gui)
            }
            gpu_set_blendenable(true)
            surface_reset_target()
        }
        if sprite_exists(pause_spr)
            sprite_delete(pause_spr)
        pause_spr = sprite_create_from_surface(pause_surf, 0, 0, 960, 540, 0, 0, 0, 0)
        surface_free(pause_surf)
        pause_all_sounds(true)
        scr_pausemusic()
        scr_pauseinstances()
        scr_soundeffect(startthegamebuttonshit)
		audio_resume_sound(mu_pause)
        
    }
    else
    {
        state = (1 << 0)
        pause = false
        scr_unpauseinstances()
        scr_unpausemusic()
        pause_all_sounds(false)
        return;
    }
}
if (state == (0 << 0))
{
    pauseScale = lerp(pauseScale, 1, 0.2)
    pauseX = lerp(pauseX, 0, 0.2)
    pauseY = lerp(pauseY, 0, 0.2)
    pauseAlpha = lerp(pauseAlpha, 1, 0.1)
    realPauseAlpha = approach(realPauseAlpha, 1, 0.2)
}
else
{
    selected = 0
    pauseScale = lerp(pauseScale, 5, 0.3)
    pauseX = lerp(pauseX, -230, 0.2)
    pauseY = lerp(pauseY, -80, 0.2)
    pauseAlpha = lerp(pauseAlpha, 0, 0.1)
    if (pauseScale > 3.5)
        realPauseAlpha = approach(realPauseAlpha, 0, 0.1)
}
bgX += 0.2
bgY += 0.2
if (state == (0 << 0) && (!instance_exists(obj_option)) && (!instance_exists(obj_optionNew)))
{
    var prevselected = selected
    var moveselect = (-input_check_pressed("up")) + input_check_pressed("down")
    selected += moveselect
    if (moveselect != 0 && selected >= 0 && selected <= 2)
        scr_soundeffect(choose(sfx_pausesounds_01, sfx_pausesounds_02, sfx_pausesounds_03, sfx_pausesounds_04, sfx_pausesounds_05, sfx_pausesounds_06))
    selected = clamp(selected, 0, (array_length(pause_menu) - 1))
    if input_check_pressed("jump")
    {
        switch selected
        {
            case 0:
                state = (1 << 0)
                pause = false
                scr_unpauseinstances()
                scr_unpausemusic()
				instance_activate_all()
                pause_all_sounds(false)
                return;
            case 2:
                var roomname = room_get_name(room)
                var rm = -4
                rm = global.leveltorestart
                ds_list_clear(global.saveroom)
                ds_list_clear(global.baddieroom)
                if (rm != -4 && rm != -1)
                {
                    scr_unpauseinstances()
                    instance_activate_all()
                    stop_all_sounds()
                    scr_unpausemusic()
                    audio_stop_sound(global.music)
                    obj_music.music = -4
                    alarm[1] = 1
                    pause = false
                    state = (1 << 0)
                }
                else
                    scr_soundeffect(choose(wackySound__01, wackySound__02, wackySound__03, wackySound__04, wackySound__05, wackySound__06, wackySound__07, wackySound__08, wackySound__09, wackySound__10, wackySound__11, wackySound__14, wackySound__16, wackySound__17, wackySound__18, wackySound__19, wackySound__20, wackySound__21))
                return;
            case 1:
                scr_soundeffect(choose(wackySound__01, wackySound__02, wackySound__03, wackySound__04, wackySound__05, wackySound__06, wackySound__07, wackySound__08, wackySound__09, wackySound__10, wackySound__11, wackySound__14, wackySound__16, wackySound__17, wackySound__18, wackySound__19, wackySound__20, wackySound__21))
                with (instance_create(x, y, obj_optionNew))
                    depth = other.depth - 3
                state = (0 << 0)
                return;
            case 3:
                if (room == rm_levelselect || string_copy(room_get_name(room), 1, 3) == "hub")
                {
                    state = (1 << 0)
                    pause = false
                    scr_unpauseinstances()
                    scr_unpausemusic()
                    audio_stop_sound(global.music)
                    pause_all_sounds(false)
					instance_activate_all()
                    room_goto(rm_mainmenu)
                    with (obj_player1)
                    {
                        character = "P"
                        scr_characterspr()
                    }
                    scr_playerreset()
                    obj_player1.state = (20 << 0)
                    obj_player2.state = (20 << 0)
                    obj_player1.targetDoor = "A"
                    if instance_exists(obj_player2)
                        obj_player2.targetDoor = "A"
                    global.cowboyhat = 0
                    global.coop = false
                    state = (1 << 0)
                    return;
                }
                else
                {
                    state = (1 << 0)
                    pause = false
                    scr_unpauseinstances()
                    scr_unpausemusic()
                    pause_all_sounds(false)
					instance_activate_all()
                    scr_playerreset()
                    global.levelreset = 1
                    obj_player1.targetDoor = "A"
                    if instance_exists(obj_player2)
                        obj_player2.targetDoor = "A"
                    with (instance_create(0, 0, obj_backtohub_fadeout))
                        fadealpha = 0.9
                    return;
                }
                break
        }

    }
}
