secret = false;
musicmap = ds_map_create();
panicmusicID = event_instance("event:/music/escape");
pillarmusicID = event_instance("event:/music/pillarmusic");
panicinit = false;
inwar = 0;
global.music = noone;
global.ranksnd = event_instance("event:/music/rank");
global.snd_escaperumble = event_instance("event:/music/escaperumble");
global.windloop = event_instance("event:/music/windloop");
add_music(TitlescreenRoom, "event:/music/mainmenu", noone, false);
add_music(hub_forcedtutorial, "event:/music/windloop", noone, false);
add_music(hub_snicksoft, "event:/music/hubSAGE", noone, false);
add_music(newtutorial_1, "event:/music/levels/tutorial", noone, false);
add_music(entry_1, "event:/music/levels/world1/entry", "event:/music/levels/world1/entrysecret", false);
add_music(medieval_1, "event:/music/levels/world1/medieval", "event:/music/levels/world1/medievalsecret", false, function(_room)
{
    var s = noone;
    
    switch (_room)
    {
        case medieval_1:
        case medieval_2:
            s = 0;
            break;
        
        case medieval_3:
        case medieval_5:
            s = 1;
            break;
        
        case medieval_6:
            s = 2;
            break;
    }
    
    if (s != noone)
        fmod_studio_event_instance_set_parameter_by_name(global.music.event, "state", s, true);
});
add_music(ruin_1, "event:/music/levels/world1/ruin", "event:/music/levels/world1/ruinsecret", false, function(_room)
{
    var s = noone;
    
    switch (_room)
    {
        case ruin_1:
        case ruin_5:
            s = 0;
            break;
        
        case ruin_6:
            s = 1;
            break;
    }
    
    if (s != noone)
        fmod_studio_event_instance_set_parameter_by_name(global.music.event, "state", s, true);
});
add_music(dungeon_1, "event:/music/levels/world1/dungeon", "event:/music/levels/world1/dungeonsecret", false);
add_music(dragonslair_1, "event:/music/levels/world1/dragonslair", "event:/music/levels/world1/dragonslairsecret", false);
fmod_studio_system_set_parameter_by_name("dynamicmuvol", 0, true);
