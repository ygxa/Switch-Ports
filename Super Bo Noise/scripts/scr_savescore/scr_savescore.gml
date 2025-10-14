function scr_savescore(argument0) //scr_savescore
{
    global.lastrank = global.rank
    if ((global.collect + global.collectN) >= global.srank)
    {
        global.rank = "s"
        if scr_is_p_rank()
            global.rank = "p"
        if (global.snickchallenge == 1)
            global.SAGEsnicksrank = 1
    }
    else if ((global.collect + global.collectN) > global.arank)
        global.rank = "a"
    else if ((global.collect + global.collectN) > global.brank)
        global.rank = "b"
    else if ((global.collect + global.collectN) > global.crank)
        global.rank = "c"
    else
        global.rank = "d"
    audio_stop_all();
    scr_play_rank_music()
    ini_open_from_string(obj_savesystem.ini_str)
    if (ini_read_real("Highscore", argument0, 0) < global.collect)
        ini_write_real("Highscore", argument0, global.collect)
    if (ini_read_real("Treasure", argument0, 0) == 0)
        ini_write_real("Treasure", argument0, global.treasure)
    if (global.secretfound > 3)
        global.secretfound = 3
    if (ini_read_real("Secret", argument0, 0) < global.secretfound)
        ini_write_string("Secret", argument0, global.secretfound)
    global.newtoppin[0] = 0
    global.newtoppin[1] = 0
    global.newtoppin[2] = 0
    global.newtoppin[3] = 0
    global.newtoppin[4] = 0
    if (ini_read_real("Toppin", (argument0 + "1"), 0) == 0)
    {
        if global.shroomfollow
            global.newtoppin[0] = 1
        ini_write_real("Toppin", (argument0 + "1"), global.shroomfollow)
    }
    if (ini_read_real("Toppin", (argument0 + "2"), 0) == 0)
    {
        if global.cheesefollow
            global.newtoppin[1] = 1
        ini_write_real("Toppin", (argument0 + "2"), global.cheesefollow)
    }
    if (ini_read_real("Toppin", (argument0 + "3"), 0) == 0)
    {
        if global.tomatofollow
            global.newtoppin[2] = 1
        ini_write_real("Toppin", (argument0 + "3"), global.tomatofollow)
    }
    if (ini_read_real("Toppin", (argument0 + "4"), 0) == 0)
    {
        if global.sausagefollow
            global.newtoppin[3] = 1
        ini_write_real("Toppin", (argument0 + "4"), global.sausagefollow)
    }
    if (ini_read_real("Toppin", (argument0 + "5"), 0) == 0)
    {
        if global.pineapplefollow
            global.newtoppin[4] = 1
        ini_write_real("Toppin", (argument0 + "5"), global.pineapplefollow)
    }
    if (ini_read_real("Toppin", (argument0 + "S"), 0) == 0)
    {
        if global.secretfollow
            ini_write_real("Toppin", (argument0 + "S"), global.secretfollow)
    }
    scr_write_rank(argument0)
    if global.hasFINALLYSUPERTAUNTED
        ini_write_real("Game", "supertaunt", true)
    obj_savesystem.ini_str = fixed_ini_close()
    return;
}

function scr_play_rank_music() //scr_play_rank_music
{
    var s = 3
    if (global.rank == "p")
        s = 0
		scr_soundeffect(mu_rankp)
    if (global.rank == "s")
        s = 1
		scr_soundeffect(mu_ranks)
    if (global.rank == "a")
        s = 2
		scr_soundeffect(mu_ranka)
    if (global.rank == "b")
        s = 3
		scr_soundeffect(mu_rankb)
    if (global.rank == "c")
        s = 4
		scr_soundeffect(mu_rankc)
    if (global.rank == "d")
        s = 5
		scr_soundeffect(mu_rankd)
}

function scr_write_rank(argument0) //scr_write_rank
{
    var _rank = ini_read_string("Ranks", argument0, "d")
    var _map = ds_map_create()
    ds_map_set(_map, "d", 0)
    ds_map_set(_map, "c", 1)
    ds_map_set(_map, "b", 2)
    ds_map_set(_map, "a", 3)
    ds_map_set(_map, "s", 4)
    ds_map_set(_map, "p", 5)
    if (ds_map_find_value(_map, global.rank) >= ds_map_find_value(_map, _rank))
        ini_write_string("Ranks", argument0, global.rank)
    ds_map_destroy(_map)
}

