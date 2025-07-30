function scr_textureload(argument0 = global.levelname)
{
    static prevtex = -1;
    
    if (argument0 == -4 && string_starts_with(room_get_name(room), "hub"))
    {
        argument0 = "hub";
    }
    else if (argument0 == "dragonslair")
    {
        switch (room)
        {
            case dragonslair_5:
            case dragonslair_7:
                argument0 = "medieval";
                break;
            
            case dragonslair_8:
            case dragonslair_10:
                argument0 = "ruin";
                break;
            
            case dragonslair_11:
                argument0 = "dungeon";
                break;
        }
    }
    
    var groups = ["chateau", "beach", "city", "dungeon", "desert", "entrance", "etb", "factory", "golf", "graveyard", "hub", "mansion", "medieval", "sewer", "smb", "space", "strongcold", "ruin", "war", "kungfu"];
    
    if (prevtex == argument0 || array_get_index(groups, argument0) == -1)
        exit;
    
    for (var i = 0; i < array_length(groups); i++)
    {
        if (argument0 != groups[i])
        {
            //t = texturegroup_get_textures(groups[i]);
            
            //for (var l = 0; l < array_length(t); l++)
                //texture_flush(t[l]);
        }
    }
    
    //var t = texturegroup_get_textures(t);
    
    //for (var l = 0; l < array_length(t); l++)
        //texture_prefetch(t[l]);
    
    prevtex = argument0;
}
