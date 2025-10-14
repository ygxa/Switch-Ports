if (textbuffer > 0)
    textbuffer--
else
{
    currentpos++
    if (currentpos <= string_length(currenttext))
    {
        displaytext = string_insert(string_char_at(currenttext, currentpos), displaytext, (string_length(displaytext) + 1))
        displaytext = scr_separate_text(displaytext)
        textbuffer = textspeed
    }
    else if input_check_pressed("jump")
    {
        if (currentdialog < (array_length(dialog) - 1))
        {
            currentdialog++
            currentpos = 0
            textbuffer = textspeed
            displaytext = ""
            currenttext = scr_calculate_text(dialog[currentdialog][0])
            input_check_pressed("jump")
            dialogheight = scr_calculate_height(currenttext)
            dialogsprite = dialog[currentdialog][1]
            var func = dialog[currentdialog][2]
            if (func != -4)
            {
                if (npcID != noone && instance_exists(npcID))
                {
                    with (npcID)
                        method(id, func)()
                }
                else
                    method(id, func)()
            }
        }
        else
            instance_destroy()
    }
}
if (currentpos < string_length(currenttext) && input_check_pressed("jump"))
{
    while (currentpos <= string_length(currenttext))
    {
        currentpos++
        displaytext = string_insert(string_char_at(currenttext, currentpos), displaytext, (string_length(displaytext) + 1))
        displaytext = scr_separate_text(displaytext)
    }
}
