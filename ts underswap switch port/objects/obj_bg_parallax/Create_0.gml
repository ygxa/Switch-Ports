positionGetFunc = method(undefined, xaxis ? layer_get_x : layer_get_y);
positionSetFunc = method(undefined, xaxis ? layer_x : layer_y);
cameraGetPosFunc = method(undefined, xaxis ? camera_get_view_x : camera_get_view_y);

for (var i = firstLayerId; i < 100; i++)
{
    var l = layer_get_id(_string("Parallax_{0}", i));
    
    if (l == -1)
        break;
    
    layers[i] = l;
    parallaxOffsets[i] = positionGetFunc(l);
    
    if (i == lastLayerId)
        break;
}

parallaxAmount = 0.25;
parallaxMult = 0.25;
viewOffset = 0;
disabled = false;
enableOverride = false;
