var len = array_length(updates);
var i = len - 1;

repeat (len)
{
    updates[i](i);
    i--;
}

image_angle = angle + 180;
