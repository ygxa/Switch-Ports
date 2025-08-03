if (disabled)
    exit;

if (enableOverride || !obj_gamemanager.customViewMode || instance_exists(obj_camera))
{
    var viewCoord = cameraGetPosFunc(view_get_camera(0)) + viewOffset;
    var parallax = parallaxAmount;
    var i = array_length(layers) - 1;
    
    while (i >= 0)
    {
        positionSetFunc(layers[i], floor(viewCoord * parallax) + parallaxOffsets[i]);
        parallax += parallaxMult;
        i--;
    }
}
