if (ds_list_find_index(flags.saveroom, id) != -1)
{
    if flags.do_save
    {
        if (!flags.do_once_per_save)
            self.output()
        activated = true
    }
}
