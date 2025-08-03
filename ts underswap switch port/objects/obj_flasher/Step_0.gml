if (!completed)
{
    if (slowFrame == 0)
    {
        alpha -= fadeSpeed;
        
        if (alpha <= 0)
        {
            alpha = 0;
            event_user(0);
        }
    }
    
    slowFrame = number_add_wrap(slowFrame, slowFrameMax);
}
