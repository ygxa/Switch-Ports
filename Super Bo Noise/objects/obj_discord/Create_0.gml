var app_id = "1247189971903975467"
ready = 0
if (!(np_initdiscord(app_id, true, 0)))
{
    show_debug_message("Failed to initiate Discord presence.")
    instance_destroy()
}
largeimage = "biglogo"
smallimage = ""
largeimagetext = ""
smallimagetext = ""
state = ""
details = ""
