event_inherited();

if (glowSurface != -1 && surface_exists(glowSurface))
{
    surface_free(glowSurface);
    glowSurface = -1;
}
