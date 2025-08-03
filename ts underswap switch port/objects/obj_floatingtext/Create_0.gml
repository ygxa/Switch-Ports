alpha = 0;
str = "Error";
time = 50;
offset = 0;
alarm[0] = 1;

processTextOffset = function()
{
    if (string_starts_with(str, "`offset:"))
    {
        var endPos = string_pos_ext("`", str, 9);
        var pos = string_split(string_copy(str, 9, endPos - 9), ",");
        x += real(pos[0]);
        y += real(pos[1]);
        str = string_delete(str, 1, endPos);
    }
};
