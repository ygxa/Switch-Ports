if (!global.presence)
    exit;

discord_update();
var err = discord_get_error();

//if (err != -1)
    //show_debug_message(_string("Discord error code {0}", err));
