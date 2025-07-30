function scr_player_comingoutdoor()
{
    collide_destructibles = function(argument0, argument1)
    {
        scr_destroy_horizontal(argument0, (2 << 0));
    };
    
    movespeed = 0;
    mach2 = 0;
    jumpAnim = 1;
    dashAnim = 1;
    landAnim = 0;
    moveAnim = 1;
    stopAnim = 1;
    crouchslideAnim = 1;
    crouchAnim = 1;
    machhitAnim = 0;
    hsp = 0;
    doorblend = (image_index + 1) / image_number;
    
    if (floor(image_index) == (image_number - 1))
    {
        if (!place_meeting(x, y, obj_exitgate))
        {
            state = (0 << 0);
            image_index = 0;
        }
        
        start_running = 1;
        movespeed = 0;
        image_alpha = 1;
        image_blend = c_white;
        doorblend = 1;
    }
	
	var fuck = [obj_door, obj_keydoor, obj_doorblocked, obj_exitgate, obj_startgate, obj_geromedoor]
    var ass = 0;
	for (var _i = 0; _i < array_length(fuck); _i++) {
	    ass += place_meeting(x, y, fuck[_i]);
	}
    if (place_meeting(x, y, ass))
        sprite_index = spr_walkfront;
    else
        state = (0 << 0);
    
    image_speed = 0.35;
}
