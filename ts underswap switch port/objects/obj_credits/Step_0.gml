if (showBg)
{
    if (enterBg)
    {
        var allDone = true;
        
        for (var i = 0; i < array_length(bgLayer); i++)
        {
            if (bgLayer[i] != -1)
            {
                var a = bgLayerYDone[i];
                var b = bgLayerAlphaDone[i];
                var temp = number_approach_smooth(bgLayerY[i], a, bgLayerEnterSpeed[i], 1);
                bgLayerY[i] = temp;
                bgLayerAlpha[i] += bgLayerAlphaSpeed[i];
                
                if (bgLayerAlpha[i] >= b)
                {
                    bgLayerAlpha[i] = b;
                    allDone &= (a == temp);
                }
                else
                {
                    allDone = false;
                }
            }
        }
        
        if (allDone)
            enterBg = false;
    }
    
    if (bgFrameSpeed != 0)
    {
        bgFrame += bgFrameSpeed;
        
        if (floor(bgFrame) >= bgFrameCount)
            bgFrame = 0;
    }
    
    for (var i = 0; i < array_length(bgLayer); i++)
    {
        if (bgLayer[i] != -1)
        {
            var s = bgLayerSpeed[i] * 2;
            var w = bgLayerWidth[i] * 2;
            var nw = -w;
            bgLayerX[i] += s;
            bgLayerX2[i] += s;
            
            if (s < 0 && bgLayerX[i] <= nw)
                bgLayerX[i] = w - (nw - bgLayerX[i]);
            else if (bgLayerX[i] >= w)
                bgLayerX[i] = nw + (bgLayerX[i] - w);
            
            if (s < 0 && bgLayerX2[i] <= nw)
                bgLayerX2[i] = w - (nw - bgLayerX2[i]);
            else if (bgLayerX2[i] >= w)
                bgLayerX2[i] = nw + (bgLayerX2[i] - w);
        }
    }
}

if (!fader && (creditsY < (-currY - 80) || (global.control_cancel && (global.credits_from_menu || ds_map_find_value(global.pflags_global, "skip_credits") == 2))))
{
    os_powersave_enable(true);
    fader = true;
    var f = instance_create(obj_fader);
    f.fadeSpeed = 0.025;
    
    f.completeCallback = function()
    {
        audio_kill_all();
        
        if (global.credits_from_menu)
        {
            global.credits_from_menu = false;
            call_later_safe(1, 0, function()
            {
                if (file_exists(_string("file{0}", global.save_variant)))
                    room_goto(rm_load);
                else
                    room_goto(rm_menu_start);
            });
        }
        else
        {
            instance_create(obj_creditsender);
        }
    };
    
    f.destroy = false;
    f.fadeMusic = true;
    f.dontDraw = true;
}
