if (reloading)
{
    reloading = false;
    //show_debug_message("Reload data not received, canceling");
    
    if (file_exists("diannex_reload"))
        file_delete("diannex_reload");
}
