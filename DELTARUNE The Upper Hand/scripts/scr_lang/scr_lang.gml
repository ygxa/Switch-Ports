function lang_quit()
{
    if (op.language == 1 && room == rMainMenu)
        ext(sQuit, floor(escape / 10), 4, 4, undefined, undefined, undefined, undefined, escape / 10);
}
