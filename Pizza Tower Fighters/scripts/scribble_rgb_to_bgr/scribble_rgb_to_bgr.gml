function scribble_rgb_to_bgr(argument0)
{
    return (argument0 & 4278255360) | ((argument0 & 16711680) >> 16) | ((argument0 & 255) << 16);
}
