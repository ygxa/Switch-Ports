function cutscene_superpinball_start()
{
    var _finish = 0;
    
    with (obj_player1)
    {
        if (state != 114 && state != 97)
            _finish = 1;
    }
    
    if (_finish)
    {
        with (obj_player1)
        {
            if (check_player_coop())
            {
                state = 148;
                sprite_index = spr_idle;
            }
        }
        
        cutscene_end_action();
    }
}

function cutscene_superpinball_middle()
{
    var t = -4;
    
    with (obj_superpinballmachine)
    {
        x -= other.movespeed;
        t = id;
    }
    
    movespeed += 0.25;
    
    with (obj_player1)
    {
        if (check_player_coop())
        {
            x = t.x + (t.sprite_width / 2);
            y = t.bbox_top - 46;
        }
    }
    
    if (t.x < 96)
        cutscene_end_action();
}

function cutscene_superpinball_middle2()
{
    with (obj_player1)
    {
        if (vsp >= 0 && check_player_coop())
        {
            vsp = -12;
            hsp = -10;
        }
    }
    
    if (obj_player1.x < 0)
        cutscene_end_action();
}

function cutscene_superpinball_middle3()
{
    with (obj_player1)
    {
        if (check_player_coop())
        {
            vsp = -12;
            hsp = -10;
        }
    }
    
    cutscene_end_action();
}

function cutscene_superpinball_middle4()
{
    if (obj_player1.y > global.resolutions[0][1][1])
        cutscene_end_action();
}

function cutscene_superpinball_middle5()
{
    with (obj_player1)
    {
        if (check_player_coop())
        {
            vsp = 20;
            hsp = 0;
        }
    }
    
    cutscene_end_action();
}

function cutscene_superpinball_end()
{
    with (obj_player1)
    {
        if (check_player_coop())
            state = 2;
    }
    
    global.pubcutscene = 1;
    quick_ini_write_real(get_savefile_ini(), "cutscene", "pub", 1);
    cutscene_end_action();
}

function check_player_coop()
{
    return object_index != obj_player2 || global.coop;
}
