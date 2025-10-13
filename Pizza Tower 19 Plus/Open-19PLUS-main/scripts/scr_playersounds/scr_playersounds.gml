function scr_playersounds()
{
	var _attr;
    with (obj_player)
    {
        _attr = new Fmod3DAttributes();
        _attr.position.x = x;
        _attr.position.y = y;
        _attr.position.z = 0;
        _attr.forward.z = 1;
        _attr.up.y = 1;
        
        if (instance_exists(obj_pizzaface))
        {
            if (event_isplaying(obj_pizzaface.movingsnd))
            {
                var _val = (800 - distance_to_object(obj_pizzaface)) / 800;
                fmod_studio_system_set_parameter_by_name("pizzafaceattenuation", _val * obj_pizzaface.image_alpha, true);
            }
            else
                fmod_studio_system_set_parameter_by_name("pizzafaceattenuation", 0, true);
        }
        else
            fmod_studio_system_set_parameter_by_name("pizzafaceattenuation", 0, true);
        
        if (character != "N")
        {
            char_jumpsnd = jumpsnd;
            char_machsnd = machsnd;
            char_machbreaksnd = machbreaksnd;
            char_machturnsnd = machturnsnd;
            char_superjumpsnd = superjumpsnd;
            char_hurtsnd = hurtsnd;
        }
        else
        {
            char_jumpsnd = noisejumpsnd;
            char_machsnd = noisemachsnd;
            char_machbreaksnd = noisemachbreaksnd;
            char_machturnsnd = noisemachturnsnd;
            char_superjumpsnd = noisesuperjumpsnd;
            char_hurtsnd = noisehurtsnd;
        }
        
        if (state == states.mach2 || state == states.mach3 || state == states.hitstun || state == states.climbwall)
        {
            if (!event_isplaying(char_machsnd))
                fmod_studio_event_instance_start(char_machsnd);
            
            s = 0;
            
            if ((state == states.mach2 && sprite_index == spr_mach1 && character != "N") || (state == states.mach2 && character == "N"))
                s = 1;
            else if ((state == states.mach2 && sprite_index == spr_mach && character != "N") || (state == states.mach2 && character == "N") || state == states.climbwall)
                s = 2;
            else if ((state == states.mach3 || state == states.hitstun) && (sprite_index == spr_mach4 || sprite_index == spr_rollgetup || sprite_index == spr_mach3hit || sprite_index == spr_mach3jump) && sprite_index != spr_crazyrun)
                s = 3;
            else if (sprite_index == spr_crazyrun)
                s = 4;
            
            if (character == "N")
                fmod_studio_event_instance_set_parameter_by_name(char_machsnd, "ground", grounded, true);
            
            fmod_studio_event_instance_set_parameter_by_name(char_machsnd, "state", s, true);
            event_set_3d_position_struct(char_machsnd, _attr);
        }
        else
            event_stop(char_machsnd, true);
        
        if (state != states.suplexgrab && state != states.shoulderbash && state != states.lunge)
            event_stop(suplexdashsnd, true);
        
        event_set_3d_position_struct(suplexdashsnd, _attr);
        
        if (state != states.mach2 && state != states.mach3 && sprite_index != spr_player_longjumpstart && sprite_index != spr_player_longjump)
            event_stop(longjumpsnd, true);
        
        event_set_3d_position_struct(longjumpsnd, _attr);
        
        if (state == states.sjumpprep || state == states.sjump || (state == states.hitstun && sprite_index == spr_superjump))
        {
            if (state == states.sjumpprep)
            {
                if (!event_isplaying(char_superjumpsnd))
                    fmod_studio_event_instance_start(char_superjumpsnd);
                
                fmod_studio_event_instance_set_parameter_by_name(char_superjumpsnd, "state", 0, true);
            }
            else if (state == states.sjump)
                fmod_studio_event_instance_set_parameter_by_name(char_superjumpsnd, "state", 1, true);
            
            event_set_3d_position_struct(char_superjumpsnd, _attr);
        }
        else
            event_stop(char_superjumpsnd, true);
        
        if (state != states.freefallprep && state != states.freefall && state != states.superslam && state != states.hitstun)
            event_stop(groundpoundfallsnd, true);
        else
            event_set_3d_position_struct(groundpoundfallsnd, _attr);
        
        if ((state == states.knightpepslopes && grounded && vsp > 0) || state == states.grind)
        {
            if (!event_isplaying(knightslidesnd))
                fmod_studio_event_instance_start(knightslidesnd);
            
            event_set_3d_position_struct(knightslidesnd, _attr);
        }
        else
            event_stop(knightslidesnd, true);
        
        if (sprite_index == spr_bombpeprun || sprite_index == spr_bombpeprunabouttoexplode)
        {
            if (!event_isplaying(bombpep1snd))
                fmod_studio_event_instance_start(bombpep1snd);
            
            event_set_3d_position_struct(bombpep1snd, _attr);
        }
        else if (sprite_index != spr_bombpeprun && sprite_index != spr_bombpeprunabouttoexplode && event_isplaying(bombpep1snd))
            event_stop(bombpep1snd, true);
        
        if (sprite_index == spr_barrelroll && grounded)
        {
            if (!event_isplaying(barrelsnd))
                fmod_studio_event_instance_start(barrelsnd);
            
            event_set_3d_position_struct(barrelsnd, _attr);
        }
        else
            event_stop(barrelsnd, true);
        
        if (state == states.boxxedpep)
        {
            if (!event_isplaying(boxxeddashsnd))
                fmod_studio_event_instance_start(boxxeddashsnd);
            
            s = 0;
            
            if (sprite_index == spr_boxxeddash && grounded)
                s = 1;
            
            fmod_studio_event_instance_set_parameter_by_name(boxxeddashsnd, "state", s, true);
            event_set_3d_position_struct(boxxeddashsnd, _attr);
        }
        else
            event_stop(boxxeddashsnd, true);
        
        if (state == states.weeniemount)
        {
            if (hsp != 0)
            {
                if (!event_isplaying(weeniegallopingsnd))
                    fmod_studio_event_instance_start(weeniegallopingsnd);
                
                event_set_3d_position_struct(weeniegallopingsnd, _attr);
            }
            else
                event_stop(weeniegallopingsnd, true);
        }
        else
            event_stop(weeniegallopingsnd, true);
        
        if (sprite_index == spr_machroll || sprite_index == spr_longjumpslidestart || sprite_index == spr_longjumpslide)
        {
            if (!event_isplaying(machrollsnd))
                fmod_studio_event_instance_start(machrollsnd);
            
            event_set_3d_position_struct(machrollsnd, _attr);
        }
        else
            event_stop(machrollsnd, true);
        
        var s = 0;
        
        if (sprite_index == spr_tumblestart || sprite_index == spr_tumble)
        {
            if (!event_isplaying(tumblesnd))
            {
                fmod_studio_event_instance_start(tumblesnd);
                s = 0;
                
                if (sprite_index == spr_tumblestart)
                    tumbleintro = true;
            }
            
            if (sprite_index == spr_tumble && !tumbleintro)
                s = 0.5;
        }
        else
        {
            s = 1;
            tumbleintro = false;
        }
        
        if (sprite_index == spr_swingding)
        {
            if (!event_isplaying(swingdingsnd))
                fmod_studio_event_instance_start(swingdingsnd);
            
            event_set_3d_position_struct(swingdingsnd, _attr);
        }
        else
            event_stop(swingdingsnd, true);
        
        event_set_3d_position_struct(tumblesnd, _attr);
        fmod_studio_event_instance_set_parameter_by_name(tumblesnd, "state", s, true);
        event_set_3d_position_struct(PrandomVA, _attr);
        event_set_3d_position_struct(PcollectVA, _attr);
        event_set_3d_position_struct(PhurtVA, _attr);
        event_set_3d_position_struct(PtransfoVA, _attr);
        event_set_3d_position_struct(NrandomVA, _attr);
        event_set_3d_position_struct(NhurtVA, _attr);
        event_set_3d_position_struct(divesnd, _attr);
        event_set_3d_position_struct(priestsnd, _attr);
        event_set_3d_position_struct(slipsnd, _attr);
        event_set_3d_position_struct(swingdingsnd, _attr);
    }
    
    if (state == states.mach2 && character == "N" && (sprite_index == spr_playerN_sidewayspin || sprite_index == spr_playerN_sidewayspinend))
    {
        if (!event_isplaying(airspinsnd))
            fmod_studio_event_instance_start(airspinsnd);
        
        event_set_3d_position_struct(airspinsnd, _attr);
    }
    else
        event_stop(airspinsnd, true);
    
    if (state == states.nwalljump && character == "N" && sprite_index == spr_playerN_wallbounce)
    {
        if (!event_isplaying(wallbouncesnd))
            fmod_studio_event_instance_start(wallbouncesnd);
        
        event_set_3d_position_struct(wallbouncesnd, _attr);
    }
    else
        event_stop(wallbouncesnd, true);
    
    if (state == states.nwalljump && character == "N" && (sprite_index == spr_playerN_divebomb || sprite_index == spr_playerN_divebombfall || sprite_index == spr_playerN_divebombland))
    {
        if (!event_isplaying(noisetornadosnd))
            fmod_studio_event_instance_start(noisetornadosnd);
        
        var s = 0;
        
        if (sprite_index == spr_playerN_divebombfall || sprite_index == spr_playerN_divebombland)
            s = 0;
        else if (sprite_index == spr_playerN_divebomb)
            s = 1;
        
        event_set_3d_position_struct(noisetornadosnd, _attr);
        fmod_studio_event_instance_set_parameter_by_name(noisetornadosnd, "state", s, true);
    }
    else
        event_stop(noisetornadosnd, true);
}
